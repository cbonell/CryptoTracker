using Newtonsoft.Json;

namespace CryptoTracker.DataAccess.Model;
public class ResponseDataModel
{
    [JsonProperty("data")]
    public DataContainerModel DataContainerModel { get; set; }
}
