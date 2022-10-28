namespace CryptoTracker.DataAccess.Model;

public class UserWalletModel
{
    public int Id { get; set; }
    public string UserId { get; set; } = "";
    public int CurrencyId { get; set; }
    public string CoinGeckoId { get; set; } = "";
    public double Quantity { get; set; }

    public int CurrencyTypeId { get; set; }
    public int CoinMarketCapId { get; set; }
    public string CurrencyName { get; set; } = "";
    public string Sign { get; set; } = "";
    public string Symbol { get; set; } = "";
}
