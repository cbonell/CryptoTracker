namespace CryptoTracker.DataAccess.CoinGeckoAccess
{
    public interface ICoinGeckoData
    {
        Task<IEnumerable<Tuple<double, string>>> GetPriceHistory(string currency);
        Task<double> GetPriceInUsd(string currency);
    }
}