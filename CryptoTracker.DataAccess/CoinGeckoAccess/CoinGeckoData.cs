using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;

namespace CryptoTracker.DataAccess.CoinGeckoAccess;

public class CoinGeckoData
{
    public static async Task<double> GetPriceInUsd(string currency)
    {
        // 
        RestClient client = new RestClient($"https://api.coingecko.com/api/v3/simple/price?ids={currency}&vs_currencies=usd");
        RestRequest request = new RestRequest()
        {
            Method = Method.Get
        };
        RestResponse response = await client.ExecuteAsync(request);
        JObject data = JObject.Parse(response.Content!);
        if (data != null)
        {
            JToken token = data.First;
            double m = JsonConvert.DeserializeObject<double>(token.First.First.ToString())!;
            return m;
        }
        return 0;
    }
}
