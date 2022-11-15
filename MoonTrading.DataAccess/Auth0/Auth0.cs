using MoonTrading.Tests.Auth0.Model;
using Newtonsoft.Json;
using RestSharp;
using static SharedConstants.Constants;

namespace MoonTrading.Tests.Auth0;

public class Auth0
{
    public static async Task<UserMetaDataContainer> GetUserMetaData(string auth0UserId)
    {
        var client = new RestClient(AUTH0_API_ENDPOINT + "users/" + auth0UserId);
        var request = new RestRequest()
        {
            Method = Method.Get
        };
        request.AddHeader("authorization", "Bearer " + AUTH0_API_TOKEN);
        request.AddHeader("content-type", "application/json");
        RestResponse response = await client.ExecuteAsync(request);

        UserMetaDataContainer userMetaData = new UserMetaDataContainer();
        if (response.IsSuccessful)
        {
            userMetaData = JsonConvert.DeserializeObject<UserMetaDataContainer>(response.Content)!;
        }
        return userMetaData;
    }

    public static async Task AddUserFavoriteCoin(string auth0UserId, string geckoId)
    {
        var client = new RestClient(AUTH0_API_ENDPOINT + "users/" + auth0UserId);
        var request = new RestRequest()
        {
            Method = Method.Patch
        };
        UserMetaDataContainer l = await GetUserMetaData(auth0UserId);
        l.UserMetaData.FavoriteCoins = l.UserMetaData.FavoriteCoins.Append(new UserFavoriteCoinModel { UserId = auth0UserId, CoinGeckoId = geckoId });
        string json = JsonConvert.SerializeObject(l);

        request.AddHeader("authorization", "Bearer " + AUTH0_API_TOKEN);
        request.AddHeader("content-type", "application/json");
        request.AddParameter("application/json", json, ParameterType.RequestBody);
        RestResponse response = await client.ExecuteAsync(request);
    }
}
