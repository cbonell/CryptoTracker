using static MoonTrading.BusinessLogic.Validation.CurrencyDataValidation;

namespace MoonTrading.DataAccess.Data.Interfaces;
public interface ICurrencyData
{
    Task<IEnumerable<CurrencyModel>> GetCurrencies();
    Task<CurrencyModel> GetCurrencyById(int Id);
    Task<IEnumerable<CurrencyModel>> GetCurrenciesByType(CurrencyType currencyType);
    Task<IEnumerable<CurrencyModel>> GetCurrencyByCoinMarketCapId(int coinMarketCapId, CurrencyType currencyType);
}