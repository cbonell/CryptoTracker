namespace CryptoTracker.DataAccess.Model;

public class PriceAlertModel
{
    public int Id { get; set; }
    public string CoinGeckoId { get; set; }
    public string email { get; set; } = "";
    public int AlertType { get; set; }
    public double AlertPrice { get; set; }
}
