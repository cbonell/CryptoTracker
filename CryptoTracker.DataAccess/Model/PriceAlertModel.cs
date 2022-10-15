namespace CryptoTracker.DataAccess.Model;

public class PriceAlertModel
{
    public int Id { get; set; }
    public int CurrencyId { get; set; }
    public string email { get; set; } = "";
    public int AlertType { get; set; }
    public double AlertPrice { get; set; }
}
