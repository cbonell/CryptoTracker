using Newtonsoft.Json;

namespace MoonTrading.Model;

public class TwitterSearchModel
{
    [JsonProperty("id")]
    public string Id { get; set; } = "";
    [JsonProperty("text")]
    public string Text { get; set; } = "";
}
