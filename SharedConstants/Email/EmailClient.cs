using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace Tools.Email;

public class EmailClient
{
    static readonly string sendMailFrom = "moontradingexchange@gmail.com";
    static readonly string pwd = "78^%Wy56ghqw";
    static readonly string appPwd = "gbzmryzjnksyessg";
    public static void SendEmail(string subject, string body, params string[] sendTo)
    {
        try
        {
            SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com", 587);
            SmtpServer.DeliveryMethod = SmtpDeliveryMethod.Network;
            MailMessage email = new MailMessage();
            email.From = new MailAddress(sendMailFrom);
            foreach (string emailAddress in sendTo)
            {
                email.To.Add(emailAddress);
            }
            email.Subject = subject;
            email.Body = body;
            email.IsBodyHtml = true;
            SmtpServer.Timeout = 5000;
            SmtpServer.EnableSsl = true;
            SmtpServer.UseDefaultCredentials = false;
            SmtpServer.Credentials = new NetworkCredential(sendMailFrom, appPwd);
            SmtpServer.Send(email);
        }
        catch (Exception ex)
        {
        }
    }
}
