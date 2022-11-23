using MoonTrading.DataAccess.Data.Interfaces;
using static SharedConstants.Constants;
using static MoonTrading.BusinessLogic.Validation.UserWalletDataValidation;

namespace MoonTrading.DataAccess.Data;

public class UserWalletData : DataBase, IUserWalletData
{
    public UserWalletData(ISqlDataAccess db) : base(db) { }

    /// <summary>
    /// Get a full collection of user wallet entries
    /// </summary>
    /// <param name="userId"></param>
    /// <returns></returns>
    /// <exception cref="Exception"></exception>
    public Task<IEnumerable<UserWalletModel>> GetUserWallet(string userId)
    { 
        if(!IsValidUser(userId))
        {
            throw new Exception(InvalidUserId);
        }

        return _db.LoadData<UserWalletModel, dynamic>("[dbo].[GetUserWallet]", new { UserId = userId });
    }

    /// <summary>
    /// Reset a users wallet to inital state
    /// </summary>
    /// <param name="userId"></param>
    /// <returns></returns>
    /// <exception cref="Exception">When <paramref name="userId"/> is null</exception>
    public Task ResetUserWallet(string userId)
    {
        if (!IsValidUser(userId))
        {
            throw new Exception(InvalidUserId);
        }

        return _db.SaveData<dynamic>("[dbo].[ResetUserTradingProfile]", new { UserId = userId });
    }

    /// <summary>
    /// Sets a user up for paper trading
    /// </summary>
    /// <param name="userId"></param>
    /// <returns></returns>
    /// <exception cref="Exception">When <paramref name="userId"/> is null</exception>
    public Task InitializeUserWalletForPaperTrading(string userId)
    {
        if (!IsValidUser(userId))
        {
            throw new Exception(InvalidUserId);
        }

        return _db.SaveData<dynamic>("[dbo].[InitializeUserWalletForPaperTrading]", new { UserId = userId });
    }
}
