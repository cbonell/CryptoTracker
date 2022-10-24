using CryptoTracker.DataAccess.Caching;
using CryptoTracker.DataAccess.CoinGeckoAccess;
using CryptoTracker.DataAccess.Data.Interfaces;
using Microsoft.Extensions.Caching.Memory;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;
using static SharedConstants.Constants;

namespace CryptoTracker.DataAccess.Data;
public class CoinMarketCapData : DataBase, ICoinMarketCapData
{
    // TODO: Move (azure key vault?)
    private static readonly string API_KEY = "62b7f061-e398-43a9-8c47-5df939073787";
    private static readonly string AUTH_HEADER = "X-CMC_PRO_API_KEY";
    internal readonly IMemoryCache _memoryCache;

    public CoinMarketCapData(ISqlDataAccess db, IMemoryCache memory) : base(db)
    {
        _memoryCache = memory;
    }

    public async Task<double> GetPriceConversion(double amount, int baseId, int convertId)
    {
        string cacheKey = $"{amount}-{baseId}-{convertId}";
        double price;
        if (!_memoryCache.TryGetValue(cacheKey, out price))
        {
            var cacheEntryOptions = new MemoryCacheEntryOptions()
                .SetAbsoluteExpiration(TimeSpan.FromHours(12));

            RestClient client = new RestClient();
            RestRequest request = new RestRequest(PROD_ENDPOINT + $"/v2/tools/price-conversion?convert_id={convertId}&id={baseId}&amount={amount}")
                                     .AddHeader(AUTH_HEADER, API_KEY);
            RestResponse response = await client.ExecuteAsync(request);

            if (response.StatusCode != System.Net.HttpStatusCode.OK)
            {
                return 0;
            }

            ResponseStatusModel status = HandleResponse(response.Content);
            if (status.Status.ErrorCode != 0)
            {
                return 0;
            }

            JObject data = JObject.Parse(response.Content!);
            price = double.Parse(data["data"]["quote"][convertId.ToString()]["price"].ToString());
            _memoryCache.Set(cacheKey, price, cacheEntryOptions);
        }

        return price;
    }

    private static ResponseStatusModel HandleResponse(string? responseContent)
    {
        if (!string.IsNullOrWhiteSpace(responseContent))
        {

            return JsonConvert.DeserializeObject<ResponseStatusModel>(responseContent)!;
        }

        return new ResponseStatusModel();
    }

    public async Task<List<CoinMarketCapIDMapModel>> GetTrending()
    {
        CoinGeckoData geckoData = new CoinGeckoData(_db, _memoryCache);
        List<string> trendingNames = await geckoData.GetTrending();

        CoinMarketCapIDMapData coinMarketCapIDMap = new(_db, _memoryCache);
        IEnumerable<CoinMarketCapIDMapModel> coins = await coinMarketCapIDMap.GetCoinMap();

        List<CoinMarketCapIDMapModel> trendingCoins = new List<CoinMarketCapIDMapModel>();
        foreach (CoinMarketCapIDMapModel coin in coins)
        {
            if (trendingNames.Contains(coin.Name))
            {
                trendingCoins.Add(coin);
            }
        }

        return trendingCoins;
    }
}
