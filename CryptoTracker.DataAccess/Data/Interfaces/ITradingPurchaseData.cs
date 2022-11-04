namespace CryptoTracker.DataAccess.Data.Interfaces;

public interface ITradingPurchaseData
{
    Task<IEnumerable<TradingPurchaseModel>> GetUserTradingHistory(string userId);
    Task Purchase(string userId, CoinGeckCoinModel coin, double quanitity, double purchasePrice, DateTime? purchaseDate, string purchaseCurrency = "");
    Task Sell(string userId, CoinGeckCoinModel coin, double quanitity, double sellPrice, DateTime? purchaseDate);
}