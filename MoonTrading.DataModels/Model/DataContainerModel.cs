using Newtonsoft.Json;

namespace MoonTrading.Model;
public class DataContainerModel
{
    [JsonProperty("data")]
    public IEnumerable<DataModel> DataModels { get; set; } = Enumerable.Empty<DataModel>();
}
