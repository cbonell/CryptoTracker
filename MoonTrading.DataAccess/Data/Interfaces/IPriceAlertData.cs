namespace MoonTrading.Tests.Data
{
    public interface IPriceAlertData
    {
        Task CreatePriceAlert(string userId, string geckoId, string email, AlertType alertType, double alertPrice);
        Task DeletePriceAlert(int id);
        Task<IEnumerable<PriceAlertModel>> GetAlerts();
        Task<IEnumerable<PriceAlertModel>> GetUserAlerts(string userId);
    }
}