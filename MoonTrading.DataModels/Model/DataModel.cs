using Newtonsoft.Json;

namespace MoonTrading.Model;
public class DataModel
{
    [JsonProperty("id")]
    public int Id { get; set; }

    [JsonProperty("name")]
    public string Name { get; set; } = "";
}
