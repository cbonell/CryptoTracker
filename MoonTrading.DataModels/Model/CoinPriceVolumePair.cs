namespace MoonTrading.Model;

public class CoinPriceVolumePair
{
    public List<VolumePairModel> VolumePairs { get; set; } = new List<VolumePairModel>();
    public List<DatePricePairModel> DatePricePairs { get; set; } = new List<DatePricePairModel>();
}
