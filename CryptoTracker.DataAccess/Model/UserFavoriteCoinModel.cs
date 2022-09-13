namespace CryptoTracker.DataAccess.Model;
public class UserFavoriteCoinModel
{
    public string UserId { get; set; } = "";
    public int CoinId { get; set; }
    public int CurrencyId { get; set; }
    public int CoinMarketCapId { get; set; }
    public string CoinName { get; set; } = "";
}
