using Newtonsoft.Json;

namespace CryptoTracker.DataAccess.Auth0.Model;

public class UserMetaDataContainer
{
    [JsonProperty("user_metadata")]
    public UserMetaData UserMetaData { get; set; } = new UserMetaData();
    [JsonProperty("email")]
    public string Email { get; set; } = "";
}
