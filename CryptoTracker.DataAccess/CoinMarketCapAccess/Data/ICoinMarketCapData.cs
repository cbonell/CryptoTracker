using CryptoTracker.DataAccess.CoinMarketCap.Model;

namespace CryptoTracker.DataAccess.CoinMarketCap.Data
{
    public interface ICoinMarketCapData
    {
        Task<IEnumerable<DataModel>> GetTrendingLatest();
    }
}