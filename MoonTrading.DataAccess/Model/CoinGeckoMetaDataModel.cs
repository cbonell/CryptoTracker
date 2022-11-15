using Newtonsoft.Json;

namespace MoonTrading.Tests.Model;

public class CoinGeckoMetaDataModel : CoinGeckCoinModel
{
    public object asset_platform_id { get; set; }
    public int?  block_time_in_minutes { get; set; }
    public string hashing_algorithm { get; set; }
    public List<object> additional_notices { get; set; }
    public Description description { get; set; }
    public Links links { get; set; }
    public Image image { get; set; }
    public double? sentiment_votes_up_percentage { get; set; }
    public double? sentiment_votes_down_percentage { get; set; }
    public MarketData market_data { get; set; }
    public PublicinterestStats public_interest_stats { get; set; }
    public List<StatusUpdate> status_updates { get; set; }
    public DateTime last_updated { get; set; }
    public List<Ticker> tickers { get; set; }
}

public class ConvertedLast
{
    public double? btc { get; set; }
    public double? eth { get; set; }
    public double? usd { get; set; }
}

public class ConvertedVolume
{
    public double? btc { get; set; }
    public double? eth { get; set; }
    public double? usd { get; set; }
}

public class CurrentPrice
{
    public double? btc { get; set; }
    public double? eth { get; set; }
    public double? usd { get; set; }
}

public class Description
{
    public string en { get; set; }
}

public class High24h
{
    public double? btc { get; set; }
    public double? eth { get; set; }
    public double? usd { get; set; }
}

public class Image
{
    public string thumb { get; set; }
    public string small { get; set; }
    public string large { get; set; }
}

public class Links
{
    public List<string> homepage { get; set; }
    public List<string> blockchain_site { get; set; }
    public List<string> official_forum_url { get; set; }
    public List<string> chat_url { get; set; }
    public List<string> announcement_url { get; set; }
    public string twitter_screen_name { get; set; }
    public string facebook_username { get; set; }
    public string telegram_channel_identifier { get; set; }
    public string subreddit_url { get; set; }
    public ReposUrl repos_url { get; set; }
}


public class Low24h
{
    public double? btc { get; set; }
    public double? eth { get; set; }
    public double? usd { get; set; }
}

public class Market
{
    public string name { get; set; }
    public string identifier { get; set; }
    public bool has_trading_incentive { get; set; }
}

public class MarketCap
{
    public long btc { get; set; }
    public long eth { get; set; }
    public long usd { get; set; }
}

public class MarketData
{
    public CurrentPrice current_price { get; set; }
    public object total_value_locked { get; set; }
    public object mcap_to_tvl_ratio { get; set; }
    public object fdv_to_tvl_ratio { get; set; }
    public object roi { get; set; }
    public MarketCap market_cap { get; set; }
    public int?  market_cap_rank { get; set; }
    public TotalVolume total_volume { get; set; }
    public High24h high_24h { get; set; }
    public Low24h low_24h { get; set; }
    public double? price_change_24h { get; set; }
    public double? price_change_percentage_24h { get; set; }
    public double? price_change_percentage_7d { get; set; }
    public double? price_change_percentage_14d { get; set; }
    public double? price_change_percentage_30d { get; set; }
    public double? price_change_percentage_60d { get; set; }
    public double? price_change_percentage_200d { get; set; }
    public double? price_change_percentage_1y { get; set; }
    public double? market_cap_change_24h { get; set; }
    public double? market_cap_change_percentage_24h { get; set; }
    public PriceChange24hInCurrency price_change_24h_in_currency { get; set; }
    public PriceChangePercentage1hInCurrency price_change_percentage_1h_in_currency { get; set; }
    public PriceChangePercentage24hInCurrency price_change_percentage_24h_in_currency { get; set; }
    public PriceChangePercentage7dInCurrency price_change_percentage_7d_in_currency { get; set; }
    public PriceChangePercentage14dInCurrency price_change_percentage_14d_in_currency { get; set; }
    public PriceChangePercentage30dInCurrency price_change_percentage_30d_in_currency { get; set; }
    public PriceChangePercentage60dInCurrency price_change_percentage_60d_in_currency { get; set; }
    public PriceChangePercentage200dInCurrency price_change_percentage_200d_in_currency { get; set; }
    public PriceChangePercentage1yInCurrency price_change_percentage_1y_in_currency { get; set; }
    public double? total_supply { get; set; }
    public double? max_supply { get; set; }
    public double? circulating_supply { get; set; }
    public DateTime last_updated { get; set; }
}

public class PriceChange24hInCurrency
{
    public double? btc { get; set; }
    public double? eth { get; set; }
    public double? usd { get; set; }
}

public class PriceChangePercentage14dInCurrency
{
    public double? btc { get; set; }
    public double? eth { get; set; }
    public double? usd { get; set; }
}

public class PriceChangePercentage1hInCurrency
{
    public double? btc { get; set; }
    public double? eth { get; set; }
    public double? usd { get; set; }
}

public class PriceChangePercentage1yInCurrency
{
    public double? btc { get; set; }
    public double? eth { get; set; }
    public double? usd { get; set; }
}

public class PriceChangePercentage200dInCurrency
{
    public double? btc { get; set; }
    public double? eth { get; set; }
    public double? usd { get; set; }
}

public class PriceChangePercentage24hInCurrency
{
    public double? btc { get; set; }
    public double? eth { get; set; }
    public double? usd { get; set; }
}

public class PriceChangePercentage30dInCurrency
{
    public double? btc { get; set; }
    public double? eth { get; set; }
    public double? usd { get; set; }
}

public class PriceChangePercentage60dInCurrency
{
    public double? btc { get; set; }
    public double? eth { get; set; }
    public double? usd { get; set; }
}

public class PriceChangePercentage7dInCurrency
{
    public double? btc { get; set; }
    public double? eth { get; set; }
    public double? usd { get; set; }
}

public class Project
{
    public string type { get; set; }
    public string id { get; set; }
    public string name { get; set; }
    public string symbol { get; set; }
    public Image image { get; set; }
}

public class PublicinterestStats
{
    public int?  alexa_rank { get; set; }
    public object bing_matches { get; set; }
}

public class ReposUrl
{
    public List<string> github { get; set; }
    public List<object> bitbucket { get; set; }
}

public class StatusUpdate
{
    public string description { get; set; }
    public string category { get; set; }
    public DateTime created_at { get; set; }
    public string user { get; set; }
    public string user_title { get; set; }
    public bool pin { get; set; }
    public Project project { get; set; }
}

public class Ticker
{
    public string @base { get; set; }
    public string target { get; set; }
    public Market market { get; set; }
    public double? last { get; set; }
    public double? volume { get; set; }
    public ConvertedLast converted_last { get; set; }
    public ConvertedVolume converted_volume { get; set; }
    public string trust_score { get; set; }
    public double? bid_ask_spread_percentage { get; set; }
    public DateTime timestamp { get; set; }
    public DateTime last_traded_at { get; set; }
    public DateTime last_fetch_at { get; set; }
    public bool is_anomaly { get; set; }
    public bool is_stale { get; set; }
    public string trade_url { get; set; }
    public object token_info_url { get; set; }
    public string coin_id { get; set; }
    public string target_coin_id { get; set; }
}

public class TotalVolume
{
    public long usd { get; set; }
}
