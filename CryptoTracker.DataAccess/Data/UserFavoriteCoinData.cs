using CryptoTracker.DataAccess.Data.Interfaces;
using static SharedConstants.Constants;

namespace CryptoTracker.DataAccess.Data;

public class UserFavoriteCoinData : DataBase, IUserFavoriteCoinData
{
    public UserFavoriteCoinData(ISqlDataAccess db) : base(db) { }

    public Task<IEnumerable<UserFavoriteCoinModel>> GetUserFavoriteCoins(string userId)
    {
        if(string.IsNullOrWhiteSpace(userId))
        {
            throw new Exception(InvalidUserId);
        }

        return _db.LoadData<UserFavoriteCoinModel, dynamic>("[dbo].[GetUserFavoriteCoins]", new { UserId = userId });
    }

    public Task AddUserFavoriteCoin(string userId, int coinId)
    {
        if(coinId <= 0)
        {
            throw new Exception(InvalidCoinId);
        }

        if(string.IsNullOrWhiteSpace(userId))
        {
            throw new Exception(InvalidUserId);
        }

        return _db.SaveData<dynamic>("[dbo].[AddUserFavoriteCoin]", new { UserId = userId, CurrencyId = coinId });
    }

    public Task RemoveUserFavoriteCoin(string userId, int coinId) =>
        _db.SaveData<dynamic>("[dbo].[RemoveUserFavoriteCoin]", new { UserId = userId, CurrencyId = coinId });

    public async Task<bool> CheckIfCoinIsUsersFavorite(string userId, int coinId)
    {
        var temp = await _db.LoadData<bool, dynamic>("[dbo].[CheckIfCoinIsUsersFavorite]", new { UserId = userId, CurrencyId = coinId });
        if (temp.Any())
        {
            return false;
        }
        else
        {
            return temp.First();
        }
    }
}
