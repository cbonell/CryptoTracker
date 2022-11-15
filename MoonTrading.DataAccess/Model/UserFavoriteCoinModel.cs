namespace MoonTrading.Tests.Model;
public class UserFavoriteCoinModel
{
    public int Id { get; set; }
    public string UserId { get; set; } = "";
    public string CoinGeckoId { get; set; } = "";
    public int CoinMarketCapId { get; set; }

    public string Name { get; set; }
}
