using Newtonsoft.Json;

namespace CryptoTracker.DataAccess.Model;

public class CoinGeckCoinModel
{
    [JsonProperty("id")]
    public string? Id { get; set; }
    [JsonProperty("symbol")]
    public string? Symbol { get; set; }
    [JsonProperty("name")]
    public string? Name { get; set; }
    public int CoinMarketCapId { get; set; }
}
