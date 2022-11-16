using MoonTrading.Model;
using MoonTrading.Tools;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;
using static MoonTrading.Extensions.Extensions;

namespace MoonTrading.BusinessLogic.Actions;

public class CryptoWatchDataHandler
{
    private static readonly Dictionary<string, int> PeriodValues = new Dictionary<string, int>()
    {
        { "1m", 60},
        { "3m", 180},
        { "5m", 300},
        { "15m", 900},
        { "30m", 1800},
        { "1h", 3600},
        { "2h", 7200},
        { "4h", 14400},
        { "6h", 21600},
        { "12h", 43200},
        { "1d", 86400},
        { "3d", 259200},
        { "1w", 604800}
    };

    private static readonly string exchange = "kraken";
    private static readonly string quoteSymbol = "usd";
    private static readonly string pubKey = "VVRUAK51BTLW0XI51GFG";
    private static readonly string scrtKey = "qWxp86ijPmbznWOtYX+qHcwhuPDnvDqhmb8Cp7cG";

    public static string GetOHLCRequestUrl(string coinSymbol, DateTimeOffset fromDate, string interval, DateTimeOffset toDate)
    {

        int period = 0;
        if (!PeriodValues.TryGetValue(interval, out period))
        {
            throw new ArgumentException("The provided interval was invaid");
        }

        string baseSymbol = coinSymbol;

        // convert to a unix time stamp in seconds
        long unixAfter = fromDate.ToUnixTimeSeconds();
        long unixBefore = toDate.ToUnixTimeSeconds();

        if (fromDate > toDate)
        {
            throw new ArgumentException("From date must me less than the to date");
        }

        return $"https://api.cryptowat.ch/markets/{exchange}/{baseSymbol}{quoteSymbol}/ohlc?after={unixAfter}&before={unixBefore}&periods={period}&apikey={pubKey}";
    }

    public static List<OHLCPairModel> HandleOHLCResponse(RestResponse response)
    {
        List<OHLCPairModel> pairs = new List<OHLCPairModel>();

        if (response == null)
        {
            throw new ArgumentNullException("OHLC RestResponse");
        }

        if (!response.IsSuccessful)
        {
            throw new Exception("OHLC request was not successful and returned with " + response.StatusCode);
        }

        if (response.Content == null)
        {
            // something
            throw new ArgumentNullException(response.Content);
        }

        JObject responseJsonObject = JObject.Parse(response.Content);
        if (responseJsonObject == null || responseJsonObject.First == null || responseJsonObject.First.First == null
            || responseJsonObject.First.First.First == null || responseJsonObject.First.First.First.First == null)
        {
            throw new Exception("Failed to parse OHLC reponse json");
        }

        JArray jArray = JArray.Parse(responseJsonObject.First.First.First.First.ToString());
        foreach (var pair in jArray)
        {
            long time = pair[0] == null ? 0 : long.Parse(pair[0].ToString());
            double open = pair[1] == null ? 0 : double.Parse(pair[1].ToString());
            double high = pair[2] == null ? 0 : double.Parse(pair[2].ToString());
            double low = pair[3] == null ? 0 : double.Parse(pair[3].ToString());
            double close = pair[4] == null ? 0 : double.Parse(pair[4].ToString());
            double volume = pair[5] == null ? 0 : double.Parse(pair[5].ToString());
            double quoteVolume = pair[6] == null ? 0 : double.Parse(pair[6].ToString());

            pairs.Add(new OHLCPairModel()
            {
                TimeStamp = time.DateTimeFromUnixTimeStampSeconds(),
                Open = open,
                High = high,
                Low = low,
                Close = close,
                Volume = (int)volume,
                QuoteVolume = quoteVolume
            });
        }

        return pairs;
    }

    public static string GetPriceRequestUrl(string coinSymbol) => $"https://api.cryptowat.ch/markets/{exchange}/{coinSymbol}{quoteSymbol}/price?apikey={pubKey}";

    public static double HandlePriceResponse(RestResponse response)
    {
        List<OHLCPairModel> pairs = new List<OHLCPairModel>();

        if (response == null)
        {
            throw new ArgumentNullException("Price RestResponse");
        }

        if (!response.IsSuccessful)
        {
            throw new Exception("Price request was not successful and returned with " + response.StatusCode);
        }

        if (response.Content == null)
        {
            // something
            throw new ArgumentNullException(response.Content);
        }

        JObject responseJsonObject = JObject.Parse(response.Content);
        if (responseJsonObject == null || responseJsonObject.First == null || responseJsonObject.First.First == null)
        {
            throw new Exception("Failed to parse price reponse json");
        }

        PriceHelperModel price = JsonConvert.DeserializeObject<PriceHelperModel>(responseJsonObject.First.First.ToString());
        return price.Price;
    }
}

public class PriceHelperModel
{
    [JsonProperty("price")]
    public double Price { get; set; }
}
