using RentACar.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RentACar
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!User.Identity.IsAuthenticated)
            //{

            //    Response.Redirect("/Account/Login");
            //}
        }

        protected void Create_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
               
                return;
            }
            string validExts = ".jpg|.jpeg|.png";
            var extension = Path.GetExtension(CarPhoto.FileName);
            if (!validExts.Contains(extension) || !CarPhoto.PostedFile.ContentType.StartsWith("image"))
            {
                ModelState.AddModelError("", "Yanlış Dosya Türü");
            }
            var uniqueName = Guid.NewGuid().ToString() + extension;
            var path = Server.MapPath("~/CarImages/") + uniqueName;
            CarPhoto.PostedFile.SaveAs(path);
            using (ApplicationDbContext context  = new ApplicationDbContext())
            {
                Car car = new Car
                {
                    PlateNumber = PlateNumber.Text,
                    Color = Color.Text,
                    DailyPrice = decimal.Parse(Price.Text),
                    Photo = uniqueName
                };
                context.Cars.Add(car);
                context.SaveChanges();
                PlateNumber.Text = "";
                Color.Text = "";
                Price.Text = "";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Başarıyla Eklendi.')", true);

            }
        }
    }
}