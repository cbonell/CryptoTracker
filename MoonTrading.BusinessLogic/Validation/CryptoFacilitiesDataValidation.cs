using System;
using static SharedConstants.Constants;

namespace MoonTrading.BusinessLogic.Validation;

public static class CryptoFacilitiesDataValidation
{
    public static bool IsValidCoinSymbol(string symbol) => !string.IsNullOrWhiteSpace(symbol);
    public static bool IsValidChartTimeOption(string interval) => ChartUserTimeOptions.Contains(interval);
    public static bool IsValidTimeInterval(DateTimeOffset from, DateTimeOffset to) => from <= to;

}
