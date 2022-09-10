namespace Tools.Extensions;

public static class DoubleExtensions
{
    public static string AsFormattedNumber(this double number)
    {
        return String.Format("{0:n}", number);
    }
}
