using Newtonsoft.Json;

namespace MoonTrading.Model;

public class UserMetaData
{
    [JsonProperty("FavoriteCoins")]
    public IEnumerable<UserFavoriteCoinModel> FavoriteCoins { get; set; } = Enumerable.Empty<UserFavoriteCoinModel>();
}
