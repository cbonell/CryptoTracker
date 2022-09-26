using CryptoTracker.DataAccess.Caching;
using CryptoTracker.DataAccess.CoinMarketCapAccess.Model;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;

namespace CryptoTracker.DataAccess.Data;
public class CoinMarketCapMetaData : CoinMarketCapDataBase, IDataBase, ICoinMarketCapMetaData
{
    internal readonly ISqlDataAccess _db;

    public CoinMarketCapMetaData(ISqlDataAccess db)
    {
        _db = db;
    }

    public async Task<CoinMarketCapMetaDataModel> GetCoinMetaData(int id)
    {
        CachingService cachingService = new CachingService(_db);
        cachingService.CreateRequest(Constants.PROD_ENDPOINT + "/v1/cryptocurrency/info?id=" + id, resonseThreshold: 500);
        cachingService.AddHeader(AUTH_HEADER, API_KEY);
        RestResponse response = await cachingService.ExecuteAsync();
        if (response.StatusCode != System.Net.HttpStatusCode.OK)
        {
            return new CoinMarketCapMetaDataModel();
        }

        JObject data = JObject.Parse(response.Content!);
        if (data != null)
        {
            JToken token = data["data"] ?? "";
            CoinMarketCapMetaDataModel m = JsonConvert.DeserializeObject<CoinMarketCapMetaDataModel>(token[id.ToString()].ToString())!;
            return m;
        }


        return new CoinMarketCapMetaDataModel();
    }
}