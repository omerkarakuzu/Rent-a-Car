using RentACar.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RentACar
{
    public partial class ShowCarList : System.Web.UI.UserControl
    {
        public List<Car> Data { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                rptCars.DataSource = Data;
                rptCars.DataBind();
            }
        }
    }
}