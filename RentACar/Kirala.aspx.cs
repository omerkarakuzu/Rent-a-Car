using Microsoft.AspNet.Identity;
using RentACar.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RentACar
{
    public partial class Kirala : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //Kirala.aspx?id=5 --> Bu 5'i almamız gerek.
                int id = 0;
                try
                {
                    id = int.Parse(Request.QueryString["id"].ToString());
                }
                catch (Exception)
                {
                    Response.Redirect("/");

                }
                using (var ctx = new ApplicationDbContext())
                {
                    var car = ctx.Cars.Find(id);
                    if (car == null)
                    {
                        Response.Redirect("/");
                        return;
                    }
                    photo.ImageUrl = $"/CarImages/{car.Photo}";
                    ViewState["price"] = car.DailyPrice;
                    lblDailyPrice.Text = (string.Format("{0:N}", car.DailyPrice)) + "₺";
                    lblPlateNumber.Text = car.PlateNumber;

                }

            }

        }

        protected void Rent_Click(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
            {
                //Response.Redirect("/Account/Login");
                Response.Redirect("/Account/Login.aspx?login="+ kytol.Text);

                return;
            }
            //Kirala.aspx?id=5 --> Bu 5'i almamız gerek.
            int id = 0;
            try
            {
                id = int.Parse(Request.QueryString["id"].ToString());
            }
            catch (Exception)
            {
                Response.Redirect("/");

            }
            using (var ctx = new ApplicationDbContext())
            {
                var car = ctx.Cars.Find(id);
                if (car == null)
                {
                    Response.Redirect("/");
                    return;
                }
                var userId = User.Identity.GetUserId();
                DateTime startDate = DateTime.Parse(txtStartDate.Text);
                DateTime endDate = DateTime.Parse(txtEndDate.Text);
                double totalDays = Math.Floor((endDate - startDate).TotalDays);
                var totalPrice = (decimal)totalDays * (decimal)ViewState["price"];
                if (totalPrice < 0)
                {
                    throw new Exception("Fiyat 0'dan küçük olamaz.");
                }

                CarRental carRental = new CarRental
                {
                    ApplicationUserId = userId,
                    CarId = car.Id,
                    StartDate = startDate,
                    EndDate = endDate,
                    TotalPrice = totalPrice,
                };
                ctx.CarRentals.Add(carRental);
                car.TotalRentCount += 1;
                ctx.SaveChanges();
                Response.Redirect("/Odeme");
            }
            

        }
        protected void CalCulateTotalPrice()
        {
            try
            {
                DateTime startDate = DateTime.Parse(txtStartDate.Text);
                DateTime endDate = DateTime.Parse(txtEndDate.Text);
                Console.Write(endDate);
                double totalDays = Math.Floor((endDate - startDate).TotalDays);
                lblTotalPrice.Text = (((decimal)totalDays * (decimal)ViewState["price"]).ToString()) + "₺";
             

            }
            catch (Exception)
            {

                throw;
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            CalCulateTotalPrice();
        }

        protected void txtEndDate_TextChanged(object sender, EventArgs e)
        {
       
            CalCulateTotalPrice();
        }

        protected void txtStartDate_TextChanged(object sender, EventArgs e)
        {

        }
    }
}