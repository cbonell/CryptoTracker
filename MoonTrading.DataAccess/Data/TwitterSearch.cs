using RestSharp;
using static SharedConstants.Constants;
using MoonTrading.BusinessLogic.Actions;
using MoonTrading.DataAccess.Data.Interfaces;
using Microsoft.Extensions.Configuration;

namespace MoonTrading.DataAccess.Data;

public class TwitterSearch : ITwitterSearch
{
    private static string[] blackListWords = { "giveaway", "winner", "\"giving away\"", "won" };
    readonly IConfiguration _config;

    public TwitterSearch(IConfiguration config)
    {
        _config = config;
    }


    /// <summary>
    /// Search for trending tweets based a supplied hashtag
    /// </summary>
    /// <param name="hashTag"></param>
    /// <returns></returns>
    /// <exception cref="ArgumentNullException"></>When <paramref name="hashTag"/> is null</exception>
    public async Task<IEnumerable<TweetSearchModel>> GetTrendingByHashTag(string hashTag)
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
        request.AddHeader("authorization", $"Bearer {_config.GetSection(TwitterApiBearerToken).Value}");
        request.AddHeader("content-type", "application/json");

        RestResponse response = await client.ExecuteAsync(request);
        return TweetSearchDataHandler.HandleTwitterReponse(response);
    }
}
