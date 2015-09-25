using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;

namespace NHCostumes
{
    public partial class Site2 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.Title == "Children") lichild.Attributes.Add("class", "active");
            if (Page.Title == "Adults") liadult.Attributes.Add("class", "active");
            if (Page.Title == "Accessories") liaccessories.Attributes.Add("class", "active");
            if (Page.Title == "Welcome") lihome.Attributes.Add("class", "active");
            if (Page.Title == "Consignors") liconsignors.Attributes.Add("class", "active");
            if (Page.Title == "About Us") liabout.Attributes.Add("class", "active");
            if (Page.Title == "FAQ") lifaq.Attributes.Add("class", "active");
            if (Page.Title == "Contact Us") licontact.Attributes.Add("class", "active");

            try {
                if (Request.Cookies["nhcart"].Value == "") itemsincart.InnerText = "0";
                else itemsincart.InnerText = Request.Cookies["nhcart"].Value.Split(',').Length.ToString();
            }
            catch (System.NullReferenceException) {
                itemsincart.InnerText = "0";
            }
        }

        protected void aasearchbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Results.aspx?search=" + aasearchbox.Text);
        }
    }
}