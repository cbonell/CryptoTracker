using static SharedConstants.Constants;

namespace MoonTrading.Tests.Data.Interfaces;
public interface ICurrencyData
{
    public enum CurrencyType
    {
        Coin = dbval_CurrencyType_Coin,
        Fiat = dbval_CurrencyType_Fiat
    }

    Task<IEnumerable<CurrencyModel>> GetCurrencies();
    Task<CurrencyModel> GetCurrencyById(int Id);
    Task<IEnumerable<CurrencyModel>> GetCurrenciesByType(CurrencyType currencyType);
    Task<IEnumerable<CurrencyModel>> GetCurrencyByCoinMarketCapId(int coinMarketCapId, CurrencyType currencyType);
}