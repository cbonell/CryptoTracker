using Newtonsoft.Json;
using RestSharp;
using static SharedConstants.Constants;

namespace MoonTrading.DataAccess.Data;

public class Auth0Access
{
    /// <summary>
    /// Retrieves user meta data based on <paramref name="auth0UserId"/>
    /// </summary>
    /// <param name="auth0UserId"></param>
    /// <returns><see cref="UserMetaDataContainer"/>Model containing user metadata</returns>
    /// <exception cref="ArgumentNullException"><paramref name="auth0UserId"/></exception>
    public static async Task<UserMetaDataContainer> GetUserMetaData(string auth0UserId)
    {
        if(string.IsNullOrWhiteSpace(auth0UserId))
        {
            throw new ArgumentNullException(nameof(auth0UserId));
        }

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
            userMetaData = JsonConvert.DeserializeObject<UserMetaDataContainer>(response.Content ?? "")!;
        }
        return userMetaData;
    }
}
