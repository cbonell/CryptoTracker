using System.Net.NetworkInformation;
using System.Reflection;
using System.Text.RegularExpressions;
using Newtonsoft.Json;
using static System.Net.Mime.MediaTypeNames;

namespace MoonTrading.Model;

public class TwitterUser
{
    [JsonProperty("name")]
    public string Name { get; set; } = "";

    [JsonProperty("screen_name")]
    public string ScreenName { get; set; } = "";

    [JsonProperty("url")]
    public string UserUrl { get; set; } = "";

    [JsonProperty("profile_image_url_https")]
    public string ImageUrl { get; set; } = "";
}

public class TweetSearchModel
{
    [JsonProperty("text")]
    private string Text { get; set; } = "";

    public string DisplayText
    {
        get
        {
            var allWords = Text.Split(' ');
            for(int i = 0; i < allWords.Length; i++)
            {
                if (allWords[i].Contains('#'))
                {
                    string s = $"https://twitter.com/hashtag/{allWords[i].Replace("#", "")}?src=hashtag_click";
                    allWords[i] = $"<a href=\"{s}\">{allWords[i]}</a>";
                }
            }
            return string.Join(" ", allWords);
        }
    }

    public string SentimentText
    {
        get
        {
            var normalizedWords = Regex.Replace(Text, "\\n", " ");
            normalizedWords = Regex.Replace(normalizedWords, "\\r\\n", " ");
            normalizedWords = normalizedWords.Replace("  ", String.Empty);
            normalizedWords = Regex.Replace(normalizedWords, @"[^\u0000-\u007F]+", string.Empty);
            var allWords = normalizedWords.Split(' ');
            for (int i = 0; i < allWords.Length; i++)
            {
                if (allWords[i].Contains("http"))
                {
                    allWords[i] = "";
                }
            }
            return string.Join(" ", allWords);
        }
    }

    public int? Sentiment { get; set; }

    [JsonProperty("source")]
    public string TweetUrl { get; set; } = "";

    [JsonProperty("created_at")]
    public string? CreatedAt { get; set; }

    [JsonProperty("retweet_count")]
    public int RetweetCount { get; set; }

    [JsonProperty("favorite_count")]
    public int FavoriteCount { get; set; }

    [JsonProperty("user")]
    public TwitterUser User { get; set; } = new();
}
