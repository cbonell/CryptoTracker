using Newtonsoft.Json.Linq;
using RestSharp;
using CryptoTracker.DataAccess.Data;

namespace CryptoTracker.DataAccess.MLModelAccess;

public class MLModelData : IMLModelData
{
    public Dictionary<string, int> supportedModels = new Dictionary<string, int> {
        { "btc", 2 },
        { "xbt", 2 } };

    public Dictionary<string, double> normalizationValues = new Dictionary<string, double>
    {
        {"btc-highMax",  69000.0 },
        {"xbt-highMax", 69000.0 },
        {"btc-lowMax",  68447.0 },
        {"xbt-lowMax", 68447.0 },
        {"btc-closeMax", 68627.01 },
        {"xbt-closeMax", 68627.01 },
        {"btc-highMin",  3158.34 },
        {"xbt-highMin", 3158.34 },
        {"btc-lowMin",  3122.28 },
        {"xbt-lowMin", 3122.28 },
        {"btc-closeMin", 3139.76 },
        {"xbt-closeMin", 3139.76 },
    };

    public async Task<List<DatePricePairModel>> GetPricePrediction(string coinSymbol)
    {
        coinSymbol = coinSymbol.ToLower();
        List<DatePricePairModel> predictions = new List<DatePricePairModel>();
        if (supportedModels.ContainsKey(coinSymbol))
        {
            int model = supportedModels[coinSymbol];
            CryptoFacilitiesData cryptoFacilitiesData = new CryptoFacilitiesData();
            List<OHLCPairModel> features = await cryptoFacilitiesData.GetOHLCPairs(coinSymbol, DateTimeOffset.UtcNow.AddDays(-7));
            features = MinMaxNormalize(features, coinSymbol, normalizationValues);
            List<List<List<double>>> body = Tensorize(features);

            JObject data = await MakeRequest(body, model);

            if (data != null)
            {
                predictions = convertToDPPM(data, predictions);
                return predictions;
            }
        }
        return predictions;
    }

    public async Task<JObject> MakeRequest(List<List<List<double>>> body, int model)
    {
        var client = new RestClient($"http://models.eastus.azurecontainer.io:8501/v1/models/crypto/versions/{model}:predict");
        var request = new RestRequest()
        {
            Method = Method.Post
        };

        request.AddHeader("content-type", "application/json");
        request.AddJsonBody(
            new
            {
                instances = body
            });
        RestResponse response = await client.ExecuteAsync(request);
        JObject data = JObject.Parse(response.Content!);
        return data;
    }

    public List<OHLCPairModel> MinMaxNormalize(List<OHLCPairModel> features, string coinSymbol, Dictionary<string, double> values)
    {
        double highMax = values[coinSymbol + "-highMax"];
        double lowMax = values[coinSymbol + "-lowMax"];
        double closeMax = values[coinSymbol + "-closeMax"];
        double highMin = values[coinSymbol + "-highMin"];
        double lowMin = values[coinSymbol + "-lowMin"];
        double closeMin = values[coinSymbol + "-closeMin"];

        for (int i = 0; i < features.Count; i++)
        {
            features[i].High = (features[i].High - highMin) / (highMax - highMin);
            features[i].Low = (features[i].Low - lowMin) / (lowMax - lowMin);
            features[i].Close = (features[i].Close - closeMin) / (closeMax - closeMin);
        }

        return features;
    }

    public List<List<List<double>>> Tensorize(List<OHLCPairModel> features)
    {
        List<List<List<double>>> body = new();
        List<List<double>> tensor = new();
        for (int i = 0; i < features.Count; i++)
        {
            List<double> tuple = new();

            tuple.Add(features[i].High ?? 0);
            tuple.Add(features[i].Low ?? 0);
            tuple.Add(features[i].Close ?? 0);
            tensor.Add(tuple);
        }
        body.Add(tensor);
        return body;
    }

    public List<DatePricePairModel> convertToDPPM(JObject data, List<DatePricePairModel> predictions)
    {
        JArray jArray = (JArray)data["predictions"]!;
        if (jArray != null && jArray.Count > 0)
        {
            int counter = 0;
            jArray = (JArray)jArray[0];
            for (int i = 0; i < jArray.Count; i++)
            {
                if (jArray[i] != null)
                {
                    string? price = jArray[i]?.ToString();
                    counter++;

                    predictions.Add(new DatePricePairModel()
                    {
                        TimeStamp = DateTime.UtcNow.AddHours(counter),
                        Price = Math.Round(double.Parse(price), 2)
                    });
                }
            }
        }
        return predictions;
    }
}