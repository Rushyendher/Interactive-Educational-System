using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Net.Mail;

namespace AmazonHackathon
{
    public partial class SendMail : System.Web.UI.Page
    {
        void Reset()
        {
            txt_body.Text = "";
            txt_email.Text = "";
            txt_pwd.Text = "";
            txt_subject.Text = "";
            txt_to.Text = "";
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_sendmail_Click(object sender, EventArgs e)
        {
            try
            {
                MailMessage msg = new MailMessage(txt_email.Text, txt_to.Text);
                msg.Subject = txt_subject.Text;
                msg.Body = txt_body.Text;
                if(FileUpload1.HasFile)
                {
                    string fname = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    msg.Attachments.Add(new Attachment( FileUpload1.PostedFile.InputStream, fname));
                    msg.IsBodyHtml = false;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    NetworkCredential NetworkCred = new NetworkCredential(txt_email.Text, txt_pwd.Text);
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = NetworkCred;
                    smtp.Port = 587;
                    smtp.Send(msg);
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email sent.');", true);
                }
            }
            catch(Exception ex)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email sending failed.');", true);
            }
        }
    }
}