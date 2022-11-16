namespace MoonTrading.Tools.Email
{
    public interface IEmailClient
    {
        bool SendEmail(string subject, string body, params string[] sendTo);
    }
}