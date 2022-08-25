using Newtonsoft.Json;

namespace CryptoTracker.DataAccess.CoinMarketCap.Model;
public class DataContainerModel
{
    [JsonProperty("data")]
    public IEnumerable<DataModel> DataModels { get; set; }
}
