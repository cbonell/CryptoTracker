using CryptoTracker.DataAccess.Data.Interfaces;

namespace CryptoTracker.DataAccess.Data;

public class UserFavoriteCoinData : DataBase, IUserFavoriteCoinData
{
    public UserFavoriteCoinData(ISqlDataAccess db) : base(db) { }

    public Task<IEnumerable<UserFavoriteCoinModel>> GetUserFavoriteCoins(string userId) =>
        _db.LoadData<UserFavoriteCoinModel, dynamic>("[dbo].[GetUserFavoriteCoins]", new { UserId = userId });

    public Task AddUserFavoriteCoin(string userId, int coinId) =>
        _db.SaveData<dynamic>("[dbo].[AddUserFavoriteCoin]", new { UserId = userId, CurrencyId = coinId });

    public Task RemoveUserFavoriteCoin(string userId, int coinId) =>
        _db.SaveData<dynamic>("[dbo].[RemoveUserFavoriteCoin]", new { UserId = userId, CurrencyId = coinId });

    public async Task<bool> CheckIfCoinIsUsersFavorite(string userId, int coinId)
    {
        var temp =await _db.LoadData<bool, dynamic>("[dbo].[CheckIfCoinIsUsersFavorite]", new { UserId = userId, CurrencyId = coinId });
        if(temp.Count() <= 0)
        {
            return false;
        }
        else
        {
            return temp.First();
        }
    }
}
