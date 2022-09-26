namespace CryptoTracker.DataAccess.CoinGeckoAccess
{
    public interface ICoinGeckoData
    {
        Task<double> GetPriceInUsd(string currency);
    }
}