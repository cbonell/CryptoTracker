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

    public double? Open7dAvg { get; set; }
    public double? High7dAvg { get; set; } = 0;
    public double? Low7dAvg { get; set; } = 0;
    public double? Close7dAvg { get; set; } = 0;
    public double? OpenIncrease { get; set; } = 0;
    public double? HighIncrease { get; set; } = 0;
    public double? LowIncrease { get; set; } = 0;
    public double? CloseIncrease { get; set; } = 0;
    public double? Open7dIncrease { get; set; } = 0;
    public double? High7dIncrease { get; set; } = 0;
    public double? Low7dIncrease { get; set; } = 0;
    public double? Close7dIncrease { get; set; } = 0;
    public double? RowStdev { get; set; } = 0;
    public double? Close7dStdev { get; set; } = 0;

}
