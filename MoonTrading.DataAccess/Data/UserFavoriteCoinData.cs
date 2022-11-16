using MoonTrading.Tests.Data.Interfaces;
using static SharedConstants.Constants;

namespace MoonTrading.Tests.Data;

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

    public Task AddUserFavoriteCoin(string userId, string geckoId)
    {
        if(string.IsNullOrEmpty(geckoId))
        {
            throw new Exception(InvalidCoinId);
        }

        if(string.IsNullOrWhiteSpace(userId))
        {
            throw new Exception(InvalidUserId);
        }

        return _db.SaveData<dynamic>("[dbo].[AddUserFavoriteCoin]", new { UserId = userId, CoinGeckoId = geckoId });
    }

    public Task RemoveUserFavoriteCoin(string userId, string geckoId) =>
        _db.SaveData<dynamic>("[dbo].[RemoveUserFavoriteCoin]", new { UserId = userId, CoinGeckoId = geckoId });

    public async Task<bool> CheckIfCoinIsUsersFavorite(string userId, string geckoId)
    {
        var temp = await _db.LoadData<bool, dynamic>("[dbo].[CheckIfCoinIsUsersFavorite]", new { UserId = userId, CoinGeckoId = geckoId });
        if (!temp.Any())
        {
            return false;
        }
        else
        {
            return temp.First();
        }
    }
}
