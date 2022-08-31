namespace CryptoTracker.DataAccess.Data;

public class UserFavoriteCoinData : DataBase, IUserFavoriteCoinData
{
    public UserFavoriteCoinData(ISqlDataAccess db) : base(db) { }

    public Task<IEnumerable<UserFavoriteCoinModel>> GetUserFavoriteCoins(string auth0UserId) =>
        _db.LoadData<UserFavoriteCoinModel, dynamic>("dbo.[GetUserFavoriteCoinsByAuth0Id]", new { Auth0UserId = auth0UserId });

    public Task AddUserFavoriteCoin(int userId, int coinId) =>
        _db.SaveData<dynamic>("dbo.[AddNewUserFavoriteCoin]", new { UserId = userId, CoinId = coinId });

    public Task RemoveUserFavoriteCoin(int userId, int coinId) =>
        _db.SaveData<dynamic>("dbo.[RemoveUserFavoriteCoin]", new { UserId = userId, CoinId = coinId });
}
