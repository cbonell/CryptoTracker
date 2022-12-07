using static SharedConstants.Constants;

namespace MoonTrading.BusinessLogic.Validation;

public static class CurrencyDataValidation
{
    public enum CurrencyType
    {
        Coin = dbval_CurrencyType_Coin,
        Fiat = dbval_CurrencyType_Fiat
    }

    public static bool IsCurrencyEnum(CurrencyType currencyType) => Enum.IsDefined(typeof(CurrencyType), (int)currencyType);
    public static bool IsValidCurrencyId(int id) => id > 0;
}
