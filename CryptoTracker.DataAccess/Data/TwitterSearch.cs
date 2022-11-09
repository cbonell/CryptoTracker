using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;
using static SharedConstants.Constants;

namespace CryptoTracker.DataAccess.Data;

public class TwitterSearch
{
    private static string[] blackListWords = { "giveaway", "winner", "\"giving away\"" };
    public static async Task<IEnumerable<TweetSearchModel>> GetTrendingByHashTag(string hashTag)
    {
        if (string.IsNullOrEmpty(hashTag))
        {
            throw new ArgumentNullException(nameof(hashTag));
        }

        RestClient client = new RestClient($"https://api.twitter.com/1.1/search/tweets.json?result_type=popular&count=100&lang=en&q=(%23{hashTag} -{String.Join(" -", blackListWords)})");
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
