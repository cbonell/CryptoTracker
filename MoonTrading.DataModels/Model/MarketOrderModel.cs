namespace MoonTrading.Model;

public class MarketOrderModel : CoinGeckCoinModel
{
    public string CoinGeckoId { get; set; } = "";
    public string UserId { get; set; } = "";
    public string UserEmail { get; set; } = "";
    public double PurchasePrice { get; set; }
    public double Quantity { get; set; }
    public int OrderType { get; set; }
}
