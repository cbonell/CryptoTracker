using CryptoTracker.DataAccess.Caching;
using CryptoTracker.DataAccess.Data;
using CryptoTracker.DataAccess.Data.Interfaces;
using Microsoft.Extensions.Caching.Memory;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;
using static SharedConstants.Constants;

namespace CryptoTracker.DataAccess.CoinGeckoAccess;

public class CoinGeckoData : DataBase, ICoinGeckoData
{
    internal IMemoryCache _memoryCache;
    public CoinGeckoData(ISqlDataAccess db, IMemoryCache memory) : base(db)
    {
        _memoryCache = memory;
    }

    public async Task<double> GetPriceInUsd(string currency)
    {
        if(string.IsNullOrWhiteSpace(currency))
        {
            throw new ArgumentNullException(nameof(currency));
        }

        double price;
        string cacheKey = $"{CacheKey.GetPriceInUsd}-{currency}";
        if (!_memoryCache.TryGetValue(cacheKey, out price))
        {
            var cacheEntryOptions = new MemoryCacheEntryOptions()
                .SetAbsoluteExpiration(TimeSpan.FromSeconds(10));

            RestClient client = new RestClient();
            RestRequest request = new RestRequest($"https://api.coingecko.com/api/v3/simple/price?ids={currency}&vs_currencies=usd");
            RestResponse response = await client.ExecuteAsync(request);
            JObject data = JObject.Parse(response.Content!);

            if (data != null)
            {
                JToken token = data.First;
               price = JsonConvert.DeserializeObject<double>(token.First.First.First.ToString())!;
            }

            _memoryCache.Set(cacheKey, price);
        }

        return price;
    }

    public async Task<IEnumerable<Tuple<double, string>>> GetPriceHistory(string currency)
    {
        if (string.IsNullOrWhiteSpace(currency))
        {
            throw new ArgumentNullException("currency");
        }

        currency = currency.ToLower();
        IEnumerable<Tuple<double, string>> responseData;
        if (!_memoryCache.TryGetValue(CacheKey.CoinGeckoGetTrending, out responseData))
        {
            responseData = Enumerable.Empty<Tuple<double, string>>();
            var cacheEntryOptions = new MemoryCacheEntryOptions()
                .SetAbsoluteExpiration(TimeSpan.FromHours(1));

            RestClient client = new RestClient();
            RestRequest request = new RestRequest($"https://api.coingecko.com/api/v3/coins/{currency}/market_chart?vs_currency=usd&days=1&interval=hourly");
            RestResponse response = await client.ExecuteAsync(request);
            JObject data = JObject.Parse(response.Content!);
            if (data != null)
            {
                JToken token = JObject.Parse(response.Content!)["prices"];
                int counter = 25;
                responseData = token.Select(x => new Tuple<double, string>((double)x[1], DateTime.Now.AddHours(-counter--).ToString()));
            }

            _memoryCache.Set(CacheKey.CoinGeckoGetTrending, responseData, cacheEntryOptions);
        }

        return responseData;
    }

    public async Task<List<string>> GetTrending()
    {
        List<string> coins = new ();
        if (!_memoryCache.TryGetValue(CacheKey.CoinGeckoGetTrending, out coins))
        {
            coins = new();
            var cacheEntryOptions = new MemoryCacheEntryOptions()
                .SetAbsoluteExpiration(TimeSpan.FromHours(12));

            RestClient client = new RestClient();
            RestRequest request = new RestRequest($"https://api.coingecko.com/api/v3/search/trending");
            RestResponse response = await client.ExecuteAsync(request);
            JObject data = JObject.Parse(response.Content!);

            if (data != null)
            {
                foreach (var i in data.First.First)
                {
                    coins.Add(i.First.First["name"].ToString());
                }
            }

            _memoryCache.Set(CacheKey.CoinGeckoGetTrending, coins, cacheEntryOptions);
        }
        return coins;
    }
}
