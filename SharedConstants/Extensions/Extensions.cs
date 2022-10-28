namespace Tools.Extensions;

public static class Extensions
{
    public static DateTime DateTimeFromUnixTimestampMillis(this long millis) 
                                => new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc).AddMilliseconds(millis);
    
    public static string AsFormattedNumber(this long number) => String.Format("{0:n}", number);
}
