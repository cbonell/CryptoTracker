using Newtonsoft.Json;

namespace CryptoTracker.DataAccess.Model;
public class ResponseStatusModel
{
    [JsonProperty("status")]
    public Status Status { get; set; } = new Status();
}
