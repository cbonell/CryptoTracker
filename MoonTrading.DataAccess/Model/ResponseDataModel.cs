using Newtonsoft.Json;

namespace MoonTrading.Tests.Model;
public class ResponseDataModel
{
    [JsonProperty("data")]
    public DataContainerModel DataContainerModel { get; set; }
}
