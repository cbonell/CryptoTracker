﻿namespace MoonTrading.Tests.Data;

public enum AlertType
{
    Above,
    Below
}

public class PriceAlertData : DataBase, IPriceAlertData
{
    public PriceAlertData(ISqlDataAccess db) : base(db) { }

    public Task CreatePriceAlert(string userId, string geckoId, string email, AlertType alertType, double alertPrice)
       => _db.SaveData<dynamic>("[dbo].[CreatePriceAlert]", new { UserId = userId, CoinGeckoId = geckoId, Email = email, alertType, AlertPrice = alertPrice });

    public Task DeletePriceAlert(int id)
       => _db.SaveData<dynamic>("[dbo].[DeletePriceAlert]", new { Id = id });

    public Task<IEnumerable<PriceAlertModel>> GetAlerts()
        => _db.LoadData<PriceAlertModel,dynamic>("[dbo].[GetPriceAlerts]", new { });

    public Task<IEnumerable<PriceAlertModel>> GetUserAlerts(string userId)
        => _db.LoadData<PriceAlertModel, dynamic>("[dbo].[GetUserAlerts]", new { UserId = userId});
}