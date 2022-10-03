using RestSharp;
using Newtonsoft.Json;
using CryptoTracker.DataAccess.Caching;
using CryptoTracker.DataAccess.Data.Interfaces;

namespace CryptoTracker.DataAccess.Data;
public class CoinMarketCapIDMapData : CoinMarketCapDataBase, ICoinMarketCapIDMapData, IDataBase
{
    internal readonly ISqlDataAccess _db;

    public CoinMarketCapIDMapData(ISqlDataAccess db)
    {
        _db = db;
    }

    public async Task<IEnumerable<CoinMarketCapIDMapModel>> GetCoinMap()
    {
        CachingService cachingService = new CachingService(_db);
        cachingService.CreateRequest(Constants.PROD_ENDPOINT + "/v1/cryptocurrency/map", resonseThreshold: 500);
        cachingService.AddHeader(AUTH_HEADER, API_KEY);
        RestResponse response = await cachingService.ExecuteAsync();
        if (response.StatusCode != System.Net.HttpStatusCode.OK)
        {
            return Enumerable.Empty<CoinMarketCapIDMapModel>();
        }

        CoinMarketCapIDMapModelData data = JsonConvert.DeserializeObject<CoinMarketCapIDMapModelData>(response.Content!)!;
        return data.CoinMarketCapMaps;
    }
}
