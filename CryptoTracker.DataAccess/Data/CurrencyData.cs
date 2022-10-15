using CryptoTracker.DataAccess.Data.Interfaces;
using System.Linq;
using static CryptoTracker.DataAccess.Data.Interfaces.ICurrencyData;
using static SharedConstants.Constants;

namespace CryptoTracker.DataAccess.Data;

public class CurrencyData : DataBase, ICurrencyData
{
    public CurrencyData(ISqlDataAccess db) : base(db) { }

    public Task<IEnumerable<CurrencyModel>> GetCurrencies()
        => _db.LoadData<CurrencyModel, dynamic>("[dbo].[GetCurrencies]", new { });

    public Task<IEnumerable<CurrencyModel>> GetCurrenciesByType(CurrencyType currencyType)
    { 
        if (!Enum.IsDefined(typeof(CurrencyType), (int)currencyType))
        {
            throw new InvalidDataException(string.Format("Recieved invalid enum value for {0}", nameof(CurrencyType)));
        }

        return _db.LoadData<CurrencyModel, dynamic>("[dbo].[GetCurrenciesByType]", new { CurrencyTypeId = (int)currencyType });
    }

    public Task<IEnumerable<CurrencyModel>> GetCurrencyByCoinMarketCapId(int coinMarketCapId, CurrencyType currencyType)
    {
        if (!Enum.IsDefined(typeof(CurrencyType), (int)currencyType))
        {
            throw new InvalidDataException(string.Format("Recieved invalid enum value for {0}", nameof(CurrencyType)));
        }

        if(coinMarketCapId <= 0)
        {
            throw new Exception(InvalidCoinMarketCapId);
        }

        return _db.LoadData<CurrencyModel, dynamic>("[dbo].[GetCurrencyByCoinMarketCapId]", new { CoinMarketCapId = coinMarketCapId, CurrencyTypeId = (int)currencyType });
    }

    public async Task<CurrencyModel> GetCurrencyById(int Id)
    {
        var data = await _db.LoadData<CurrencyModel, dynamic>("[dbo].[GetCurrencyById]", new {Id = Id});

        if(data != null)
        {
            if(data.Count() > 0)
            {
                return data.First();
            }
        }

        return new CurrencyModel();
    }
}
