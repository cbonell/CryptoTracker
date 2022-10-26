using Newtonsoft.Json;

namespace CryptoTracker.DataAccess.Model;
public class DataContainerModel
{
    [JsonProperty("data")]
    public IEnumerable<DataModel> DataModels { get; set; }
}
