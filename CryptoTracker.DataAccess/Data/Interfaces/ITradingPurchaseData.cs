namespace CryptoTracker.DataAccess.Data.Interfaces
{
    public interface ITradingPurchaseData
    {
        Task<IEnumerable<TradingPurchaseModel>> GetUserTradingHistory(string userId);
        Task<bool> MakePurchase(string userId, int coinId, int purchaseCurrencyId, double quanitity, double purchasePrice, DateTime? purchaseDate);
    }
}