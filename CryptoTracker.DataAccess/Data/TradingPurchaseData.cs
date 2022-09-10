using CryptoTracker.DataAccess.Data.Interfaces;

namespace CryptoTracker.DataAccess.Data;

public class TradingPurchaseData : DataBase, ITradingPurchaseData
{
    public TradingPurchaseData(ISqlDataAccess db) : base(db) { }

    public async Task<bool> MakePurchase(string userId
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
}
