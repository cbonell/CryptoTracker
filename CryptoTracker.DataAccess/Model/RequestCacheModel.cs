namespace CryptoTracker.DataAccess.Model;

public class RequestCacheModel
{
    public int Id { get; set; }
    public string RequestPath { get; set; } = "";
    public string Data { get; set; } = "";
    public string Method { get; set; } = "";
    public DateTime LastAccess { get; set; }
}
