namespace CryptoTracker.DataAccess.Data
{
    public interface IUserFavoriteCoinData
    {
        Task AddUserFavoriteCoin(int userId, int coinId);
        Task<IEnumerable<UserFavoriteCoinModel>> GetUserFavoriteCoins(string auth0UserId);
        Task RemoveUserFavoriteCoin(int userId, int coinId);
    }
}