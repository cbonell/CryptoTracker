using CryptoTracker.DataAccess.Data.Interfaces;
using System.Linq;
using static CryptoTracker.DataAccess.Data.Interfaces.ICurrencyData;

namespace CryptoTracker.DataAccess.Data;

public class CurrencyData : DataBase, ICurrencyData
{
    public CurrencyData(ISqlDataAccess db) : base(db) { }

    public Task<IEnumerable<CurrencyModel>> GetCurrencies()
        => _db.LoadData<CurrencyModel, dynamic>("[dbo].[GetCurrencies]", new { });
    
    public Task<IEnumerable<CurrencyModel>> GetCurrenciesByType(CurrencyType currencyType)
        => _db.LoadData<CurrencyModel, dynamic>("[dbo].[GetCurrenciesByType]", new { CurrencyTypeId = (int)currencyType});

    public Task<IEnumerable<CurrencyModel>> GetCurrencyByCoinMarketCapId(int coinMarketCapId, CurrencyType currencyType)
        => _db.LoadData<CurrencyModel, dynamic>("[dbo].[GetCurrencyByCoinMarketCapId]", new { CoinMarketCapId = coinMarketCapId, CurrencyTypeId = (int)currencyType });

    public async Task<CurrencyModel> GetCurrencyById(int id)
    {
        var data = await _db.LoadData<CurrencyModel, dynamic>("[dbo].[GetCurrencyById]", new { Id = id });
        return data.FirstOrDefault();
    }
}
