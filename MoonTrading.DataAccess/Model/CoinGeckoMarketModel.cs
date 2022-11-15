namespace MoonTrading.Tests.Model;

public class CoinGeckoMarketModel : CoinGeckCoinModel
{
    public string image { get; set; } = "";
    public double current_price { get; set; }
    public long market_cap { get; set; }
    public int market_cap_rank { get; set; }
    public long total_volume { get; set; }
    public double high_24h { get; set; }
    public double low_24h { get; set; }
    public double price_change_24h { get; set; }
    public double price_change_percentage_24h { get; set; }
    public double market_cap_change_24h { get; set; }
    public double market_cap_change_percentage_24h { get; set; }
    public double circulating_supply { get; set; }
    public double? total_supply { get; set; }
    public double? max_supply { get; set; }
}
