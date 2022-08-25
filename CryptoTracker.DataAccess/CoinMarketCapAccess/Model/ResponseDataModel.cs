using Newtonsoft.Json;

namespace CryptoTracker.DataAccess.CoinMarketCap.Model;
public class ResponseDataModel
{
    [JsonProperty("data")]
    public DataContainerModel DataContainerModel { get; set; }
}
