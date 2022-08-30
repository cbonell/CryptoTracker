using Newtonsoft.Json;

namespace CryptoTracker.DataAccess.CoinMarketCap.Model;
public class ResponseStatusModel
{
    [JsonProperty("status")]
    public Status Status { get; set; }
}
