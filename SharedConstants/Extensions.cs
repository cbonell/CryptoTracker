using Newtonsoft.Json.Linq;
using System.Globalization;

namespace MoonTrading.Extensions;

public static class Extensions
{
    public static DateTime DateTimeFromUnixTimeStampMillis(this long millis)
                                => new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc).AddMilliseconds(millis);
    public static DateTime DateTimeFromUnixTimeStampMillis(this long? millis)
    {
        if (millis == null)
        {
            return DateTime.MinValue;
        }

        return millis.Value.DateTimeFromUnixTimeStampMillis();
    }

    public static DateTime DateTimeFromUnixTimeStampSeconds(this long seconds)
                                => new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc).AddSeconds(seconds);

    public static string AsFormattedNumber(this double number)
    {
        return string.Format("{0:n}", number);
    }

    public static string AsFormattedNumber(this object number) => string.Format("{0:n}", number);
    public static string WithThousandsSeparator(this double? number) => number?.ToString("n0", CultureInfo.InvariantCulture) ?? "";
    public static string WithThousandsSeparator(this double number) => number.ToString("n0", CultureInfo.InvariantCulture) ?? "";
    public static string WithThousandsSeparator(this long? number) => number?.ToString("n0", CultureInfo.InvariantCulture) ?? "";
    public static string WithThousandsSeparator(this long number) => number.ToString("n0", CultureInfo.InvariantCulture) ?? "";

    public static string GetPriceArrowClass(double num)
    {
        if (num >= 0)
        {
            return "arrow-up";
        }

        return "arrow-down";
    }

    public static string GetPriceColorClass(double num)
    {
        if (num >= 0)
        {
            return "green";
        }

        return "red";
    }

    public static string NullableToString(this object? obj) => obj?.ToString() ?? "";
    public static string NullableToString(this JToken? obj) => obj?.ToString() ?? "";

    public static bool IsNotNull(this object? obj) => obj != null;

    public static double PercentToDouble(this string percentage)
    {
        percentage = percentage.Replace(CultureInfo.CurrentCulture.NumberFormat.PercentSymbol, "");
        if (double.TryParse(percentage, out double result))
        {
            return result / 100;
        }

        return 0f;
    }
}
