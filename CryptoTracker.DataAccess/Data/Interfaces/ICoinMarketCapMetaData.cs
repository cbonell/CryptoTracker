namespace CryptoTracker.DataAccess.Data;

public interface ICoinMarketCapMetaData
{
    Task<CoinMarketCapMetaDataModel> GetCoinMetaData(int id);
}