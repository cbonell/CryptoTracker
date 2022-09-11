namespace CryptoTracker.DataAccess.Data.Interfaces
{
    public interface ITradingPurchaseData
    {
        Task<IEnumerable<TradingPurchaseModel>> GetUserTradingHistory(string userId);
        Task<bool> Purchase(string userId, int coinId, int purchaseCurrencyId, double quanitity, double purchasePrice, DateTime? purchaseDate);
        Task<bool> Sell(string userId, int coinId, double quanitity, double sellPrice, DateTime? purchaseDate);
    }
}