using CryptoTracker.DataAccess.CoinMarketCap.Model;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;

namespace CryptoTracker.DataAccess.CoinMarketCap.Data;
public class CoinMarketCapData
{
    // TODO: Move (azure key vault?)
    private static readonly string API_KEY = "62b7f061-e398-43a9-8c47-5df939073787";
    private static readonly string AUTH_HEADER = "X-CMC_PRO_API_KEY";

    public static async Task<IEnumerable<DataModel>> GetTrendingLatest()
    {
        RestClient client = new RestClient(Constants.DEV_ENDPOINT + "/v1/cryptocurrency/trending/latest");
        RestRequest request = new RestRequest()
        { 
            Method = Method.Get
        };
        request.AddHeader(AUTH_HEADER, API_KEY);
        RestResponse response = await client.ExecuteAsync(request);
        if(response.StatusCode != System.Net.HttpStatusCode.OK)
        {
            return Enumerable.Empty<DataModel>();
        }

        ResponseStatusModel status = HandleResponse(response.Content);
        if (status.Status.ErrorCode != 0)
        {
            return Enumerable.Empty<DataModel>();
        }

        ResponseDataModel responseData =  JsonConvert.DeserializeObject<ResponseDataModel>(response?.Content!)!;

        return responseData.DataContainerModel.DataModels;
    }

    private static ResponseStatusModel HandleResponse(string? responseContent)
    {
        if(!string.IsNullOrWhiteSpace(responseContent))
        {

            return JsonConvert.DeserializeObject<ResponseStatusModel>(responseContent)!;
        }

        return new ResponseStatusModel();
    }

    public static async Task GetCurrency()
    {
        RestClient client = new RestClient(Constants.PROD_ENDPOINT + "/v1/fiat/map");
        RestRequest request = new RestRequest()
        {
            Method = Method.Get
        };
        request.AddHeader(AUTH_HEADER, API_KEY);
        RestResponse response = await client.ExecuteAsync(request);
        JObject jobject = JObject.Parse(response?.Content!);
        JToken jt = jobject["data"] ?? "";
        string insert = "";
        foreach (JObject jProperty in jt)
        {
            insert += $"INSERT INTO Currency([CoinMarketCapId], [CurrencyTypeId], [Name], [Sign], [Symbol]) VALUES({jProperty["id"]}, 100, '{jProperty["name"]}', '{jProperty["sign"]}', '{jProperty["symbol"]}');" + Environment.NewLine;
        }

        insert += "";
    }
    
    public static async Task GetCurrencycoin()
    {
        RestClient client = new RestClient(Constants.PROD_ENDPOINT + "/v1/cryptocurrency/map");
        RestRequest request = new RestRequest()
        {
            Method = Method.Get
        };
        request.AddHeader(AUTH_HEADER, API_KEY);
        RestResponse response = await client.ExecuteAsync(request);
        JObject jobject = JObject.Parse(response?.Content!);
        JToken jt = jobject["data"] ?? "";
        string insert = "";
        foreach (JObject jProperty in jt)
        {
            insert += $"INSERT INTO Currency([CoinMarketCapId], [CurrencyTypeId], [Name], [Sign], [Symbol]) VALUES({jProperty["id"]}, 101, '{jProperty["name"]}', '', '{jProperty["symbol"]}');" + Environment.NewLine;
        }

        insert += "";
    }
}
