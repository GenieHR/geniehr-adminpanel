using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Web.Http;
using Newtonsoft.Json;
using adminpanel.Models;

namespace adminpanel.Controllers
{
    public class sendMailController : ApiController
    {

        [Route("sendmail/")]
        [HttpPost]
       public void sendEmail(EmailDTO emailDTO)
        {
            try
            {
                MailMessage mail = new MailMessage();

                mail.From = new MailAddress("alerts@geniehr.com", "GenieHR Solutions Alerts");
                mail.To.Add(emailDTO.toEmailAddress);
                mail.CC.Add(emailDTO.ccEmailAddress);
                mail.Subject = emailDTO.mailSubject;
                mail.Body = emailDTO.mailBody;
                mail.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient();
                smtp.Host = "ntn.domainindia.net";
                smtp.Credentials = new System.Net.NetworkCredential("alerts@geniehr.com", "Laks@5347");
                smtp.EnableSsl = true;

                ServicePointManager.ServerCertificateValidationCallback = delegate(object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };

                smtp.Send(mail);
            }
            catch (Exception ex)
            { throw ex; }
        }
    }
}
