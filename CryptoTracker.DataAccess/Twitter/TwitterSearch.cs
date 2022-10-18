using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;
using static SharedConstants.Constants;

namespace CryptoTracker.DataAccess.Twitter;

public class TwitterSearch
{
    public static async Task<IEnumerable<TwitterSearchModel>> ByCoin(string coinName)
    {
        if(string.IsNullOrEmpty(coinName))
        {
            throw new ArgumentNullException(nameof(coinName));
        }

        RestClient client = new RestClient($"https://api.twitter.com/2/tweets/search/recent?query=%23{coinName}");
        RestRequest request = new RestRequest()
        {
            Method = Method.Get
        };
        request.AddHeader("authorization", "Bearer AAAAAAAAAAAAAAAAAAAAAGmAhAEAAAAAFV190k%2FVMnf%2BWvVz3IOKen1Buso%3DhsB39Ka1AY2TmQtBvs0S9AtMYB9kAFCe8cgVGvFp8uivXD0WRl");
        request.AddHeader("content-type", "application/json");


        RestResponse response = await client.ExecuteAsync(request);

        JObject data = JObject.Parse(response.Content!);

        if (data != null)
        {
            JToken token = data.First;
            try
            {
                return JsonConvert.DeserializeObject<IEnumerable<TwitterSearchModel>>(token.First.ToString())!;
            }
            catch { }
        }

        return Enumerable.Empty<TwitterSearchModel>();
    }
    
    public static async Task<IEnumerable<TweetSearchModel>> TrendingByHashTag(string hashTag)
    {
        RestClient client = new RestClient($"  https://api.twitter.com/1.1/search/tweets.json?result_type=popular&lang=en&q=%23{hashTag}");
        RestRequest request = new RestRequest()
        {
            Method = Method.Get
        };
        request.AddHeader("authorization", $"Bearer {TwitterApiBearerToken}");
        request.AddHeader("content-type", "application/json");

        RestResponse response = await client.ExecuteAsync(request);

        JObject data = JObject.Parse(response.Content!);

        if (data != null)
        {
            JToken token = data.First;
            try
            {
                return JsonConvert.DeserializeObject<IEnumerable<TweetSearchModel>>(token.First.ToString())!;
            }
            catch { }
        }

        return Enumerable.Empty<TweetSearchModel>();
    }
}
