using MoonTrading.Model;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;
namespace MoonTrading.BusinessLogic.Actions;

public static class TweetSearchDataHandler
{
    public static IEnumerable<TweetSearchModel> HandleTwitterReponse(RestResponse response)
    {
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
                        return JsonConvert.DeserializeObject<IEnumerable<TweetSearchModel>>(token.First.ToString());
                    }
                }
            }
            catch (Exception)
            { }
        }

        return Enumerable.Empty<TweetSearchModel>();
    }
}
