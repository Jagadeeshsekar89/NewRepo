using SmartERP.Web.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace SmartERP.Web.Utilities
{
    public class Utility
    {
        public static void SendHtmlFormattedEmail(EmailModel email)
        {
            using (MailMessage mailMessage = new MailMessage())
            {
                mailMessage.From = new MailAddress(email.FromEmail);
                mailMessage.Subject = email.Subject;
                mailMessage.Body = email.Body;
                mailMessage.IsBodyHtml = true;
                mailMessage.To.Add(new MailAddress(email.ToEmail));

                SmtpClient smtp = new SmtpClient();
                smtp.Host = email.Host;
                smtp.EnableSsl = email.EnableSsl;
                smtp.UseDefaultCredentials = true;                
                smtp.Port = email.Port;

                System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
                NetworkCred.UserName = email.UserName;
                NetworkCred.Password = email.Password;
                smtp.Credentials = NetworkCred;
                smtp.Send(mailMessage);
            }
        }
    }
}