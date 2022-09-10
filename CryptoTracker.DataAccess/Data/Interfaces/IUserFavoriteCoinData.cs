namespace CryptoTracker.DataAccess.Data.Interfaces
{
    public interface IUserFavoriteCoinData
    {
        Task AddUserFavoriteCoin(int userId, int coinId);
        Task<IEnumerable<UserFavoriteCoinModel>> GetUserFavoriteCoins(string auth0UserId);
        Task RemoveUserFavoriteCoin(int userId, int coinId);
    }
}