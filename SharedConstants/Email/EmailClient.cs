using Microsoft.Extensions.Configuration;
using System;
using System.Net;
using System.Net.Mail;

namespace MoonTrading.Tools.Email;

public class EmailClient : IEmailClient
{
    readonly string sendMailFrom = "moontradingexchange@gmail.com";
    readonly string pwd = "78^%Wy56ghqw";
    readonly string appPwd = "gbzmryzjnksyessg";
    private IConfiguration _config;

    public EmailClient(IConfiguration config)
    {
        _config = config;
        sendMailFrom = "moontradingexchange@gmail.com";
        pwd = "78^%Wy56ghqw";
        appPwd = "gbzmryzjnksyessg";
    }

    public bool SendEmail(string subject, string body, params string[] sendTo)
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
        catch (Exception)
        {
            return false;
        }

        return true;
    }
}
