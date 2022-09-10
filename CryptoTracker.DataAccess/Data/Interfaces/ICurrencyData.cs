﻿using static SharedConstants.Constants;

namespace CryptoTracker.DataAccess.Data.Interfaces;
public interface ICurrencyData
{
    public enum CurrencyType
    {
        Coin = dbval_CurrencyType_Coin,
        Fiat = dbval_CurrencyType_Fiat
    }

    Task<IEnumerable<CurrencyModel>> GetCurrencies();
    Task<IEnumerable<CurrencyModel>> GetCurrenciesByType(CurrencyType currencyType);
    Task<IEnumerable<CurrencyModel>> GetCurrencyByCoinMarketCapId(int coinMarketCapId, CurrencyType currencyType);
}