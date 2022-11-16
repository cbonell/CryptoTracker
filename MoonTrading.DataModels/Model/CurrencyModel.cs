namespace MoonTrading.Model;

public class CurrencyModel
{
    public int Id { get; set; }
    public int CoinMarketCapId { get; set; }
    public int CurrencyTypeId { get; set; }
    public string Name { get; set; } = "";
    public string Sign { get; set; } = "";
    public string Symbol { get; set; } = "";
}
