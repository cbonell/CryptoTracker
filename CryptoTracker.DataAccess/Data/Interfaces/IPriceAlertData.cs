namespace CryptoTracker.DataAccess.Data
{
    public interface IPriceAlertData
    {
        Task CreatePriceAlert(string userId, int currencyId, string email, AlertType alertType, double alertPrice);
        Task DeletePriceAlert(string id);
        Task<IEnumerable<PriceAlertModel>> GetAlerts();
    }
}