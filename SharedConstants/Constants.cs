namespace SharedConstants;

public class Constants
{
    // Config navigation
    // Twitter
    public static readonly string TwitterApiBearerToken = "TwitterApi:TwitterApiBearerToken";
    // Auth0
    public static readonly string Auth0APIToken = "Auth0:ApiToken";

    // Test user data
    public static readonly string TestUser_UserId = "testuser:systemtestuser";

    // Data Base staticants
    public const int dbval_CurrencyType_Coin = 101;
    public const int dbval_CurrencyType_Fiat = 100;

    // API
    public static readonly string PROD_ENDPOINT = "https://pro-api.coinmarketcap.com";
    public static readonly string AUTH0_API_ENDPOINT = "https://dev--h2wbffc.us.auth0.com/api/v2/";

    // Error messages
    public static readonly string InvalidUserId = "Tried to retrieve favorite coins for user but encounterd invalid userId";
    public static readonly string InvalidCoinId = "Recieved invalid CoinId";
    public static readonly string InvalidSellPrice = "Recieved invalid sell price";
    public static readonly string InvalidPurchasePrice = "Recieved invalid purchase price";
    public static readonly string InvalidQuantity = "Recieved invalid quantity";
    public static readonly string InvalidCoinMarketCapId = "Recieved invalid coin market cap Id";

    public static readonly string[] ChartUserTimeOptions = { "1w", "1d", "4h", "1h", "30m", "15m", "5m", "1m" };
    public enum CacheKey
    {
        GetCoinMap,
        CoinGeckoGetTrending,
        GetPriceInUsd,
        GetCoinMetaData
    }
}
