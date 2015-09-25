using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NHCostumes
{
    public partial class paid : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string itemsincart2;
            try
            {
                itemsincart2 = Request.Cookies["nhcart"].Value;
            }
            catch (System.NullReferenceException)
            {
                itemsincart2 = "";
            }
            string[] itemsincart = itemsincart2.Split(',');
            for (int i = 0; i < itemsincart.Length; i++)
            {
                try
                {
                    string[] currentitem = itemsincart[i].Split(':');
                    int id = Int32.Parse(currentitem[0]);
                    int qty = Int32.Parse(currentitem[1]);
                    bool rent = (currentitem[2] == "true");
                    string sql = "UPDATE costumes SET quantity = quantity - " + qty + " WHERE item_id = " + id + ";";
                    System.Diagnostics.Debug.WriteLine(sql);
                    string CnStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
                    SqlConnection adp = new SqlConnection(CnStr);
                    SqlCommand sqlCmd = new SqlCommand(sql, adp);
                    adp.Open();
                    sqlCmd.ExecuteNonQuery();
                    adp.Close();
                }

                catch
                {
                }
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "JsFunc", "clearCart()", true);
        }
    }
 }