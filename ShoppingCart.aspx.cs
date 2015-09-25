using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NHCostumes
{
    public partial class ShoppingCart : System.Web.UI.Page
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
            Literal1.Text = "";
            int j = 0;
            double total = 0;
            double deposit = 0;
            for (int i = 0; i < itemsincart.Length; i++)
            {
                try
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
                    double rprice;
                    double pprice;
                    if (TextBox1.Text == "GHOST57")
                    {
                        rprice = Double.Parse(dt.Rows[0]["rental"].ToString()) * .9;
                        pprice = Double.Parse(dt.Rows[0]["purchase"].ToString()) * .9;
                        Label2.Text = "Code Accepted";
                    }
                    else
                    {
                        rprice = Double.Parse(dt.Rows[0]["rental"].ToString());
                        pprice = Double.Parse(dt.Rows[0]["purchase"].ToString());
                        if (TextBox1.Text != "") Label2.Text = "Invalid Code";
                    }
                    TableRow tr = new TableRow();
                    TableCell tc1 = new TableCell();
                    tc1.Text = id.ToString();
                    TableCell tc2 = new TableCell();
                    Image tn = new Image();
                    string[] pictures = dt.Rows[0]["pictures"].ToString().Split(',');
                    tn.ImageUrl = "images/" + pictures[0];
                    tn.Height = 50;
                    Label il = new Label();
                    il.Text = dt.Rows[0]["title"].ToString();
                    HyperLink hl = new HyperLink();
                    hl.NavigateUrl = "Item.aspx?id=" + id.ToString();
                    tc2.Controls.Add(hl);
                    hl.Controls.Add(tn);
                    hl.Controls.Add(il);
                    TableCell tc3 = new TableCell();
                    DropDownList dd = new DropDownList();
                    dd.Items.Add("Rent");
                    if (pprice <= 0) rent = true;
                    else dd.Items.Add("Buy");
                    dd.Attributes.Add("onchange","rbupdate(" + i + ",this.value)");
                    dd.AutoPostBack = true;
                    if (rent) dd.Items[0].Selected = true;
                    else dd.Items[1].Selected = true;
                    tc3.Controls.Add(dd);
                    TableCell tc4 = new TableCell();
                    double price;
                    if (rent) { price = rprice; if (dt.Rows[0]["topcategory"].ToString() == "Adult") deposit += 20; else deposit += 10;  }
                    else price = pprice;
                    tc4.Text = string.Format("{0:C02}",price);
                    TableCell tc5 = new TableCell();
                    int max = Int32.Parse(dt.Rows[0]["quantity"].ToString());
                    if (max > 1)
                    {
                        TextBox num = new TextBox();
                        num.ID = "qtybox" + i;
                        num.Attributes.Add("type", "number");
                        num.Attributes.Add("min", "1");
                        num.Attributes.Add("step", "1");
                        num.Attributes.Add("max", max.ToString());
                        num.Text = qty.ToString();
                        Button ub = new Button();
                        ub.CssClass = "btn btn-warning";
                        ub.Text = "Update";
                        ub.Attributes.Add("onclick", "updatebtn(" + i + ",this.previousSibling.value)");
                        tc5.Controls.Add(num);
                        tc5.Controls.Add(ub);
                    }
                    else
                    {
                        qty = 1;
                        tc5.Text = "1";
                    }
                    TableCell tc6 = new TableCell();
                    tc6.Text = string.Format("{0:C02}",qty * price);
                    total += qty * price;
                    TableCell tc7 = new TableCell();
                    Button rb = new Button();
                    rb.Text = "Remove";
                    
                    rb.CssClass = "btn btn-remove";
                    rb.Attributes.Add("onclick", "removebtn(" + i + ")");
                    tc7.Controls.Add(rb);
                    tr.Cells.Add(tc1);
                    tr.Cells.Add(tc2);
                    tr.Cells.Add(tc3);
                    tr.Cells.Add(tc4);
                    tr.Cells.Add(tc5);
                    tr.Cells.Add(tc6);
                    tr.Cells.Add(tc7);
                    Table1.Rows.Add(tr);
                    j = i + 1;
                    Literal1.Text += "<input type='hidden' name='item_name_" + j + "' value='" + dt.Rows[0]["title"].ToString() + "'>" +
"<input type='hidden' name='item_number_" + j + "' value='" + dd.SelectedValue + dt.Rows[0]["item_id"].ToString() + "'>" +
"<input type='hidden' name='amount_" + j + "' value='" + price + "'>" +
"<input type='hidden' name='quantity_" + j + "' value='" + qty + "'>";
                }
                catch
                {
                }
            }
            if (total > 0)
            {
                TableRow totrow = new TableRow();
                TableCell tcc1 = new TableCell();
                tcc1.Text = "Total";
                tcc1.Font.Bold = true;
                TableCell tcc2 = new TableCell();
                if (deposit > 0)
                {
                    tcc2.Text = string.Format("{0:C02}", total) + "<br>+ " + string.Format("{0:C02}", deposit) + " deposit";
                    j = j + 1;
                    Literal1.Text += "<input type='hidden' name='item_name_" + j + "' value='Deposit'>" +
"<input type='hidden' name='item_number_" + j + "' value='DEPOSIT'>" +
"<input type='hidden' name='amount_" + j + "' value='" + deposit + "'>" +
"<input type='hidden' name='quantity_" + j + "' value='1'>" +
"<input type='hidden' name='paymentaction' value='authorization'>";
                }
                else tcc2.Text = string.Format("{0:C02}", total);
                tcc2.Font.Bold = true;
                TableCell blank = new TableCell();
                TableCell blank2 = new TableCell();
                TableCell blank3 = new TableCell();
                TableCell blank4 = new TableCell();
                TableCell blank5 = new TableCell();
                totrow.Cells.Add(blank);
                totrow.Cells.Add(tcc1);
                totrow.Cells.Add(blank2);
                totrow.Cells.Add(blank3);
                totrow.Cells.Add(blank4);
                totrow.Cells.Add(tcc2);
                totrow.Cells.Add(blank5);
                Table1.Rows.Add(totrow);
                Button1.Visible = true;
                Button2.Visible = true;
                Table1.Visible = true;
                Label1.Visible = false;
            }
            else { Button1.Visible = false; Button2.Visible = false; Table1.Visible = false; Label1.Visible = true; }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            
        }

    }
}