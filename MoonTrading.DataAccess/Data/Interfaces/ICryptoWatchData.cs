namespace MoonTrading.DataAccess.Data.Interfaces;

public interface ICryptoWatchData
{
    Task<CoinPriceVolumePair> GetCoinPriceVolumePair(string coinSymbol, DateTimeOffset fromDate, string interval = "1h", DateTimeOffset? _toDate = null);
    Task<List<OHLCPairModel>> GetOHLCPairs(string coinSymbol, DateTimeOffset fromDate, string interval = "1h", DateTimeOffset? _toDate = null);
    Task<double> GetPrice(string coinSymbol);
}