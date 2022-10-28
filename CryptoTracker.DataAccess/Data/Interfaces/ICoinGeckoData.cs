namespace CryptoTracker.DataAccess.Data.Interfaces
{
    public interface ICoinGeckoData
    {
        Task<List<VolumePairModel>> GetCoinVolume(string coinName, int days = 1);
        Task<IEnumerable<CoinGeckoMarketModel>> GetMarkets(int page = 1);
        Task<CoinGeckoMetaDataModel> GetMetaData(string geckoId);

        /// <summary>
        /// Returns OHLC pairs in 30 minute intervals
        /// </summary>
        /// <param name="coinName">Name of the coin</param>
        /// <param name="days">Number of days to be returned (deffault of 1)</param>
        /// <returns>IEnumerable<OHLCPairModel></returns>
        Task<List<OHLCPairModel>> GetOHLCPairs(string coinName, int days = 1);
        Task<List<DatePricePairModel>> GetPriceHistory(string currency);
        Task<double> GetPriceInUsd(string currency, double amount = 1);
        Task<CoinGeckCoinModel> GetTradeableCoinByCoinGeckoId(string coinGeckoId);
        Task<CoinGeckCoinModel> GetTradeableCoinByCoinMarketCapId(int coinMarketCapId);
        Task<IEnumerable<CoinGeckCoinModel>> GetTradeableCoins();
        Task<List<CoinGeckoTrendingModel>> GetTrending();
    }
}