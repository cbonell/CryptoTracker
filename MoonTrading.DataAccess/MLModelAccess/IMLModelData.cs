using Newtonsoft.Json.Linq;

namespace MoonTrading.Tests.MLModelAccess
{
    public interface IMLModelData
    {
        Task<List<DatePricePairModel>> GetPricePrediction(string coinSymbol);
        List<OHLCPairModel> MinMaxNormalize(List<OHLCPairModel> features, string coinSymbol, Dictionary<string, double> values);
        List<List<List<double>>> Tensorize(List<OHLCPairModel> features);
        List<DatePricePairModel> convertToDPPM(JObject data, List<DatePricePairModel> predictions);
        Task<JObject> MakeRequest(List<List<List<double>>> body, int model);
        Task<int> GetSentiment(TweetSearchModel tweet);
    }
}