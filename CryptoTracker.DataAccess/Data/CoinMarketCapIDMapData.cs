using RestSharp;
using Newtonsoft.Json;
using CryptoTracker.DataAccess.Caching;
using CryptoTracker.DataAccess.Data.Interfaces;
using Microsoft.Extensions.Caching.Memory;
using static SharedConstants.Constants;

namespace CryptoTracker.DataAccess.Data;
public class CoinMarketCapIDMapData : CoinMarketCapDataBase, ICoinMarketCapIDMapData, IDataBase
{
    internal readonly ISqlDataAccess _db;
    internal readonly IMemoryCache _memoryCache;

    public CoinMarketCapIDMapData(ISqlDataAccess db, IMemoryCache memory)
    {
        _db = db;
        _memoryCache = memory;
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
