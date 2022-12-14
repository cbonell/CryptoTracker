using Newtonsoft.Json.Linq;

namespace MoonTrading.DataAccess.MLModelAccess;

public interface IMLModelData
{
    Task<List<DatePricePairModel>> GetPricePrediction(string coinSymbol);
    List<OHLCPairModel> MinMaxNormalize(List<OHLCPairModel> features, string coinSymbol, Dictionary<string, double> values);
    List<List<List<double>>> Tensorize(List<OHLCPairModel> features);
    List<DatePricePairModel> ConvertToDPPM(JObject data);
    Task<JObject> MakeRequest(List<List<List<double>>> body, int model);
    Task<int> GetSentiment(string text);
}