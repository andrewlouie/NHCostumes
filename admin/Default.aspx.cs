using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NHCostumes.admin
{
    public partial class Default1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string test;
            try
            {
                test = Request.Cookies["nhadmin"].Value;
            }
            catch
            {
                test = "";
            }
            if (test == "canttellyouthepassword")
            {
                notallowed.Visible = false;
            }
            else allowed.Visible = false;
            if (!IsPostBack) this.DetailsView1.DefaultMode = DetailsViewMode.Edit;
            else
            {
                DetailsView1.DefaultMode = DetailsViewMode.ReadOnly;
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox4.Text == "canttellyouthepassword")
            {
                Response.Cookies["nhadmin"].Value = "canttellyouthepassword";
                Response.Cookies["nhadmin"].Expires = DateTime.Now.AddDays(7);
                allowed.Visible = true;
                notallowed.Visible = false;
            }
        }

    

        protected void DetailsView1_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            if (e.Exception == null) { DropDownList2.DataBind(); }
            else { Label1.Text = "Something went wrong"; e.ExceptionHandled = true; }
        }

        protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            int temp = DropDownList2.SelectedIndex;
            if (e.Exception == null) { DropDownList2.DataBind(); DropDownList2.SelectedIndex = temp; Label1.Text = "Item Updated"; this.DetailsView1.DefaultMode = DetailsViewMode.Edit; }
            else { Label1.Text = "There was a problem with the input"; e.ExceptionHandled = true; }

        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            if (e.Exception == null) { DropDownList2.DataBind(); Label1.Text = "Item added";  }
            else { Label1.Text = "There was a problem with the input"; e.ExceptionHandled = true; }
        }



        protected void DropDownList2_DataBound1(object sender, EventArgs e)
        {
            DetailsView1.DataBind();
        }


      
    }
}