namespace CryptoTracker.DataAccess.Model;
public class UserFavoriteCoinModel
{
    public int Id { get; set; }
    public string UserId { get; set; } = "";
    public string CoinGeckoId { get; set; } = "";

    public string Name { get; set; }
}
