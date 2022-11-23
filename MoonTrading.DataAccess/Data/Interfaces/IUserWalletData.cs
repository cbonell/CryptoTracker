namespace MoonTrading.DataAccess.Data.Interfaces;

public interface IUserWalletData
{
    Task<IEnumerable<UserWalletModel>> GetUserWallet(string userId);
    Task InitializeUserWalletForPaperTrading(string userId);
    Task ResetUserWallet(string userId);
}