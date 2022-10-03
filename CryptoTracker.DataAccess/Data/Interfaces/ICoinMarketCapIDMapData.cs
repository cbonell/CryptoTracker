namespace CryptoTracker.DataAccess.Data.Interfaces;

public interface ICoinMarketCapIDMapData
{
    Task<IEnumerable<CoinMarketCapIDMapModel>> GetCoinMap();
}