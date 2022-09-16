namespace CryptoTracker.DataAccess.Data;

public interface ICoinMarketCapIDMapData
{
    Task<IEnumerable<CoinMarketCapIDMapModel>> GetCoinMap();
}