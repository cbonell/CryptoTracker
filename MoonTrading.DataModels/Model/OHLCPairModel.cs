using MoonTrading.Tools;
using Newtonsoft.Json;
using static MoonTrading.Extensions.Extensions;
namespace MoonTrading.Model;

public class OHLCPairModel
{
    [JsonProperty("time")]
    private long? Time
    {
        set
        {
            TimeStamp = value.DateTimeFromUnixTimeStampMillis();
        }
    }

    public DateTime? TimeStamp { get; set; }
    [JsonProperty("open")]
    public double? Open { get; set; }
    [JsonProperty("high")]
    public double? High { get; set; }
    [JsonProperty("low")]
    public double? Low { get; set; }
    [JsonProperty("close")]
    public double? Close { get; set; }
    [JsonProperty("volume")]
    public int Volume { get; set; }
    [JsonProperty("quote_volume")]
    public double QuoteVolume { get; set; }
}
