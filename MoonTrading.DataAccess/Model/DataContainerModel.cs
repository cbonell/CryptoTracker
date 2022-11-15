using Newtonsoft.Json;

namespace MoonTrading.Tests.Model;
public class DataContainerModel
{
    [JsonProperty("data")]
    public IEnumerable<DataModel> DataModels { get; set; }
}
