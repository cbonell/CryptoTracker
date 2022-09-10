using RestSharp;
using Newtonsoft.Json;

namespace CryptoTracker.DataAccess.Data;
public class CoinMarketCapIDMapData : CoinMarketCapDataBase
{
    public static async Task<IEnumerable<CoinMarketCapIDMapModel>> GetCoinMap()
    {
        RestClient client = new(Constants.PROD_ENDPOINT + "/v1/cryptocurrency/map");
        RestRequest request = new()
        {
            Method = Method.Get
        };
        request.AddHeader(AUTH_HEADER, API_KEY);
        RestResponse response = await client.ExecuteAsync(request);
        if (response.StatusCode != System.Net.HttpStatusCode.OK)
        {
            return Enumerable.Empty<CoinMarketCapIDMapModel>();
        }

        CoinMarketCapIDMapModelData data = JsonConvert.DeserializeObject<CoinMarketCapIDMapModelData>(response.Content!)!;
        return data.CoinMarketCapMaps;
    }
}
