using MoonTrading.Tests.Caching;
using MoonTrading.Tests.CoinGeckoAccess;
using MoonTrading.Tests.Data.Interfaces;
using Microsoft.Extensions.Caching.Memory;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;
using static SharedConstants.Constants;

namespace MoonTrading.Tests.Data;
public class CoinMarketCapData : DataBase, ICoinMarketCapData
{
    // TODO: Move (azure key vault?)
    public static readonly string API_KEY = "62b7f061-e398-43a9-8c47-5df939073787";
    public static readonly string AUTH_HEADER = "X-CMC_PRO_API_KEY";
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
            RestRequest request = new RestRequest(PROD_ENDPOINT + $"/v2/MoonTrading.Tools/price-conversion?convert_id={convertId}&id={baseId}&amount={amount}")
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

    public async Task<CoinMarketCapMetaDataModel> GetCoinMetaData(int id)
    {
        if (id < 0)
        {
            throw new Exception(InvalidCoinMarketCapId);
        }

        CoinMarketCapMetaDataModel coinMarketCapMetaDataModel;
        string cacheKey = CacheKey.GetCoinMetaData.ToString() + id;// String.Format("{key}-{id}", CacheKey.GetCoinMetaData.ToString(), id.ToString());
        if (!_memoryCache.TryGetValue(cacheKey, out coinMarketCapMetaDataModel))
        {
            coinMarketCapMetaDataModel = new CoinMarketCapMetaDataModel();

            var cacheEntryOptions = new MemoryCacheEntryOptions()
                .SetAbsoluteExpiration(TimeSpan.FromHours(12));

            RestClient client = new RestClient();
            RestRequest request = new RestRequest(PROD_ENDPOINT + "/v1/cryptocurrency/info?id=" + id)
                                     .AddHeader(AUTH_HEADER, API_KEY);
            RestResponse response = await client.ExecuteAsync(request);

            if (response.StatusCode == System.Net.HttpStatusCode.OK)
            {
                JObject data = JObject.Parse(response.Content!);
                if (data != null)
                {
                    JToken token = data["data"] ?? "";
                    coinMarketCapMetaDataModel = JsonConvert.DeserializeObject<CoinMarketCapMetaDataModel>(token[id.ToString()].ToString())!;
                }
            }

            _memoryCache.Set(cacheKey, coinMarketCapMetaDataModel, cacheEntryOptions);
        }

        return coinMarketCapMetaDataModel;
    }

    public async Task<IEnumerable<CoinMarketCapIDMapModel>> GetCoinMap()
    {
        IEnumerable<CoinMarketCapIDMapModel> coins = Enumerable.Empty<CoinMarketCapIDMapModel>();
        if (!_memoryCache.TryGetValue(CacheKey.GetCoinMap, out coins))
        {
            var cacheEntryOptions = new MemoryCacheEntryOptions()
                .SetAbsoluteExpiration(TimeSpan.FromHours(12));

            RestClient client = new RestClient();
            RestRequest request = new RestRequest(PROD_ENDPOINT + "/v1/cryptocurrency/map")
                                     .AddHeader(AUTH_HEADER, API_KEY);
            RestResponse response = await client.ExecuteAsync(request);

            CoinMarketCapIDMapModelData data = JsonConvert.DeserializeObject<CoinMarketCapIDMapModelData>(response.Content!)!;
            coins = data.CoinMarketCapMaps;
            _memoryCache.Set(CacheKey.GetCoinMap, coins, cacheEntryOptions);
        }

        return coins;
    }

}
