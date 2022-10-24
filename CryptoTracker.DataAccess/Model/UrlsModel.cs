using Newtonsoft.Json;

namespace CryptoTracker.DataAccess.Model;
public class UrlsModel
{
    [JsonProperty("website")]
    public List<string> Website { get; set; } = new List<string>();
    [JsonProperty("technical_doc")]
    public List<string> TechnicalDoc { get; set; } = new List<string>();
    [JsonProperty("twitter")]
    public List<string> Twitter { get; set; } = new List<string>();
    [JsonProperty("reddit")]
    public List<string> Reddit { get; set; } = new List<string>();
    [JsonProperty("message_board")]
    public List<string> MessageBoard { get; set; } = new List<string>();
    [JsonProperty("announcement")]
    public List<string> Announcements { get; set; } = new List<string>();
    [JsonProperty("chat")]
    public List<string> Chats { get; set; } = new List<string>();
    [JsonProperty("explorer")]
    public List<string> Explorer { get; set; } = new List<string>();
    [JsonProperty("source_code")]
    public List<string> SourceCode { get; set; } = new List<string>();
}