using static MoonTrading.BusinessLogic.Validation.CurrencyDataValidation;
using static SharedConstants.Constants;

namespace MoonTrading.Tests.Data.Interfaces;
public interface ICurrencyData
{
    Task<IEnumerable<CurrencyModel>> GetCurrencies();
    Task<CurrencyModel> GetCurrencyById(int Id);
    Task<IEnumerable<CurrencyModel>> GetCurrenciesByType(CurrencyType currencyType);
    Task<IEnumerable<CurrencyModel>> GetCurrencyByCoinMarketCapId(int coinMarketCapId, CurrencyType currencyType);
}