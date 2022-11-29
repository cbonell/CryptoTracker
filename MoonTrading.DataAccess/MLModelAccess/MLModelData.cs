using Newtonsoft.Json.Linq;
using RestSharp;
using MoonTrading.DataAccess.Data;
using BERTTokenizers;
using System.Text.RegularExpressions;

namespace MoonTrading.DataAccess.MLModelAccess;

public class MLModelData : IMLModelData
{
    public Dictionary<string, int> supportedModels = new Dictionary<string, int> {
        { "btc", 2 },
        { "xrp", 3 },
        { "eth", 4 }
    };

    public Dictionary<string, double> normalizationValues = new Dictionary<string, double>
    {
        {"btc-openMax", 68635.05 },
        {"btc-openMin", 3139.76 },
        {"btc-highMax", 69000.0},
        {"btc-highMin", 3158.34 },
        {"btc-lowMax", 68447.0 },
        {"btc-lowMin", 3122.28 },
        {"btc-closeMax", 68627.01 },
        {"btc-closeMin", 3139.76 },
        {"btc-open7dAvgMax", 65442.72851 },
        {"btc-open7dAvgMin", 0 },
        {"btc-high7dAvgMax", 65709.51083 },
        {"btc-high7dAvgMin", 0 },
        {"btc-low7dAvgMax", 65136.678210000005 },
        {"btc-low7dAvgMin", 0 },
        {"btc-close7dAvgMax", 65443.3131 },
        {"btc-close7dAvgMin", 0 },
        {"btc-openIncreaseMax", 0.22811774899999998 },
        {"btc-openIncreaseMin", -0.165483982 },
        {"btc-highIncreaseMax", 0.146297745 },
        {"btc-highIncreaseMin", -0.126865489 },
        {"btc-lowIncreaseMax", 0.30374026 },
        {"btc-lowIncreaseMin", -0.186278188 },
        {"btc-closeIncreaseMax", 0.22811774899999998 },
        {"btc-closeIncreaseMin", -0.165483982 },
        {"btc-open7dIncreaseMax", 0.514064735 },
        {"btc-open7dIncreaseMin", -0.544559566 },
        {"btc-high7dIncreaseMax", 0.5177111870000001 },
        {"btc-high7dIncreaseMin", -0.47251374 },
        {"btc-low7dIncreaseMax", 0.596711688 },
        {"btc-low7dIncreaseMin", -0.573300823 },
        {"btc-close7dIncreaseMax", 0.514064735 },
        {"btc-close7dIncreaseMin", -0.544559566 },
        {"btc-rowStdevMax", 3467.482875 },
        {"btc-rowStdevMin", 0 },
        {"btc-close7dStdevMax", 4170.395703 },
        {"btc-close7dStdevMin", 0 },
    };

    public async Task<List<DatePricePairModel>> GetPricePrediction(string coinSymbol)
    {
        coinSymbol = coinSymbol.ToLower();

        List<DatePricePairModel> predictions = new List<DatePricePairModel>();
        if (supportedModels.ContainsKey(coinSymbol))
        {
            int model = supportedModels[coinSymbol];
            CryptoFacilitiesData cryptoFacilitiesData = new CryptoFacilitiesData();
            List<OHLCPairModel> features = await cryptoFacilitiesData.GetOHLCPairs(coinSymbol, DateTimeOffset.UtcNow.AddDays(-14));
            features = Calculate7dAndIncreasedFeatures(features);
            features = calculateStdDevs(features);
            features = RemoveExtraTuples(features);
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
        var client = new RestClient($"http://prices.eastus.azurecontainer.io:8501/v1/models/crypto/versions/{model}:predict");
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

    public static List<OHLCPairModel> Calculate7dAndIncreasedFeatures(List<OHLCPairModel> features)
    {
        int lastIndex = 0;
        double? open7dAvgSum = 0;
        double? high7dAvgSum = 0;
        double? low7dAvgSum = 0;
        double? close7dAvgSum = 0;
        int halfListCount = features.Count() / 2;

        for (int i = 0; i < features.Count(); i++)
        {
            if (i < halfListCount)
            {
                open7dAvgSum += features[i].Open;
                high7dAvgSum += features[i].High;
                low7dAvgSum += features[i].Low;
                close7dAvgSum += features[i].Close;
            }
            else
            {
                features[i].Open7dAvg = open7dAvgSum / halfListCount;
                features[i].High7dAvg = high7dAvgSum / halfListCount;
                features[i].Low7dAvg = low7dAvgSum / halfListCount;
                features[i].Close7dAvg = close7dAvgSum / halfListCount;

                features[i].Open7dIncrease = (features[i].Open - features[lastIndex].Open) / features[lastIndex].Open;
                features[i].High7dIncrease = (features[i].High - features[lastIndex].High) / features[lastIndex].High;
                features[i].Low7dIncrease = (features[i].Low - features[lastIndex].Low) / features[lastIndex].Low;
                features[i].Close7dIncrease = (features[i].Close - features[lastIndex].Close) / features[lastIndex].Close;

                features[i].OpenIncrease = (features[i].Open - features[i - 1].Open) / features[i - 1].Open;
                features[i].HighIncrease = (features[i].High - features[i - 1].High) / features[i - 1].High;
                features[i].LowIncrease = (features[i].Low - features[i - 1].Low) / features[i - 1].Low;
                features[i].CloseIncrease = (features[i].Close - features[i - 1].Close) / features[i - 1].Close;

                open7dAvgSum -= features[lastIndex].Open;
                high7dAvgSum -= features[lastIndex].High;
                low7dAvgSum -= features[lastIndex].Low;
                close7dAvgSum -= features[lastIndex].Close;

                lastIndex++;
            }
        }
        return features;
    }

    public static List<OHLCPairModel> RemoveExtraTuples(List<OHLCPairModel> features)
    {
        for (int i = 0; i < features.Count() / 2; i++)
        {
            features.RemoveAt(0);
        }

        return features;
    }

    public static List<OHLCPairModel> calculateStdDevs(List<OHLCPairModel> features)
    {
        List<double?> closeValues = new();

        int lastIndex = 0;
        double? avg;
        double? sumOfSquaresOfDifferences;
        double? sd;
        double? sum7d = 0;
        int halfListCount = features.Count() / 2;

        for (int i = 0; i < features.Count(); i++)
        {
            if (i < halfListCount)
            {
                closeValues.Add(features[i].Close);
                sum7d += features[i].Close;
            }
            else
            {
                avg = sum7d / halfListCount;
                sumOfSquaresOfDifferences = closeValues.Select(val => (val - avg) * (val - avg)).Sum();
                sd = Math.Sqrt((double)sumOfSquaresOfDifferences / halfListCount);
                features[i].Close7dStdev = sd;

                List<double?> tupleValues = new();
                tupleValues.Add(features[i].Open);
                tupleValues.Add(features[i].High);
                tupleValues.Add(features[i].Low);
                tupleValues.Add(features[i].Close);
                avg = (features[i].Open + features[i].High + features[i].Low + features[i].Close) / 4;
                sumOfSquaresOfDifferences = tupleValues.Select(val => (val - avg) * (val - avg)).Sum();
                sd = Math.Sqrt((double)sumOfSquaresOfDifferences / halfListCount);
                features[i].RowStdev = sd;

                closeValues.Add(features[i].Close);
                closeValues.Remove(0);
                sum7d -= features[lastIndex].Close;
                lastIndex++;
            }
        }
        return features;
    }

    public List<OHLCPairModel> MinMaxNormalize(List<OHLCPairModel> features, string coinSymbol, Dictionary<string, double> values)
    {
        double openMax = values[coinSymbol + "-openMax"];
        double openMin = values[coinSymbol + "-openMin"];
        double highMax = values[coinSymbol + "-highMax"];
        double highMin = values[coinSymbol + "-highMin"];
        double lowMax = values[coinSymbol + "-lowMax"];
        double lowMin = values[coinSymbol + "-lowMin"];
        double closeMax = values[coinSymbol + "-closeMax"];
        double closeMin = values[coinSymbol + "-closeMin"];
        double open7dAvgMax = values[coinSymbol + "-open7dAvgMax"];
        double open7dAvgMin = values[coinSymbol + "-open7dAvgMin"];
        double high7dAvgMax = values[coinSymbol + "-high7dAvgMax"];
        double high7dAvgMin = values[coinSymbol + "-high7dAvgMin"];
        double low7dAvgMax = values[coinSymbol + "-low7dAvgMax"];
        double low7dAvgMin = values[coinSymbol + "-low7dAvgMin"];
        double close7dAvgMax = values[coinSymbol + "-close7dAvgMax"];
        double close7dAvgMin = values[coinSymbol + "-close7dAvgMin"];
        double openIncreaseMax = values[coinSymbol + "-openIncreaseMax"];
        double openIncreaseMin = values[coinSymbol + "-openIncreaseMin"];
        double highIncreaseMax = values[coinSymbol + "-highIncreaseMax"];
        double highIncreaseMin = values[coinSymbol + "-highIncreaseMin"];
        double lowIncreaseMax = values[coinSymbol + "-lowIncreaseMax"];
        double lowIncreaseMin = values[coinSymbol + "-lowIncreaseMin"];
        double closeIncreaseMax = values[coinSymbol + "-closeIncreaseMax"];
        double closeIncreaseMin = values[coinSymbol + "-closeIncreaseMin"];
        double open7dIncreaseMax = values[coinSymbol + "-open7dIncreaseMax"];
        double open7dIncreaseMin = values[coinSymbol + "-open7dIncreaseMin"];
        double high7dIncreaseMax = values[coinSymbol + "-high7dIncreaseMax"];
        double high7dIncreaseMin = values[coinSymbol + "-high7dIncreaseMin"];
        double low7dIncreaseMax = values[coinSymbol + "-low7dIncreaseMax"];
        double low7dIncreaseMin = values[coinSymbol + "-low7dIncreaseMin"];
        double close7dIncreaseMax = values[coinSymbol + "-close7dIncreaseMax"];
        double close7dIncreaseMin = values[coinSymbol + "-close7dIncreaseMin"];
        double rowStdevMax = values[coinSymbol + "-rowStdevMax"];
        double rowStdevMin = values[coinSymbol + "-rowStdevMin"];
        double close7dStdevMax = values[coinSymbol + "-close7dStdevMax"];
        double close7dStdevMin = values[coinSymbol + "-close7dStdevMin"];

        for (int i = 0; i < features.Count; i++)
        {
            features[i].Open = (features[i].Open - openMin) / (openMax - openMin);
            features[i].High = (features[i].High - highMin) / (highMax - highMin);
            features[i].Low = (features[i].Low - lowMin) / (lowMax - lowMin);
            features[i].Close = (features[i].Close - closeMin) / (closeMax - closeMin);
            features[i].Open7dAvg = (features[i].Open7dAvg - open7dAvgMin) / (open7dAvgMax - open7dAvgMin);
            features[i].High7dAvg = (features[i].High7dAvg - high7dAvgMin) / (high7dAvgMax - high7dAvgMin);
            features[i].Low7dAvg = (features[i].Low7dAvg - low7dAvgMin) / (low7dAvgMax - low7dAvgMin);
            features[i].Close7dAvg = (features[i].Close7dAvg - close7dAvgMin) / (close7dAvgMax - close7dAvgMin);
            features[i].OpenIncrease = (features[i].OpenIncrease - openIncreaseMin) / (openIncreaseMax - openIncreaseMin);
            features[i].HighIncrease = (features[i].HighIncrease - highIncreaseMin) / (highIncreaseMax - highIncreaseMin);
            features[i].LowIncrease = (features[i].LowIncrease - lowIncreaseMin) / (lowIncreaseMax - lowIncreaseMin);
            features[i].CloseIncrease = (features[i].CloseIncrease - closeIncreaseMin) / (closeIncreaseMax - closeIncreaseMin);
            features[i].Open7dIncrease = (features[i].Open7dIncrease - open7dIncreaseMin) / (open7dIncreaseMax - open7dIncreaseMin);
            features[i].High7dIncrease = (features[i].High7dIncrease - high7dIncreaseMin) / (high7dIncreaseMax - high7dIncreaseMin);
            features[i].Low7dIncrease = (features[i].Low7dIncrease - low7dIncreaseMin) / (low7dIncreaseMax - low7dIncreaseMin);
            features[i].Close7dIncrease = (features[i].Close7dIncrease - close7dIncreaseMin) / (close7dIncreaseMax - close7dIncreaseMin);
            features[i].RowStdev = (features[i].RowStdev - rowStdevMin) / (rowStdevMax - rowStdevMin);
            features[i].Close7dStdev = (features[i].Close7dStdev - close7dStdevMin) / (close7dStdevMax - close7dStdevMin);
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

            tuple.Add(features[i].Open ?? 0);
            tuple.Add(features[i].High ?? 0);
            tuple.Add(features[i].Low ?? 0);
            tuple.Add(features[i].Close ?? 0);

            tuple.Add(features[i].Open7dAvg ?? 0);
            tuple.Add(features[i].High7dAvg ?? 0);
            tuple.Add(features[i].Low7dAvg ?? 0);
            tuple.Add(features[i].Close7dAvg ?? 0);

            tuple.Add(features[i].OpenIncrease ?? 0);
            tuple.Add(features[i].HighIncrease ?? 0);
            tuple.Add(features[i].LowIncrease ?? 0);
            tuple.Add(features[i].CloseIncrease ?? 0);

            tuple.Add(features[i].Open7dIncrease ?? 0);
            tuple.Add(features[i].High7dIncrease ?? 0);
            tuple.Add(features[i].Low7dIncrease ?? 0);
            tuple.Add(features[i].Close7dIncrease ?? 0);

            tuple.Add(features[i].RowStdev ?? 0);
            tuple.Add(features[i].Close7dStdev ?? 0);

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

                    if (!string.IsNullOrWhiteSpace(price))
                    {
                        predictions.Add(new DatePricePairModel()
                        {
                            TimeStamp = DateTime.UtcNow.AddHours(counter),
                            Price = Math.Round(double.Parse(price), 2)
                        });
                    }
                }
            }
        }
        return predictions;
    }

    public async Task<int> GetSentiment(string text)
    {
        text = FixTextForSentiment(text);
        var tokenizer = new BertBaseTokenizer();
        var encoded = tokenizer.Encode(512, text);
        var inputIds = encoded.Select(t => t.InputIds).ToList();
        var tokenTypeIds = encoded.Select(t => t.TokenTypeIds).ToList();
        var attentionMask = encoded.Select(t => t.AttentionMask).ToList();
        var payload = new
        {
            input_ids = inputIds,
            token_type_ids = tokenTypeIds,
            attention_mask = attentionMask,
        };
        var body = new[] { payload }.ToList();

        var client = new RestClient("http://mlmodels.eastus.azurecontainer.io:8501/v1/models/crypto/versions/5:predict");
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
        JArray jArray = (JArray)data["predictions"]!;
        if (jArray != null && jArray.Count > 0)
        {
            jArray = (JArray)jArray[0];
            var logits = jArray.ToObject<double[]>();
            var probabilities = ConvertLogitsToProbabilities(logits!);

            return GetPredictedClass(probabilities);
        }
        return 0;
    }

    private string FixTextForSentiment(string text)
    {
        if(string.IsNullOrEmpty(text))
        {
            return "";
        }

        text = text.Trim();
        string normalizedWords = Regex.Replace(text, "\\n", " ");
        normalizedWords = Regex.Replace(normalizedWords, "\\r\\n", " ");
        normalizedWords = normalizedWords.Replace("  ", String.Empty);
        normalizedWords = Regex.Replace(normalizedWords, @"[^\u0000-\u007F]+", string.Empty);
        var allWords = normalizedWords.Split(' ');
        allWords = allWords.Where(x => !x.Contains("http")).ToArray();

        return string.Join(" ", allWords);
    }

    public double[] ConvertLogitsToProbabilities(double[] logits)
    {
        double eSum = 0;
        for (int i = 0; i < logits.Length; i++)
        {
            eSum += Math.Exp(logits[i]);
        }

        for (int i = 0; i < logits.Length; i++)
        {
            logits[i] = Math.Exp(logits[i]) / eSum;
        }
        return logits;
    }

    public int GetPredictedClass(double[] probabilities)
    {
        int prediction = 0;
        double max = 0;
        for (int i = 0; i < probabilities.Length; i++)
        {
            if (max < probabilities[i])
            {
                max = probabilities[i];
                prediction = i;
            }
        }
        return prediction;
    }
}