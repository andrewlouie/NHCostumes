using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace NHCostumes
{
    public partial class Item : System.Web.UI.Page
    {
        private string idvariable;
        private string sql;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(Request.QueryString["id"])) { aastitle.InnerHtml = "Item not found";  return; }
            }
            catch (NullReferenceException)
            {
                aastitle.InnerHtml = "Item not found"; 
                return;
            }
            catch (HttpException)
            {
                aastitle.InnerHtml = "Item not found"; 
                return;
            }
            idvariable = Request.QueryString["id"].ToString();
            sql = "SELECT TOP 1 * FROM costumes WHERE item_id = " + idvariable + ";";
            try
            {
                string CnStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
                SqlDataAdapter adp = new SqlDataAdapter(sql, CnStr);
                DataSet ds = new DataSet();
                adp.Fill(ds, "TableName");
                DataTable dt = new DataTable();
                dt = ds.Tables[0];
                if (dt.Rows[0]["visible"].ToString() == "0") { aastitle.InnerHtml = "Item not found"; return; }
                aasdesc.InnerHtml = dt.Rows[0]["description"].ToString();
                aascat2.InnerHtml = dt.Rows[0]["topcategory"].ToString();
                aascat2.HRef = "/" + dt.Rows[0]["topcategory"].ToString();
                aasize.InnerHtml += dt.Rows[0]["size"].ToString();
                aascat.InnerHtml = dt.Rows[0]["category"].ToString();
                if (dt.Rows[0]["condition"].ToString() != "") aacondition.InnerHtml += dt.Rows[0]["condition"].ToString();
                else aacondition.Visible = false;
                aastitle.InnerHtml = dt.Rows[0]["title"].ToString();
                quantity.Attributes.Add("max", dt.Rows[0]["quantity"].ToString());
                quantity.Attributes.Add("min", "1");
                this.Page.Title = dt.Rows[0]["title"].ToString();
                aaprice2.InnerHtml = string.Format("{0:C02}", dt.Rows[0]["purchase"]);
                aaprice.InnerHtml = string.Format("{0:C02}", dt.Rows[0]["rental"]);
                if (Double.Parse(dt.Rows[0]["purchase"].ToString()) <= 0)
                {
                    aaprice2.Visible = false;
                    Button2.Visible = false;
                }
                aaqty.InnerHtml = dt.Rows[0]["quantity"].ToString();
                aascat.HRef = "/" + dt.Rows[0]["topcategory"].ToString() + "#" + dt.Rows[0]["category"].ToString();
                string[] pictures = dt.Rows[0]["pictures"].ToString().Split(',');
                mainimg.Src = "images/" + pictures[0];
                mainlink.HRef = "images/" + pictures[0];
                string thumbstring = "<ul ID='first-carousel' class='carousel jcarousel-skin-tango'><li><a href='images/" +
                    pictures[0] +
                    "' class='tnsmall'><img src='images/" +
                    pictures[0] +
                    "'/></a></li>";
                for (int i=1;i<pictures.Length;i++)
                {
                    thumbstring += "<li><a href='images/" + 
                    pictures[i] + 
                    "' class='tnsmall' rel='gallery'><img src='images/" + 
                    pictures[i] + 
                    "'/></a></li>";
                }
                aasthumbs.InnerHtml = thumbstring + "</ul>";
                if (dt.Rows[0]["quantity"].ToString() == "0" || dt.Rows[0]["visible"].ToString() == "0")
                {
                    Button2.Disabled = true;
                    Button1.Disabled = true;
                    notavail.InnerHtml = "<strong>Sorry, this item is currently unavailable</strong>";
                }
            }
            catch (System.Exception exc)
            {
                Title = "Error: Page Not Found";
                aastitle.InnerHtml = "Item not found";
                aasdesc.InnerHtml = exc.Message;
            }
        }
        protected void Page_PreInit(object sender, EventArgs e)
        {
            Page.Title = "something";
        }
    }
}