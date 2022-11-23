using MoonTrading.DataAccess.Data.Interfaces;

namespace MoonTrading.DataAccess.Data;

public enum AlertType
{
    Above,
    Below
}

public class PriceAlertData : DataBase, IPriceAlertData
{
    public PriceAlertData(ISqlDataAccess db) : base(db) { }

    /// <summary>
    /// Creates a new price alert for a user
    /// </summary>
    /// <param name="userId"></param>
    /// <param name="geckoId"></param>
    /// <param name="email"></param>
    /// <param name="alertType"></param>
    /// <param name="alertPrice"></param>
    /// <returns></returns>
    public Task CreatePriceAlert(string userId, string geckoId, string email, AlertType alertType, double alertPrice)
       => _db.SaveData<dynamic>("[dbo].[CreatePriceAlert]", new { UserId = userId, CoinGeckoId = geckoId, Email = email, alertType, AlertPrice = alertPrice });

    /// <summary>
    /// Deletes a specific price alert by Id
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public Task DeletePriceAlert(int id)
       => _db.SaveData<dynamic>("[dbo].[DeletePriceAlert]", new { Id = id });

    /// <summary>
    /// Get all open price alerts
    /// </summary>
    /// <returns>IEnumerable<PriceAlertModel></returns>
    public Task<IEnumerable<PriceAlertModel>> GetAlerts()
        => _db.LoadData<PriceAlertModel,dynamic>("[dbo].[GetPriceAlerts]", new { });

    /// <summary>
    /// Get all open price alerts for a specific user 
    /// </summary>
    /// <param name="userId"></param>
    /// <returns>IEnumerable<PriceAlertModel></returns>
    public Task<IEnumerable<PriceAlertModel>> GetUserAlerts(string userId)
        => _db.LoadData<PriceAlertModel, dynamic>("[dbo].[GetUserAlerts]", new { UserId = userId});
}
