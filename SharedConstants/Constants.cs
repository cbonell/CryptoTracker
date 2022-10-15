namespace SharedConstants;

public class Constants
{
    // Test user data
    public static readonly string TestUser_UserId = "testuser:systemtestuser";

    ////// Data Base Constants //////
    public const int dbval_CurrencyType_Coin = 101;
    public const int dbval_CurrencyType_Fiat = 100;

    ///// Twitter API
    public const string ApiKey = "OB0OuKLC4LkdAHriit93nAqUW";
    public const string ApiKeySecret = "kLI7DkRPEmPfLHEFqTKFhrOrTaHfPWfUxm3Xdt2g94Iwqurdpk";
    public const string BearerToken = "AAAAAAAAAAAAAAAAAAAAAGmAhAEAAAAAFV190k%2FVMnf%2BWvVz3IOKen1Buso%3DhsB39Ka1AY2TmQtBvs0S9AtMYB9kAFCe8cgVGvFp8uivXD0WRl";


    // Error messages
    public static readonly string InvalidUserId = "Tried to retrieve favorite coins for user but encounterd invalid userId";
    public static readonly string InvalidCoinId = "Recieved invalid CoinId";
    public static readonly string InvalidSellPrice = "Recieved invalid sell price";
    public static readonly string InvalidPurchasePrice = "Recieved invalid purchase price";
    public static readonly string InvalidQuantity = "Recieved invalid quantity";
}
