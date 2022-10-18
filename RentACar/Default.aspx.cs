using RentACar.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RentACar
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                using (var ctx = new ApplicationDbContext())
                {
                    var topCars = ctx.Cars.OrderByDescending(c => c.TotalRentCount).Take(6).ToList();
                    TopShowCarList.Data = topCars;

                    FirsatShowCarList.Data = ctx.Cars.OrderBy(c => c.DailyPrice).Take(6).ToList();
                }
            }
        }
    }
}