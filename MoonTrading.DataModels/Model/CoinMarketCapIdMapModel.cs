using Newtonsoft.Json;

namespace MoonTrading.Model;
public class CoinMarketCapIDMapModel
{
    [JsonProperty("id")]
    public int Id { get; set; }
    [JsonProperty("rank")]
    public int Rank { get; set; }
    [JsonProperty("name")]
    public string Name { get; set; } = "";
    [JsonProperty("symbol")]
    public string Symbol { get; set; } = "";
    [JsonProperty("slug")]
    public string Slug { get; set; } = "";
}

public class CoinMarketCapIDMapModelData
{
    [JsonProperty("data")]
    public IEnumerable<CoinMarketCapIDMapModel> CoinMarketCapMaps { get; set; } = Enumerable.Empty<CoinMarketCapIDMapModel>();
}
