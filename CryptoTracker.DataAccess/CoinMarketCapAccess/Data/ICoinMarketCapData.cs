using CryptoTracker.DataAccess.CoinMarketCap.Model;

namespace CryptoTracker.DataAccess.CoinMarketCap.Data
{
    public interface ICoinMarketCapData
    {
        Task<double> GetPriceConversion(double amount, int baseId, int convertId);
        Task<IEnumerable<DataModel>> GetTrendingLatest();
    }
}