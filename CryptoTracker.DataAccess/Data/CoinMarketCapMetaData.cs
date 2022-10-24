using CryptoTracker.DataAccess.Caching;
using CryptoTracker.DataAccess.CoinMarketCapAccess.Model;
using Microsoft.Extensions.Caching.Memory;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;
using static SharedConstants.Constants;

namespace CryptoTracker.DataAccess.Data;
public class CoinMarketCapMetaData : CoinMarketCapDataBase, IDataBase, ICoinMarketCapMetaData
{
    internal readonly ISqlDataAccess _db;
    internal IMemoryCache _memoryCache;
    public CoinMarketCapMetaData(ISqlDataAccess db, IMemoryCache memoryCache)
    {
        _db = db;
        _memoryCache = memoryCache;
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
            RestRequest request = new RestRequest(Constants.PROD_ENDPOINT + "/v1/cryptocurrency/info?id=" + id)
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
}