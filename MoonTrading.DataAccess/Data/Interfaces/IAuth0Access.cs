namespace MoonTrading.DataAccess.Data
{
    public interface IAuth0Access
    {
        Task<UserMetaDataContainer> GetUserMetaData(string auth0UserId);
    }
}