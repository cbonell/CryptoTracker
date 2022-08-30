namespace CryptoTracker.DataAccess.Model;
public class UserModel
{
    public int Id { get; set; }
    public string? FirstName { get; set; }
    public string? LastName { get; set; }
    public DateTime? DateCreated { get; set; }
    public DateTime? LastModified { get; set; }
}
