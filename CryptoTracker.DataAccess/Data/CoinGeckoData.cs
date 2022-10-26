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
        if (string.IsNullOrWhiteSpace(currency))
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
        List<string> coins = new();
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

    /// <summary>
    /// Returns OHLC pairs in 30 minute intervals
    /// </summary>
    /// <param name="coinName">Name of the coin</param>
    /// <param name="days">Number of days to be returned (deffault of 1)</param>
    /// <returns>List<OHLCPairModel></returns>
    public async Task<List<OHLCPairModel>> GetOHLCPairs(string coinName, int days = 1)
    {
        //
        if (string.IsNullOrEmpty(coinName) || days < 1)
        {
            throw new ArgumentException();
        }

        string cacheKey = $"GetOHLCPairs-{coinName}-{days}";
        List<OHLCPairModel> responseData = new();
        if (!_memoryCache.TryGetValue(cacheKey, out responseData))
        {
            responseData = new();
            var cacheEntryOptions = new MemoryCacheEntryOptions()
                .SetAbsoluteExpiration(TimeSpan.FromSeconds(30));

            RestClient client = new RestClient();
            RestRequest request = new RestRequest($"https://api.coingecko.com/api/v3/coins/{coinName}/ohlc?vs_currency=usd&days={days}");
            RestResponse response = await client.ExecuteAsync(request);
            JArray jArray = JArray.Parse(response.Content!);

            if (jArray != null && jArray.Count > 0)
            {
                for (int i = 0; i < jArray.Count; i++)
                {
                    if (jArray[i] != null)
                    {
                        string? time = jArray[i][0]?.ToString();
                        string? open = jArray[i][1]?.ToString();
                        string? high = jArray[i][2]?.ToString();
                        string? low = jArray[i][3]?.ToString();
                        string? close = jArray[i][4]?.ToString();

                        responseData.Add(new OHLCPairModel()
                        {
                            TimeStamp = DateTimeFromUnixTimestampMillis(long.Parse(time)),
                            Open = double.Parse(open),
                            High = double.Parse(high),
                            Low = double.Parse(low),
                            Close = double.Parse(close),
                        });
                    }
                }
            }


            _memoryCache.Set(CacheKey.CoinGeckoGetTrending, responseData, cacheEntryOptions);
        }

        return responseData;
    }

    public static DateTime DateTimeFromUnixTimestampMillis(long millis)
    {
        DateTime UnixEpoch = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);
        return UnixEpoch.AddMilliseconds(millis);
    }
}
