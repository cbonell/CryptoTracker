using Newtonsoft.Json;

namespace MoonTrading.Model;

[JsonObject("item")]
public class CoinGeckoTrendingModel : CoinGeckCoinModel
{
    [JsonProperty("market_cap_rank")]
    public int MarketCapRank { get; set; }

    [JsonProperty("thumb")]
    public string ImagePath { get; set; } = "";
    public double PriceChange24hr { get; set; }
    public double CurrentPriceUsd { get; set; }
}
