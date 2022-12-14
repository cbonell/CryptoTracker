using MoonTrading.Model;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;
namespace MoonTrading.BusinessLogic.Actions;

public static class TweetSearchDataHandler
{
    public static IEnumerable<TweetSearchModel> HandleTwitterReponse(RestResponse response)
    {
        IEnumerable<TweetSearchModel>? responseData = null;
        if (response.IsSuccessful)
        {
            try
            {
                JObject data = JObject.Parse(response.Content!);

                if (data != null)
                {
                    JToken? token = data.First;
                    if (token != null && token.First != null)
                    {
                        responseData = JsonConvert.DeserializeObject<IEnumerable<TweetSearchModel>>(token.First.ToString());
                    }
                }
            }
            catch (Exception)
            {
                responseData = null;
            }
        }

        return responseData ?? Enumerable.Empty<TweetSearchModel>();
    }
}
