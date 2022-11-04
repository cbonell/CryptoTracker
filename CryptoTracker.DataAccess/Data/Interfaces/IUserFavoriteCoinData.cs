namespace CryptoTracker.DataAccess.Data.Interfaces
{
    public interface IUserFavoriteCoinData
    {
        Task AddUserFavoriteCoin(string userId, string geckoId);
        Task<bool> CheckIfCoinIsUsersFavorite(string userId, string geckoId);
        Task<IEnumerable<UserFavoriteCoinModel>> GetUserFavoriteCoins(string userId);
        Task RemoveUserFavoriteCoin(string userId, string geckoId);
    }
}