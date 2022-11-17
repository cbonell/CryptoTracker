﻿namespace SharedConstants;

public class Constants
{
    // Test user data
    public static readonly string TestUser_UserId = "testuser:systemtestuser";

    // Data Base staticants
    public const int dbval_CurrencyType_Coin = 101;
    public const int dbval_CurrencyType_Fiat = 100;

    // API
    public static string ApiKey = "OB0OuKLC4LkdAHriit93nAqUW";
    public static string ApiKeySecret = "kLI7DkRPEmPfLHEFqTKFhrOrTaHfPWfUxm3Xdt2g94Iwqurdpk";
    public static string TwitterApiBearerToken = "AAAAAAAAAAAAAAAAAAAAAGmAhAEAAAAAO%2BbYhX%2FmtqyYtjdyG8uLXWgWFxs%3DJTjORZ8Xit9UdPE9HRfp7ZqlWgBTCfbKdg4075AmlLe88DWube";
    public static string BearerToken = "AAAAAAAAAAAAAAAAAAAAAGmAhAEAAAAAFV190k%2FVMnf%2BWvVz3IOKen1Buso%3DhsB39Ka1AY2TmQtBvs0S9AtMYB9kAFCe8cgVGvFp8uivXD0WRl";
    public static readonly string DEV_ENDPOINT = "https://sandbox-api.coinmarketcap.com";
    public static readonly string PROD_ENDPOINT = "https://pro-api.coinmarketcap.com";
    public static readonly string AUTH0_API_ENDPOINT = "https://dev--h2wbffc.us.auth0.com/api/v2/";
    public static readonly string AUTH0_API_BEARER = "AAAAAAAAAAAAAAAAAAAAAGmAhAEAAAAAO%2BbYhX%2FmtqyYtjdyG8uLXWgWFxs%3DJTjORZ8Xit9UdPE9HRfp7ZqlWgBTCfbKdg4075AmlLe88DWube";
    public static readonly string AUTH0_API_TOKEN = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IlRlTkFxSlU4ZWhucFQyUHhha3hNUiJ9.eyJpc3MiOiJodHRwczovL2Rldi0taDJ3YmZmYy51cy5hdXRoMC5jb20vIiwic3ViIjoiRGxuRTYyU2VQczRRY3JRSVBvRmZhbWR4WExoaENkcmlAY2xpZW50cyIsImF1ZCI6Imh0dHBzOi8vZGV2LS1oMndiZmZjLnVzLmF1dGgwLmNvbS9hcGkvdjIvIiwiaWF0IjoxNjY4NjQzMDc0LCJleHAiOjE2Njk1MDM0NzQsImF6cCI6IkRsbkU2MlNlUHM0UWNyUUlQb0ZmYW1keFhMaGhDZHJpIiwic2NvcGUiOiJyZWFkOmNsaWVudF9ncmFudHMgY3JlYXRlOmNsaWVudF9ncmFudHMgZGVsZXRlOmNsaWVudF9ncmFudHMgdXBkYXRlOmNsaWVudF9ncmFudHMgcmVhZDp1c2VycyB1cGRhdGU6dXNlcnMgZGVsZXRlOnVzZXJzIGNyZWF0ZTp1c2VycyByZWFkOnVzZXJzX2FwcF9tZXRhZGF0YSB1cGRhdGU6dXNlcnNfYXBwX21ldGFkYXRhIGRlbGV0ZTp1c2Vyc19hcHBfbWV0YWRhdGEgY3JlYXRlOnVzZXJzX2FwcF9tZXRhZGF0YSByZWFkOnVzZXJfY3VzdG9tX2Jsb2NrcyBjcmVhdGU6dXNlcl9jdXN0b21fYmxvY2tzIGRlbGV0ZTp1c2VyX2N1c3RvbV9ibG9ja3MgY3JlYXRlOnVzZXJfdGlja2V0cyByZWFkOmNsaWVudHMgdXBkYXRlOmNsaWVudHMgZGVsZXRlOmNsaWVudHMgY3JlYXRlOmNsaWVudHMgcmVhZDpjbGllbnRfa2V5cyB1cGRhdGU6Y2xpZW50X2tleXMgZGVsZXRlOmNsaWVudF9rZXlzIGNyZWF0ZTpjbGllbnRfa2V5cyByZWFkOmNvbm5lY3Rpb25zIHVwZGF0ZTpjb25uZWN0aW9ucyBkZWxldGU6Y29ubmVjdGlvbnMgY3JlYXRlOmNvbm5lY3Rpb25zIHJlYWQ6cmVzb3VyY2Vfc2VydmVycyB1cGRhdGU6cmVzb3VyY2Vfc2VydmVycyBkZWxldGU6cmVzb3VyY2Vfc2VydmVycyBjcmVhdGU6cmVzb3VyY2Vfc2VydmVycyByZWFkOmRldmljZV9jcmVkZW50aWFscyB1cGRhdGU6ZGV2aWNlX2NyZWRlbnRpYWxzIGRlbGV0ZTpkZXZpY2VfY3JlZGVudGlhbHMgY3JlYXRlOmRldmljZV9jcmVkZW50aWFscyByZWFkOnJ1bGVzIHVwZGF0ZTpydWxlcyBkZWxldGU6cnVsZXMgY3JlYXRlOnJ1bGVzIHJlYWQ6cnVsZXNfY29uZmlncyB1cGRhdGU6cnVsZXNfY29uZmlncyBkZWxldGU6cnVsZXNfY29uZmlncyByZWFkOmhvb2tzIHVwZGF0ZTpob29rcyBkZWxldGU6aG9va3MgY3JlYXRlOmhvb2tzIHJlYWQ6YWN0aW9ucyB1cGRhdGU6YWN0aW9ucyBkZWxldGU6YWN0aW9ucyBjcmVhdGU6YWN0aW9ucyByZWFkOmVtYWlsX3Byb3ZpZGVyIHVwZGF0ZTplbWFpbF9wcm92aWRlciBkZWxldGU6ZW1haWxfcHJvdmlkZXIgY3JlYXRlOmVtYWlsX3Byb3ZpZGVyIGJsYWNrbGlzdDp0b2tlbnMgcmVhZDpzdGF0cyByZWFkOmluc2lnaHRzIHJlYWQ6dGVuYW50X3NldHRpbmdzIHVwZGF0ZTp0ZW5hbnRfc2V0dGluZ3MgcmVhZDpsb2dzIHJlYWQ6bG9nc191c2VycyByZWFkOnNoaWVsZHMgY3JlYXRlOnNoaWVsZHMgdXBkYXRlOnNoaWVsZHMgZGVsZXRlOnNoaWVsZHMgcmVhZDphbm9tYWx5X2Jsb2NrcyBkZWxldGU6YW5vbWFseV9ibG9ja3MgdXBkYXRlOnRyaWdnZXJzIHJlYWQ6dHJpZ2dlcnMgcmVhZDpncmFudHMgZGVsZXRlOmdyYW50cyByZWFkOmd1YXJkaWFuX2ZhY3RvcnMgdXBkYXRlOmd1YXJkaWFuX2ZhY3RvcnMgcmVhZDpndWFyZGlhbl9lbnJvbGxtZW50cyBkZWxldGU6Z3VhcmRpYW5fZW5yb2xsbWVudHMgY3JlYXRlOmd1YXJkaWFuX2Vucm9sbG1lbnRfdGlja2V0cyByZWFkOnVzZXJfaWRwX3Rva2VucyBjcmVhdGU6cGFzc3dvcmRzX2NoZWNraW5nX2pvYiBkZWxldGU6cGFzc3dvcmRzX2NoZWNraW5nX2pvYiByZWFkOmN1c3RvbV9kb21haW5zIGRlbGV0ZTpjdXN0b21fZG9tYWlucyBjcmVhdGU6Y3VzdG9tX2RvbWFpbnMgdXBkYXRlOmN1c3RvbV9kb21haW5zIHJlYWQ6ZW1haWxfdGVtcGxhdGVzIGNyZWF0ZTplbWFpbF90ZW1wbGF0ZXMgdXBkYXRlOmVtYWlsX3RlbXBsYXRlcyByZWFkOm1mYV9wb2xpY2llcyB1cGRhdGU6bWZhX3BvbGljaWVzIHJlYWQ6cm9sZXMgY3JlYXRlOnJvbGVzIGRlbGV0ZTpyb2xlcyB1cGRhdGU6cm9sZXMgcmVhZDpwcm9tcHRzIHVwZGF0ZTpwcm9tcHRzIHJlYWQ6YnJhbmRpbmcgdXBkYXRlOmJyYW5kaW5nIGRlbGV0ZTpicmFuZGluZyByZWFkOmxvZ19zdHJlYW1zIGNyZWF0ZTpsb2dfc3RyZWFtcyBkZWxldGU6bG9nX3N0cmVhbXMgdXBkYXRlOmxvZ19zdHJlYW1zIGNyZWF0ZTpzaWduaW5nX2tleXMgcmVhZDpzaWduaW5nX2tleXMgdXBkYXRlOnNpZ25pbmdfa2V5cyByZWFkOmxpbWl0cyB1cGRhdGU6bGltaXRzIGNyZWF0ZTpyb2xlX21lbWJlcnMgcmVhZDpyb2xlX21lbWJlcnMgZGVsZXRlOnJvbGVfbWVtYmVycyByZWFkOmVudGl0bGVtZW50cyByZWFkOmF0dGFja19wcm90ZWN0aW9uIHVwZGF0ZTphdHRhY2tfcHJvdGVjdGlvbiByZWFkOm9yZ2FuaXphdGlvbnNfc3VtbWFyeSByZWFkOm9yZ2FuaXphdGlvbnMgdXBkYXRlOm9yZ2FuaXphdGlvbnMgY3JlYXRlOm9yZ2FuaXphdGlvbnMgZGVsZXRlOm9yZ2FuaXphdGlvbnMgY3JlYXRlOm9yZ2FuaXphdGlvbl9tZW1iZXJzIHJlYWQ6b3JnYW5pemF0aW9uX21lbWJlcnMgZGVsZXRlOm9yZ2FuaXphdGlvbl9tZW1iZXJzIGNyZWF0ZTpvcmdhbml6YXRpb25fY29ubmVjdGlvbnMgcmVhZDpvcmdhbml6YXRpb25fY29ubmVjdGlvbnMgdXBkYXRlOm9yZ2FuaXphdGlvbl9jb25uZWN0aW9ucyBkZWxldGU6b3JnYW5pemF0aW9uX2Nvbm5lY3Rpb25zIGNyZWF0ZTpvcmdhbml6YXRpb25fbWVtYmVyX3JvbGVzIHJlYWQ6b3JnYW5pemF0aW9uX21lbWJlcl9yb2xlcyBkZWxldGU6b3JnYW5pemF0aW9uX21lbWJlcl9yb2xlcyBjcmVhdGU6b3JnYW5pemF0aW9uX2ludml0YXRpb25zIHJlYWQ6b3JnYW5pemF0aW9uX2ludml0YXRpb25zIGRlbGV0ZTpvcmdhbml6YXRpb25faW52aXRhdGlvbnMiLCJndHkiOiJjbGllbnQtY3JlZGVudGlhbHMifQ.uE9Nozh1_kmPGY5g34YiogA9n8515PtqNcLicC0ApFa4iB71R3fkJpwWrsRNzA5w2hStj_7tSTXv9DtfuXGndehurOXTZcvRe5x1hzLdpfI6SOggc8hhzCQ1r6AcPpcxCvaYRjFUlRQNgMbeionYROQYITZH3SKvXUMFMvsZhpqtIRYKXR8_SG1pqNLdGV23qs8flfJby_uiyyscx2YS8_hqiMPI64W_sM6OC4LP6mLk92WJWQTgLAK2YNl2H1I1vH93wyQUyY7znWQheNOgpN-toXdDerFOTsKaRDqEDsJpk5-tctB2ctP71nWhE0Fl2sEgBh1KeJBNMbLrUEV6Iw";

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
