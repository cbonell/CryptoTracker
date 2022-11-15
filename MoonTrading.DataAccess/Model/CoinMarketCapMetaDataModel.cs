using Newtonsoft.Json;

namespace MoonTrading.Tests.Model;
public class CoinMarketCapMetaDataModel
{
    [JsonProperty("urls")]
    public UrlsModel Urls { get; set; } = new UrlsModel();
    [JsonProperty("logo")]
    public string LogoPath { get; set; } = "";
    [JsonProperty("Id")]
    public int CoinMarketCapId { get; set; } = 0;
    [JsonProperty("name")]
    public string Name { get; set; } = "";
    [JsonProperty("symbol")]
    public string Symbol { get; set; } = "";
    [JsonProperty("slug")]
    public string Slug { get; set; } = "";
    [JsonProperty("description")]
    public string Description { get; set; } = "";
    [JsonProperty("date_added")]
    public DateTime? DateAdded { get; set; }
    [JsonProperty("date_launched")]
    public DateTime? DateLaunched { get; set; }
    [JsonProperty("tags")]
    public List<string> Tags { get; set; } = new List<string>();
    [JsonProperty("category")]
    public string Category { get; set; } = "";

}
