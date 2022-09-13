using CryptoTracker.DataAccess.Data.Interfaces;

namespace CryptoTracker.DataAccess.Data;

public class UserWalletData : DataBase, IUserWalletData
{
    public UserWalletData(ISqlDataAccess db) : base(db) { }

    public Task<IEnumerable<UserWalletModel>> GetUserWallet(string userId)
        => _db.LoadData<UserWalletModel, dynamic>("[dbo].[GetUserWallet]", new { UserId = userId });

    public Task ResetUserWallet(string userId)
        => _db.SaveData<dynamic>("[dbo].[ResetUserTradingProfile]", new { UserId = userId });

    public Task InitializeUserWalletForPaperTrading(string userId)
        => _db.SaveData<dynamic>("[dbo].[InitializeUserWalletForPaperTrading]", new { UserId = userId });
}
