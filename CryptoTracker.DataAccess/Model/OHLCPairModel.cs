
namespace CryptoTracker.DataAccess.Model;

public class OHLCPairModel
{
    public DateTime? TimeStamp { get; set; }
    public double Open { get; set; }
    public double High { get; set; }
    public double Low { get; set; }
    public double Close { get; set; }
}
