using System.Globalization;

namespace Tools.Extensions;

public static class Extensions
{
    public static DateTime DateTimeFromUnixTimestampMillis(this long millis) 
                                => new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc).AddMilliseconds(millis);
    
    public static string AsFormattedNumber(this object number) => String.Format("{0:n}", number);
    public static string WithThousandsSeparator(this double? number) => number?.ToString("n0", CultureInfo.InvariantCulture);
    public static string WithThousandsSeparator(this double number) => number.ToString("n0", CultureInfo.InvariantCulture);
    public static string WithThousandsSeparator(this long? number) => number?.ToString("n0", CultureInfo.InvariantCulture);
    public static string WithThousandsSeparator(this long number) => number.ToString("n0", CultureInfo.InvariantCulture);

}
