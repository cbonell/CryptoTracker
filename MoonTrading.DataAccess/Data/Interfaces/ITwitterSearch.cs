namespace MoonTrading.DataAccess.Data.Interfaces
{
    public interface ITwitterSearch
    {
        Task<IEnumerable<TweetSearchModel>> GetTrendingByHashTag(string hashTag);
    }
}