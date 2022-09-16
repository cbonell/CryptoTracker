using CryptoTracker.DataAccess.Data;
using RestSharp;

namespace CryptoTracker.DataAccess.Caching;

public class CachingService : RestClient
{
    private ISqlDataAccess _db;
    protected string BaseUrl;
    RestRequest Request;
    int ResonseThreshold;

    public CachingService(ISqlDataAccess db)
    {
        BaseUrl = "";
        _db = db;
    }

    public void CreateRequest(string baseUrl, Method method = Method.Get, int resonseThreshold = 20)
    {
        ResonseThreshold = resonseThreshold;

        BaseUrl = baseUrl;
        Request = new RestRequest(BaseUrl)
        {
            Method = method
        };
    }

    public RestRequest AddHeader(string name, string value) => Request.AddHeader(name, value);

    public async Task<RestResponse> ExecuteAsync(CancellationToken cancellationToken = default)
    {
        var dataList = await _db.LoadData<string, dynamic>("[dbo].[GetCachedResponse]", new { RequestPath = BaseUrl,Method = Request.Method.ToString(), ResonseThreshold = ResonseThreshold });
        string data = dataList.First();

        if (string.IsNullOrWhiteSpace(data) || data == "DATA_EXPIRED")
        {
            // We dont have a cached response for this request yet so create one
            RestResponse r = await base.ExecuteAsync(Request, cancellationToken);
            string? responseData = r.Content;

            await _db.SaveData<dynamic>("[dbo].[SaveCachedResponse]", new { Data = responseData ?? "NULL", BaseUrl = BaseUrl, Method = Request.Method.ToString()});
            return r;
        }

        return new()
        {
            Content = data,
            IsSuccessful = true,
            StatusCode = System.Net.HttpStatusCode.OK
        };


    }
}
