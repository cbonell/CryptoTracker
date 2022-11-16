using MoonTrading.Tests.Data.Interfaces;
using static SharedConstants.Constants;
using static MoonTrading.BusinessLogic.Validation.TradingPurchaseDataValidation;

namespace MoonTrading.Tests.Data;
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
        if (string.IsNullOrWhiteSpace(userId))
        {
            throw new Exception(InvalidUserId);
        }

        if (coinId <= 0 || purchaseCurrencyId <= 0)
        {
            throw new Exception(InvalidCoinId);
        }

        if (quanitity <= 0.00)
        {
            throw new Exception(InvalidQuantity);
        }

        if (purchasePrice <= 0.00)
        {
            throw new Exception(InvalidPurchasePrice);
        }

        purchaseDate = purchaseDate ?? DateTime.Now;

        dynamic parameters = new { UserId = userId, CoinId = coinId, PurchasingCurrencyId = purchaseCurrencyId, Quantity = quanitity, PurchasePrice = purchasePrice, PurchaseDate = purchaseDate };
        await _db.SaveData<dynamic>("dbo.TradingPurchase_Create", parameters);

        return true;
    }

    public Task<IEnumerable<TradingPurchaseModel>> GetUserTradingHistory(string userId)
    {
        if (string.IsNullOrWhiteSpace(userId))
        {
            throw new Exception(InvalidUserId);
        }

        return _db.LoadData<TradingPurchaseModel, dynamic>("[dbo].[GetUserTradingHistory]", new { UserId = userId });
    }

    public async Task<bool> Sell(string userId, int coinId, double quanitity, double sellPrice, DateTime? purchaseDate)
    {
        if (string.IsNullOrWhiteSpace(userId))
        {
            throw new Exception(InvalidUserId);
        }

        if (coinId <= 0)
        {
            throw new Exception(InvalidCoinId);
        }

        if (quanitity <= 0.00)
        {
            throw new Exception(InvalidQuantity);
        }

        if (sellPrice <= 0.00)
        {
            throw new Exception(InvalidSellPrice);
        }

        dynamic parameters = new { UserId = userId, CoinId = coinId, Quantity = quanitity, SellPrice = sellPrice, PurchaseDate = purchaseDate };
        await _db.SaveData<dynamic>("dbo.TradingPurchase_Sell", parameters);

        return true;
    }

    public async Task Purchase(string userId, CoinGeckCoinModel coin, double quanitity, double purchasePrice, DateTime? purchaseDate, string purchaseCurrency = "")
    {
        if (string.IsNullOrWhiteSpace(userId))
        {
            throw new Exception(InvalidUserId);
        }

        if (quanitity <= 0.00)
        {
            throw new Exception(InvalidQuantity);
        }

        if (purchasePrice <= 0.00)
        {
            throw new Exception(InvalidPurchasePrice);
        }

        dynamic parameters = new { UserId = userId, CoinGeckoId = coin.Id, PurchasingCurrency = purchaseCurrency, Quantity = quanitity, PurchasePrice = purchasePrice, PurchaseDate = purchaseDate };
        await _db.SaveData<dynamic>("dbo.TradingPurchase_Create", parameters);
    }

    public async Task Sell(string userId, CoinGeckCoinModel coin, double quanitity, double sellPrice, DateTime? purchaseDate)
    {
        if (string.IsNullOrWhiteSpace(userId))
        {
            throw new Exception(InvalidUserId);
        }

        if (quanitity <= 0.00)
        {
            throw new Exception(InvalidQuantity);
        }

        if (sellPrice <= 0.00)
        {
            throw new Exception(InvalidSellPrice);
        }

        dynamic parameters = new { UserId = userId, CoinGeckoId = coin.Id, Quantity = quanitity, SellPrice = sellPrice, PurchaseDate = purchaseDate };
        await _db.SaveData<dynamic>("dbo.TradingPurchase_Sell", parameters);
    }
}
