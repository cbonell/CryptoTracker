using CryptoTracker.DataAccess.Data;
using CryptoTracker.DataAccess.Data.Interfaces;
using Microsoft.Extensions.Caching.Memory;
using Newtonsoft.Json.Linq;
using RestSharp;

namespace CryptoTracker.DataAccess.CryptoFacilitiesDataAccess;
public class CryptoFacilitiesData : ICryptoFacilitiesData
{
    /// <summary>
    /// Returns OHLC pairs in 30 minute intervals
    /// </summary>
    /// <param name="coinSymbol">The symbol of the coin</param>
    /// <param name="days">Number of days to be returned (deffault of 1)</param>
    /// <returns>List<OHLCPairModel></returns>
    public async Task<List<OHLCPairModel>> GetOHLCPairs(string coinSymbol, int days = 1, string interval = "1h")
    {
        if (string.IsNullOrEmpty(coinSymbol) || days < 1)
        {
            throw new ArgumentException();
        }

        if (coinSymbol == "btc")
        {
            coinSymbol = "xbt";
        }

        List<OHLCPairModel> responseData = new();
        RestClient client = new RestClient();
        long to = (long)DateTimeOffset.UtcNow.ToUnixTimeSeconds();
        long from = (long)DateTimeOffset.UtcNow.AddHours(-1 * days * 24).ToUnixTimeSeconds();

        RestRequest request = new RestRequest($"https://www.cryptofacilities.com/api/charts/v1/trade/PI_{coinSymbol}USD/{interval}?from={from}&to={to}");

        RestResponse response = await client.ExecuteAsync(request);
        JObject joResponse = JObject.Parse(response.Content!);
        JArray jObjects = (JArray)joResponse["candles"]!;
        if (jObjects != null)
        {
            foreach (var i in jObjects)
            {
                string? time = i["time"]!.ToString()!;
                string? open = i["open"]!.ToString()!;
                string? high = i["high"]!.ToString()!;
                string? low = i["low"]!.ToString()!;
                string? close = i["close"]!.ToString()!;

                responseData.Add(new OHLCPairModel()
                {
                    TimeStamp = DateTimeFromUnixTimestampMillis(long.Parse(time)),
                    Open = double.Parse(open),
                    High = double.Parse(high),
                    Low = double.Parse(low),
                    Close = double.Parse(close),
                });
            }
        }

        return responseData;
    }

    public static DateTime DateTimeFromUnixTimestampMillis(long millis)
    {
        DateTime UnixEpoch = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);
        return UnixEpoch.AddMilliseconds(millis);
    }
}
