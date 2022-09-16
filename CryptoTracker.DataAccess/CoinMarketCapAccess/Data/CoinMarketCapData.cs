using CryptoTracker.DataAccess.Caching;
using CryptoTracker.DataAccess.CoinMarketCap.Model;
using CryptoTracker.DataAccess.Data;
using Newtonsoft.Json;

using RestSharp;

namespace CryptoTracker.DataAccess.CoinMarketCap.Data;
public class CoinMarketCapData : DataBase, ICoinMarketCapData
{
    // TODO: Move (azure key vault?)
    private static readonly string API_KEY = "62b7f061-e398-43a9-8c47-5df939073787";
    private static readonly string AUTH_HEADER = "X-CMC_PRO_API_KEY";

    public CoinMarketCapData(ISqlDataAccess db) : base(db) { }

    public async Task<IEnumerable<DataModel>> GetTrendingLatest()
    {
        CachingService cachingService = new CachingService(_db);
        cachingService.CreateRequest(Constants.PROD_ENDPOINT + "/v1/cryptocurrency/trending/gainers-losers");
        cachingService.AddHeader(AUTH_HEADER, API_KEY);
        RestResponse response = await cachingService.ExecuteAsync();
        if (response.StatusCode != System.Net.HttpStatusCode.OK)
        {
            return Enumerable.Empty<DataModel>();
        }

        ResponseStatusModel status = HandleResponse(response.Content);
        if (status.Status.ErrorCode != 0)
        {
            return Enumerable.Empty<DataModel>();
        }

        ResponseDataModel responseData = JsonConvert.DeserializeObject<ResponseDataModel>(response?.Content!)!;

        return responseData.DataContainerModel.DataModels;
    }

    private static ResponseStatusModel HandleResponse(string? responseContent)
    {
        if (!string.IsNullOrWhiteSpace(responseContent))
        {

            return JsonConvert.DeserializeObject<ResponseStatusModel>(responseContent)!;
        }

        return new ResponseStatusModel();
    }
}
