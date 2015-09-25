using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace NHCostumes
{
  public partial class Contact : Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void sendbtn_Click(object sender, EventArgs e)
    {
        try
        {
            MailMessage mailMessage = new MailMessage();
            mailMessage.To.Add("nhcostumes@gmail.com");
            mailMessage.From = new MailAddress(emailaddr.Text);
            mailMessage.Subject = "Website Contact Form " + Name.Text;
            mailMessage.Body = comments.InnerText;
            mailMessage.IsBodyHtml = true;
            SmtpClient smtpClient = new SmtpClient();
            smtpClient.Send(mailMessage);
            mainform.InnerHtml = "Your message has been sent. You will receive a response shortly. Thank you.";
        }
        catch (Exception ex)
        {
            mainform.InnerHtml = "Could not send the e-mail - error: " + ex.Message;
        }
    }
  }
}