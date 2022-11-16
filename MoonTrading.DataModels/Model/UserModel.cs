namespace MoonTrading.Model;
public class UserModel
{
    public int Id { get; set; }
    public string? Auth0UserId { get; set; }
    public string? Name { get; set; }
    public string? NickName { get; set; }
    public DateTime? DateCreated { get; set; }
    public DateTime? LastModified { get; set; }
}
