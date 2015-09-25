using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace NHCostumes
{
    public partial class PayInPerson : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["nhcart"].Value.Split(',').Length < 1 || Request.Cookies["nhcart"].Value == "") mainform.InnerHtml = "<h2>There are no items in your cart to submit</h2>";
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.To.Add("nhcostumes@gmail.com");
                mailMessage.From = new MailAddress(Email.Text);
                mailMessage.Subject = "Website Order Form " + Name.Text;
                mailMessage.Body += "New order from: " + Name.Text + "<br/><br/>";
                mailMessage.Body += "Email address: " + Email.Text + "<br/><br/>";
                mailMessage.Body += "Phone number: " + PhoneNumber.Text + "<br/><br/>";
                mailMessage.Body += "Comments: " + Comments.Text + "<br/><br/>";

                string[] itemsincart = Request.Cookies["nhcart"].Value.Split(',');
                double total = 0;
                for (int i = 0; i < itemsincart.Length; i++)
                {
                    string[] currentitem = itemsincart[i].Split(':');
                     int id = Int32.Parse(currentitem[0]);
                    int qty = Int32.Parse(currentitem[1]);
                    bool rent = (currentitem[2] == "true");
                    string sql = "SELECT TOP 1 * FROM costumes WHERE item_id = " + id + ";";
                    string CnStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
                    SqlDataAdapter adp = new SqlDataAdapter(sql, CnStr);
                    DataSet ds = new DataSet();
                    adp.Fill(ds, "TableName");
                    DataTable dt = new DataTable();
                    dt = ds.Tables[0];
                    string item = "";
                    item = "Item Id: " + id.ToString() + "<br/>";
                    item += "Item title: " + dt.Rows[0]["title"].ToString() + "<br/>";
                    if (rent) item += "Rental<br/>";
                    else item += "Purchase<br/>";
                    double price;
                    if (rent) { price = Double.Parse(dt.Rows[0]["rental"].ToString()); }
                    else price = Double.Parse(dt.Rows[0]["purchase"].ToString());
                    item += "Price: " + string.Format("{0:C02}", price) + "<br/>";
                    int max = Int32.Parse(dt.Rows[0]["quantity"].ToString());
                    if (max > 1) item += "Quantity: " + qty.ToString() + "<br/>";
                    else item += "Quantity: 1<br/>";
                    item += "Total for item: " + string.Format("{0:C02}", qty * price) + "<br/>";
                    total += qty * price;
                    mailMessage.Body += item + "<br/>";
                }
                mailMessage.Body += "Total: " + string.Format("{0:C02}", total);
                mailMessage.IsBodyHtml = true;
                SmtpClient smtpClient = new SmtpClient();
                smtpClient.Send(mailMessage);
                Request.Cookies["nhcart"].Expires = DateTime.Now.AddDays(-1);
                Request.Cookies["nhcart"].Value = "";
                mainform.InnerHtml = "<h1>Your order has been submitted.  Thank you, we'll be in touch</h1>";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "JsFunc", "clearCart()", true);

            }
            catch (Exception ex)
            {
                mainform.InnerHtml = "<h3>There was an error with the order</h3> - error: " + ex.Message;
            }
        }
    }
}