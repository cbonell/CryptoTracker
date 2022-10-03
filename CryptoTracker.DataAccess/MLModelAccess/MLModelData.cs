using System.Net;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;

namespace CryptoTracker.DataAccess.MLModelAccess;

public class MLModelData : IMLModelData
{
    
	public async Task<double> GetPricePrediction()
    {
        // TODO: update path to v1/models/model/bitcoin:predict
        var client = new RestClient("http://bitcoin-hourly-api.eastus.azurecontainer.io:8501/v1/models/model:predict");
        var request = new RestRequest()
        {
            Method = Method.Post
        };

        List<List<List<double>>> body = new();
        List<List<double>> temp = new();
        List<double> temp2 = new();
        temp2.Add(0.0);
        for (int i = 0; i < 31; i++)
        {
            temp.Add(temp2);
        }
        body.Add(temp);

        request.AddHeader("content-type", "application/json");
        request.AddJsonBody(
            new
            {
                instances = body
            });
        RestResponse response = await client.ExecuteAsync(request);
        JObject data = JObject.Parse(response.Content!);
        if (data != null)
        {
            JToken token = data.First;
            double prediction = JsonConvert.DeserializeObject<double>(token.First.First.First.ToString());
            return prediction;
        }
        return 0;
    }


}