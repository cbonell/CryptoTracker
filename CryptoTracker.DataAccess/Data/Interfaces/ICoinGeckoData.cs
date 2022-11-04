namespace CryptoTracker.DataAccess.Data.Interfaces
{
    public interface ICoinGeckoData
    {
        Task<double> GetCoinPriceInUSDFromSymbol(string coinGeckoId);
        Task<List<VolumePairModel>> GetCoinVolume(string coinName, string searchTerm);
        Task<IEnumerable<CoinGeckoMarketModel>> GetMarkets(int page = 1);
        Task<CoinGeckoMetaDataModel> GetMetaData(string geckoId);

        /// <summary>
        /// Returns OHLC pairs in 30 minute intervals
        /// </summary>
        /// <param name="coinName">Name of the coin</param>
        /// <param name="searchTerm">Search term (deffault of 7d)</param>
        /// <returns>IEnumerable<OHLCPairModel></returns>
        Task<List<OHLCPairModel>> GetOHLCPairs(string coinName, string searchTerm = "7d");
        Task<List<DatePricePairModel>> GetPriceHistory(string coinName, string searchTerm);
        Task<double> GetPriceInUsd(string currency, double amount = 1);
        Task<CoinGeckCoinModel> GetTradeableCoinByCoinGeckoId(string coinGeckoId);
        Task<CoinGeckCoinModel> GetTradeableCoinByCoinGeckoSymbol(string coinGeckoSymbol);
        Task<CoinGeckCoinModel> GetTradeableCoinByCoinMarketCapId(int coinMarketCapId);
        Task<IEnumerable<CoinGeckCoinModel>> GetTradeableCoins();
        Task<List<CoinGeckoTrendingModel>> GetTrending();
    }
}