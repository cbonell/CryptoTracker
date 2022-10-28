using Newtonsoft.Json;

namespace CryptoTracker.DataAccess.Model;

[JsonObject("item")]
public class CoinGeckoTrendingModel : CoinGeckCoinModel
{
    [JsonProperty("market_cap_rank")]
    public int MarketCapRank { get; set; }

    [JsonProperty("thumb")]
    public string ImagePath { get; set; }
}
