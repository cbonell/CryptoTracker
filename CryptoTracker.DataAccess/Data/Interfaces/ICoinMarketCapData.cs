namespace CryptoTracker.DataAccess.Data.Interfaces;
public interface ICoinMarketCapData
{
    Task<IEnumerable<CoinMarketCapIDMapModel>> GetCoinMap();
    Task<CoinMarketCapMetaDataModel> GetCoinMetaData(int id);
    Task<double> GetPriceConversion(double amount, int baseId, int convertId);
}