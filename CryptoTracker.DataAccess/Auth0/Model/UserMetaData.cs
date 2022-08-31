using Newtonsoft.Json;

namespace CryptoTracker.DataAccess.Auth0.Model;

public class UserMetaData
{
    [JsonProperty("FavoriteCoins")]
    public IEnumerable<UserFavoriteCoinModel> FavoriteCoins { get; set; } = Enumerable.Empty<UserFavoriteCoinModel>();
}
