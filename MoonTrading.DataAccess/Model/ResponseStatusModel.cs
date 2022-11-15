using Newtonsoft.Json;

namespace MoonTrading.Tests.Model;
public class ResponseStatusModel
{
    [JsonProperty("status")]
    public Status Status { get; set; } = new Status();
}
