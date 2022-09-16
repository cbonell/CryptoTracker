using CryptoTracker.DataAccess.Caching;
using CryptoTracker.DataAccess.Data;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;

namespace CryptoTracker.DataAccess.CoinGeckoAccess;

public class CoinGeckoData : DataBase, ICoinGeckoData
{
    public CoinGeckoData(ISqlDataAccess db) : base(db) { }

    public async Task<double> GetPriceInUsd(string currency)
    {
        CachingService cachingService = new CachingService(_db);
        cachingService.CreateRequest($"https://api.coingecko.com/api/v3/simple/price?ids={currency}&vs_currencies=usd", resonseThreshold: 20);
        RestResponse response = await cachingService.ExecuteAsync();
        JObject data = JObject.Parse(response.Content!);
        if (data != null)
        {
            JToken token = data.First;
            double m = JsonConvert.DeserializeObject<double>(token.First.First.First.ToString())!;
            return m;
        }
        return 0;
    }
}
