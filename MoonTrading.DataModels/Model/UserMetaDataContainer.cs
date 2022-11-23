using Newtonsoft.Json;

namespace MoonTrading.Model;

public class UserMetaDataContainer
{
    [JsonProperty("user_metadata")]
    public UserMetaData UserMetaData { get; set; } = new UserMetaData();
    [JsonProperty("email")]
    public string Email { get; set; } = "";
}
