using MoonTrading.DataAccess.Data.Interfaces;
using static SharedConstants.Constants;

namespace MoonTrading.DataAccess.Data;

public class UserFavoriteCoinData : DataBase, IUserFavoriteCoinData
{
    public UserFavoriteCoinData(ISqlDataAccess db) : base(db) { }

    /// <summary>
    /// Get a collection of user favorite coins
    /// </summary>
    /// <param name="userId"></param>
    /// <returns>IEnumerable<UserFavoriteCoinModel></returns>
    /// <exception cref="Exception"></exception>
    public Task<IEnumerable<UserFavoriteCoinModel>> GetUserFavoriteCoins(string userId)
    {
        if(string.IsNullOrWhiteSpace(userId))
        {
            throw new Exception(InvalidUserId);
        }

        return _db.LoadData<UserFavoriteCoinModel, dynamic>("[dbo].[GetUserFavoriteCoins]", new { UserId = userId });
    }

    /// <summary>
    /// Add a new favorite coin for a user
    /// </summary>
    /// <param name="userId"></param>
    /// <param name="geckoId"></param>
    /// <returns></returns>
    /// <exception cref="Exception"></exception>
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

    /// <summary>
    /// Remove a specific favorite coin of a user
    /// </summary>
    /// <param name="userId"></param>
    /// <param name="geckoId"></param>
    /// <returns></returns>
    public Task RemoveUserFavoriteCoin(string userId, string geckoId) =>
        _db.SaveData<dynamic>("[dbo].[RemoveUserFavoriteCoin]", new { UserId = userId, CoinGeckoId = geckoId });

    /// <summary>
    /// Check if user has a specific coin marked as one of their favorites
    /// </summary>
    /// <param name="userId"></param>
    /// <param name="geckoId"></param>
    /// <returns>bool</returns>
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
