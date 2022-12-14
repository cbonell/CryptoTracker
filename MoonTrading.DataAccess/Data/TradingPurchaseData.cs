using MoonTrading.DataAccess.Data.Interfaces;
using static SharedConstants.Constants;
using static MoonTrading.BusinessLogic.Validation.TradingPurchaseDataValidation;

namespace MoonTrading.DataAccess.Data;
public class TradingPurchaseData : DataBase, ITradingPurchaseData
{
    public TradingPurchaseData(ISqlDataAccess db) : base(db) { }

    /// <summary>
    /// Create a user purchase 
    /// </summary>
    /// <param name="userId"></param>
    /// <param name="coinId"></param>
    /// <param name="purchaseCurrencyId"></param>
    /// <param name="quanitity"></param>
    /// <param name="purchasePrice"></param>
    /// <param name="purchaseDate"></param>
    /// <returns>bool</returns>
    /// <exception cref="Exception"></exception>
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

    /// <summary>
    /// Get a collection of a users trading history
    /// </summary>
    /// <param name="userId"></param>
    /// <returns></returns>
    /// <exception cref="Exception"></exception>
    public Task<IEnumerable<TradingPurchaseModel>> GetUserTradingHistory(string userId)
    {
        if (string.IsNullOrWhiteSpace(userId))
        {
            throw new Exception(InvalidUserId);
        }

        return _db.LoadData<TradingPurchaseModel, dynamic>("[dbo].[GetUserTradingHistory]", new { UserId = userId });
    }

    /// <summary>
    /// Sell a specified amount of coin that a user holds
    /// </summary>
    /// <param name="userId"></param>
    /// <param name="coinId"></param>
    /// <param name="quanitity"></param>
    /// <param name="sellPrice"></param>
    /// <param name="purchaseDate"></param>
    /// <returns>bool</returns>
    /// <exception cref="Exception"></exception>
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

    /// <summary>
    /// Create a user purchase 
    /// </summary>
    /// <param name="userId"></param>
    /// <param name="coin"></param>
    /// <param name="quanitity"></param>
    /// <param name="purchasePrice"></param>
    /// <param name="purchaseDate"></param>
    /// <param name="purchaseCurrency"></param>
    /// <returns></returns>
    /// <exception cref="Exception"></exception>
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

    /// <summary>
    /// Sell a specified amount of coin that a user holds 
    /// </summary>
    /// <param name="userId"></param>
    /// <param name="coin"></param>
    /// <param name="quanitity"></param>
    /// <param name="sellPrice"></param>
    /// <param name="purchaseDate"></param>
    /// <returns></returns>
    /// <exception cref="Exception"></exception>
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

        dynamic parameters = new { UserId = userId, CoinId = coin.Id, Quantity = quanitity, SellPrice = sellPrice, PurchaseDate = purchaseDate };
        await _db.SaveData<dynamic>("dbo.TradingPurchase_Sell", parameters);
    }
}
