namespace CryptoTracker.DataAccess.Data;

public enum AlertType
{
    Above,
    Below
}

public class PriceAlertData : DataBase, IPriceAlertData
{
    public PriceAlertData(ISqlDataAccess db) : base(db) { }

    public Task CreatePriceAlert(string userId, int currencyId, string email, AlertType alertType, double alertPrice)
       => _db.SaveData<dynamic>("[dbo].[CreatePriceAlert]", new { UserId = userId, CurrencyId = currencyId, Email = email, alertType, AlertPrice = alertPrice });

    public Task DeletePriceAlert(string id)
       => _db.SaveData<dynamic>("[dbo].[DeletePriceAlert]", new { Id = id });

    public Task<IEnumerable<PriceAlertModel>> GetAlerts()
        => _db.LoadData<PriceAlertModel,dynamic>("[dbo].[GetPriceAlerts]", new { });
}
