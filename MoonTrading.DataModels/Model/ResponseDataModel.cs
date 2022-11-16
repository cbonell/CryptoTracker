using Newtonsoft.Json;

namespace MoonTrading.Model;
public class ResponseDataModel
{
    [JsonProperty("data")]
    public DataContainerModel DataContainerModel { get; set; } = new();
}
