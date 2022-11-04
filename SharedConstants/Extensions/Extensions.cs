using System.Globalization;

namespace Tools.Extensions;

public static class Extensions
{
    public static DateTime DateTimeFromUnixTimeStampMillis(this long millis) 
                                => new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc).AddMilliseconds(millis);
    public static DateTime DateTimeFromUnixTimeStampMillis(this long? millis)
    {
        if(millis == null)
        {
            return DateTime.MinValue;
        }

        return DateTimeFromUnixTimeStampMillis(millis.Value);
    }

    public static string AsFormattedNumber(this double number)
    {
        return String.Format("{0:n}", number);
    }

    public static string AsFormattedNumber(this object number) => String.Format("{0:n}", number);
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

    public static bool IsNotNull(this object? obj) => obj != null;
}
