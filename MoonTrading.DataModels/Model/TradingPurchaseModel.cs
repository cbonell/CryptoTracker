namespace MoonTrading.Model;

public class TradingPurchaseModel
{
    public int Id { get; set; }
    public string UserId { get; set; } = "";
    public int PurchaseCurrencyId { get; set; }
    public string CoinId { get; set; } = "";
    public double Quantity { get; set; }
    public double PurchasePrice { get; set; }
    public DateTime PurchaseDate { get; set; }

    public string PurchaseCurrencyName { get; set; } = "";
    public int CoinMarketCapCoinId { get; set; }
    public string CoinName { get; set; } = "";
    public string TransactionType { get; set; } = "";
}
