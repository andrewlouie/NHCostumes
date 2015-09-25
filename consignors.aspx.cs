using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace NHCostumes
{
    public partial class consignors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.To.Add("nhcostumes@gmail.com");
                mailMessage.From = new MailAddress(Email.Text);
                mailMessage.Subject = "Website Consignment Form " + FirstName.Text;
                mailMessage.Body = "Someone has completed the website consignment form.<br/><br/>";
                mailMessage.Body += "First name: " + FirstName.Text + "<br/>";
                mailMessage.Body += "Last name: " + LastName.Text + "<br/>";
                mailMessage.Body += "Address: " + Address.Text + "<br/>";
                mailMessage.Body += "City: " + City.Text + "<br/>";
                mailMessage.Body += "Home Phone: " + HomePhone.Text + "<br/>";
                mailMessage.Body += "Other Phone: " + OtherPhone.Text + "<br/>";
                mailMessage.Body += "Email: " + Email.Text + "<br/>";
                mailMessage.Body += "Preferred Appt Time: " + DropDownList1.SelectedValue + "<br/>";
                mailMessage.Body += "Additional Comments: " + TextBox1.Text + "<br/>";
                mailMessage.IsBodyHtml = true;
                SmtpClient smtpClient = new SmtpClient();
                smtpClient.Send(mailMessage);
                mainform.InnerHtml = "<h3>Your information has been submitted.You will receive a response shortly. Thank you.</h3>";
            }
            catch (Exception ex)
            {
                mainform.InnerHtml = "<h3>Could not send the e-mail - error: " + ex.Message + "</h3>";
            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (agree.Checked) args.IsValid = true;
            else args.IsValid = false;
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (string.IsNullOrEmpty(HomePhone.Text) && string.IsNullOrEmpty(OtherPhone.Text)) args.IsValid = false;
            else args.IsValid = true;
            }
    }
}