using Newtonsoft.Json;

namespace CryptoTracker.DataAccess.Model;

public class TickerModel
{
    [JsonProperty("tag")]
    public string Tag { get; set; }

    [JsonProperty("pair")]
    public string Pair { get; set; }
    [JsonProperty("symbol")]
    public string Symbol { get; set; }
    [JsonProperty("markPrice")]
    public double MarkPrice { get; set; }
    [JsonProperty("bid")]
    public string Bid { get; set; }
    [JsonProperty("bidSize")]
    public double BidSize { get; set; }
    [JsonProperty("ask")]
    public double Ask { get; set; }
    [JsonProperty("askSize")]
    public double AskSize { get; set; }
    [JsonProperty("vol24h")]
    public double Vol24h { get; set; }
    [JsonProperty("last")]
    public double Last { get; set; }
    [JsonProperty("lastTime")]
    public DateTime? LastTime { get; set; }
    [JsonProperty("lastSize")]
    public double LastSize { get; set; }
}
