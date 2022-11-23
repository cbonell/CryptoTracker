using MoonTrading.DataAccess.Data.Interfaces;
using static SharedConstants.Constants;
using static MoonTrading.BusinessLogic.Validation.UserWalletDataValidation;

namespace MoonTrading.DataAccess.Data;

public class UserWalletData : DataBase, IUserWalletData
{
    public UserWalletData(ISqlDataAccess db) : base(db) { }

    public Task<IEnumerable<UserWalletModel>> GetUserWallet(string userId)
    { 
        if(!IsValidUser(userId))
        {
            throw new Exception(InvalidUserId);
        }

        return _db.LoadData<UserWalletModel, dynamic>("[dbo].[GetUserWallet]", new { UserId = userId });
    }

    public Task ResetUserWallet(string userId)
    {
        if (!IsValidUser(userId))
        {
            throw new Exception(InvalidUserId);
        }

        return _db.SaveData<dynamic>("[dbo].[ResetUserTradingProfile]", new { UserId = userId });
    }

    public Task InitializeUserWalletForPaperTrading(string userId)
    {
        if (!IsValidUser(userId))
        {
            throw new Exception(InvalidUserId);
        }

        return _db.SaveData<dynamic>("[dbo].[InitializeUserWalletForPaperTrading]", new { UserId = userId });
    }
}
