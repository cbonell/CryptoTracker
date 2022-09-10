using CryptoTracker.DataAccess.CoinMarketCapAccess.Model;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;

namespace CryptoTracker.DataAccess.Data;
public class CoinMarketCapMetaData : CoinMarketCapDataBase
{
    public static async Task<CoinMarketCapMetaDataModel> GetCoinMetaData(int id)
    {
        RestClient client = new RestClient(Constants.PROD_ENDPOINT + "/v1/cryptocurrency/info?id=" + id);
        RestRequest request = new RestRequest()
        {
            Method = Method.Get
        };
        request.AddHeader(AUTH_HEADER, API_KEY);
        RestResponse response = await client.ExecuteAsync(request);
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