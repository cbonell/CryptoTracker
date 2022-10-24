namespace CryptoTracker.DataAccess.Data.Interfaces;
public interface ICoinMarketCapData
{
    Task<double> GetPriceConversion(double amount, int baseId, int convertId);
    Task<List<CoinMarketCapIDMapModel>> GetTrending();
}