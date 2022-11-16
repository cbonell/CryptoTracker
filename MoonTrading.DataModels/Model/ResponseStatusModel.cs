using Newtonsoft.Json;

namespace MoonTrading.Model;
public class ResponseStatusModel
{
    [JsonProperty("status")]
    public Status Status { get; set; } = new Status();
}
