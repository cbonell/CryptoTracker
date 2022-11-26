namespace MoonTrading.BusinessLogic.Validation;
public class CoinGeckoDataValidation
{    
    /// <summary>
    /// Validates parameters for price retrieval
    /// </summary>
    /// <param name="currency"></param>
    /// <param name="amount"></param>
    /// <exception cref="ArgumentNullException"></exception>
    /// <exception cref="ArgumentOutOfRangeException"></exception>
    public static void ValidateGetPrice(string currency, double amount)
    {
        if (string.IsNullOrWhiteSpace(currency))
        {
            throw new ArgumentNullException(nameof(currency));
        }

        if (amount <= 0)
        {
            throw new ArgumentOutOfRangeException();
        }
    }
}
