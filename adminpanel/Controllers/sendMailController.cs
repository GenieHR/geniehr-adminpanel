using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Web.Http;

namespace adminpanel.Controllers
{
    public class sendMailController : ApiController
    {

        [Route("sendmail/{strName}/")]
        [HttpGet]
       public void sendEmail(string strName)
        {
            try
            {
                String Body;
                MailMessage mail = new MailMessage();
                mail.To.Add("vibhor.mathreja@geniehr.com");
                
                mail.Bcc.Add("lakshman.pilaka@gmail.com");
                mail.Bcc.Add("laks@geniehr.com");

                mail.From = new MailAddress("corporate@geniehr.com", "GenieHR Solutions");

                mail.Subject = "Email from GenieHR Solutions";
                
                using (WebClient client = new WebClient())
                {
                     Body = client.DownloadString("http://ubiety.geniehr.com/staticMail.html");
                }

                if (strName != "") { strName = "Dear " + strName + ", "; }

                Body = Body.Replace("<b>Hello</b>", strName);
                mail.Body = Body;
                mail.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "ntn.domainindia.net";
                smtp.Credentials = new System.Net.NetworkCredential("corporate@geniehr.com", "copper50");
                smtp.EnableSsl = true;
                ServicePointManager.ServerCertificateValidationCallback = delegate(object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };
                smtp.Send(mail);
            }
            catch (Exception ex)
            { throw ex; }
        }
    }
}
