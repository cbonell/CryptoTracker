using CryptoTracker.DataAccess.Data.Interfaces;

namespace CryptoTracker.DataAccess.Data;

public class TradingPurchaseData : DataBase, ITradingPurchaseData
{
    public TradingPurchaseData(ISqlDataAccess db) : base(db) { }

    public async Task<bool> Purchase(string userId
                                         , int coinId
                                         , int purchaseCurrencyId
                                         , double quanitity
                                         , double purchasePrice
                                         , DateTime? purchaseDate)
    {
        purchaseDate = DateTime.Now;

        dynamic parameters = new { UserId = userId, CoinId = coinId, PurchasingCurrencyId = purchaseCurrencyId, Quantity = quanitity, PurchasePrice = purchasePrice, PurchaseDate = purchaseDate };
        await _db.SaveData<dynamic>("dbo.TradingPurchase_Create", parameters);

        return true;
    }

    public Task<IEnumerable<TradingPurchaseModel>> GetUserTradingHistory(string userId)
        => _db.LoadData<TradingPurchaseModel, dynamic>("[dbo].[GetUserTradingHistory]", new {UserId = userId });

    public async Task<bool> Sell(string userId, int coinId, double quanitity, double sellPrice, DateTime? purchaseDate)
    {
        dynamic parameters = new { UserId = userId, CoinId = coinId, Quantity = quanitity, SellPrice = sellPrice, PurchaseDate = purchaseDate };
        await _db.SaveData<dynamic>("dbo.TradingPurchase_Sell", parameters);

        return true;
    }
}
