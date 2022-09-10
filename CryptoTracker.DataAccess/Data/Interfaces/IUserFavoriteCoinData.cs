namespace CryptoTracker.DataAccess.Data.Interfaces
{
    public interface IUserFavoriteCoinData
    {
        Task AddUserFavoriteCoin(string userId, int CurrencyId);
        Task<bool> CheckIfCoinIsUsersFavorite(string userId, int coinId);
        Task<IEnumerable<UserFavoriteCoinModel>> GetUserFavoriteCoins(string userId);
        Task RemoveUserFavoriteCoin(string userId, int CurrencyId);
    }
}