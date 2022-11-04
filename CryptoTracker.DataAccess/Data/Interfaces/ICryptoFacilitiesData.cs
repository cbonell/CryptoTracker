using Newtonsoft.Json.Linq;

namespace CryptoTracker.DataAccess.Data.Interfaces
{
    public interface ICryptoFacilitiesData
    {

        /// <summary>
        /// Returns OHLC pairs in 30 minute intervals
        /// </summary>
        /// <param name="coinSymbol">The symbol of the coin</param>
        /// <param name="days">Number of days to be returned (deffault of 1)</param>
        /// <returns>IEnumerable<OHLCPairModel></returns>
        Task<List<OHLCPairModel>> GetOHLCPairs(string coinSymbol, DateTimeOffset fromDate, string interval = "1h", DateTimeOffset? _toDate = null);
        Task<List<TickerModel>> GetTickers();
        string GetCryptoFacilitiesSymbol(string symbol);
        Task<CoinPriceVolumePair> GetCoinPriceVolumePair(string coinSymbol, DateTimeOffset fromDate, string interval = "1h", DateTimeOffset? _toDate = null);
        DateTimeOffset GetOffsetFromInterval(string interval);
    }
}