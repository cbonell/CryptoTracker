using CryptoTracker.DataAccess.Caching;
using CryptoTracker.DataAccess.Data;
using CryptoTracker.DataAccess.Data.Interfaces;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;
using System;
using System.Globalization;

namespace CryptoTracker.DataAccess.CoinGeckoAccess;

public class CoinGeckoData : DataBase, ICoinGeckoData
{
    public CoinGeckoData(ISqlDataAccess db) : base(db) { }

    public async Task<double> GetPriceInUsd(string currency)
    {
        // If an error

        if (string.IsNullOrWhiteSpace(currency))
        {
            throw new ArgumentNullException("currency");
        }

        CachingService cachingService = new CachingService(_db);
        cachingService.CreateRequest($"https://api.coingecko.com/api/v3/simple/price?ids={currency}&vs_currencies=usd", resonseThreshold: 20);
        RestResponse response = new();
        try
        {
            response = await cachingService.ExecuteAsync();
        }
        catch (Exception e)
        {

        }
        JObject data = JObject.Parse(response.Content!);
        if (data != null)
        {
            JToken token = data.First;
            double m = JsonConvert.DeserializeObject<double>(token.First.First.First.ToString())!;
            return m;
        }


        return 0;
    }

    public async Task<IEnumerable<Tuple<double, string>>> GetPriceHistory(string currency)
    {
        if (string.IsNullOrWhiteSpace(currency))
        {
            throw new ArgumentNullException("currency");
        }

        currency = currency.ToLower();
        CachingService cachingService = new CachingService(_db);
        cachingService.CreateRequest($"https://api.coingecko.com/api/v3/coins/{currency}/market_chart?vs_currency=usd&days=1&interval=hourly", resonseThreshold: 4000);
        RestResponse response = await cachingService.ExecuteAsync();
        JObject data = JObject.Parse(response.Content!);
        if (data != null)
        {
            JToken token = JObject.Parse(response.Content!)["prices"];
            int counter = 25;
            var z = token.Select(x => new Tuple<double, string>((double)x[1], DateTime.Now.AddHours(-counter--).ToString()));
            return z;
        }
        return Enumerable.Empty<Tuple<double, string>>();
    }
    
    public async Task<List<string>> GetTrending()
    {
        CachingService cachingService = new CachingService(_db);
        cachingService.CreateRequest($"https://api.coingecko.com/api/v3/search/trending", resonseThreshold: 1 * 1000 * 60 * 24);
        RestResponse response = await cachingService.ExecuteAsync();
        JObject data = JObject.Parse(response.Content!);

        List<string> trending = new List<string>();
        if (data != null)
        {
            foreach(var i in data.First.First)
            {
                trending.Add(i.First.First["name"].ToString());
            }
        }
        return trending;
    }
}
