using MoonTrading.DataAccess.Data.Interfaces;
using MoonTrading.Tools;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;
using static MoonTrading.BusinessLogic.Validation.CryptoFacilitiesDataValidation;

namespace MoonTrading.DataAccess.Data;
public class CryptoFacilitiesData : ICryptoFacilitiesData
{
    public CryptoFacilitiesData() { }

    /// <summary>
    /// Returns OHLC pairs in 30 minute intervals
    /// </summary>
    /// <param name="coinSymbol">The symbol of the coin</param>
    /// <param name="days">Number of days to be returned (deffault of 1)</param>
    /// <returns>List<OHLCPairModel></returns>
    /// <exception cref="ArgumentException"></exception>
    public async Task<List<OHLCPairModel>> GetOHLCPairs(string coinSymbol, DateTimeOffset fromDate, string interval = "1h", DateTimeOffset? _toDate = null)
    {
        if (!IsValidCoinSymbol(coinSymbol))
        {
            throw new ArgumentException(coinSymbol);
        }

        if (!IsValidChartTimeOption(interval))
        {
            throw new ArgumentException(interval);
        }

        DateTimeOffset toDate = _toDate ?? DateTimeOffset.UtcNow;
        if (!IsValidTimeInterval(fromDate, toDate))
        {
            throw new Exception("From date must come before to date");
        }


        long to = toDate.ToUnixTimeSeconds();
        long from = fromDate.ToUnixTimeSeconds();

        RestRequest request = new RestRequest($"https://www.cryptofacilities.com/api/charts/v1/trade/{GetCryptoFacilitiesSymbol(coinSymbol)}/{interval}?from={from}&to={to}");
        RestClient client = new RestClient();
        RestResponse response = await client.ExecuteAsync(request);

        JObject responseJsonObject = JObject.Parse(response.Content!);
        var tempCandlObj = responseJsonObject["candles"];
        if (tempCandlObj != null && tempCandlObj.Count() == 0)
        {
            request = new RestRequest($"https://www.cryptofacilities.com/api/charts/v1/trade/{GetCryptoFacilitiesSymbol2(coinSymbol)}/{interval}?from={from}&to={to}");
            response = await client.ExecuteAsync(request);
            responseJsonObject = JObject.Parse(response.Content!);
        }
        return JsonConvert.DeserializeObject<List<OHLCPairModel>>(tempCandlObj.NullableToString()) ?? new List<OHLCPairModel>();
    }

    /// <summary>
    /// Returns collection of Ticker models
    /// </summary>
    /// <returns>List<TickerModel></returns>
    public async Task<List<TickerModel>> GetTickers()
    {
        RestClient client = new RestClient();
        RestRequest request = new RestRequest("https://www.cryptofacilities.com/derivatives/api/v3/tickers");
        RestResponse response = await client.ExecuteAsync(request);

        JToken responseData = JToken.Parse(response.Content.NullableToString());

        return JsonConvert.DeserializeObject<List<TickerModel>>(responseData["tickers"].NullableToString()) ?? new List<TickerModel>();
    }

    public async Task<CoinPriceVolumePair> GetCoinPriceVolumePair(string coinSymbol, DateTimeOffset fromDate, string interval = "1h", DateTimeOffset? _toDate = null)
    {
        List<OHLCPairModel> ohlcPairs = await GetOHLCPairs(coinSymbol, fromDate, interval, _toDate);
        CoinPriceVolumePair coinPriceVolumePair = new CoinPriceVolumePair();
        foreach (OHLCPairModel pair in ohlcPairs)
        {
            coinPriceVolumePair.VolumePairs.Add(new VolumePairModel()
            {
                TimeStamp = pair.TimeStamp,
                Volume = pair.Volume
            });

            coinPriceVolumePair.DatePricePairs.Add(new DatePricePairModel()
            {
                TimeStamp = pair.TimeStamp,
                Price = pair.Close
            });
        }

        return coinPriceVolumePair;
    }

    /// <summary>
    /// Returns the crypto facilities symbol based on market standard symbol
    /// </summary>
    /// <param name="symbol"></param>
    /// <returns>string</returns>
    public string GetCryptoFacilitiesSymbol(string symbol)
    {
        string conversionCurrency = "USD";

        if (string.IsNullOrEmpty(symbol))
        {
            return "";
        }

        symbol = symbol.ToLower();
        if (symbol == "btc")
        {
            symbol = "xbt";
        }

        return ("PI_" + symbol + conversionCurrency).ToLower();
    }

    /// <summary>
    /// Returns the crypto facilities symbol based on market standard symbol
    /// </summary>
    /// <param name="symbol"></param>
    /// <returns>string</returns>
    public string GetCryptoFacilitiesSymbol2(string symbol)
    {
        string conversionCurrency = "USD";

        if (string.IsNullOrEmpty(symbol))
        {
            return "";
        }

        symbol = symbol.ToLower();
        if (symbol == "btc")
        {
            symbol = "xbt";
        }

        return ("PF_" + symbol + conversionCurrency).ToLower();
    }

    public DateTimeOffset GetOffsetFromInterval(string interval)
    {
        DateTimeOffset fromDate;
        if (interval == "1w")
        {
            fromDate = DateTimeOffset.UtcNow.AddDays(-7 * 168);
        }
        else if (interval == "1d")
        {
            fromDate = DateTimeOffset.UtcNow.AddDays(-168);
        }
        else if (interval == "4h")
        {
            fromDate = DateTimeOffset.UtcNow.AddHours(-168 * 4);
        }
        else if (interval == "1h")
        {
            fromDate = DateTimeOffset.UtcNow.AddHours(-168);
        }
        else if (interval == "30m")
        {
            fromDate = DateTimeOffset.UtcNow.AddHours(-168 / 2);
        }
        else if (interval == "15m")
        {
            fromDate = DateTimeOffset.UtcNow.AddHours(-168 / 4);
        }
        else if (interval == "5m")
        {
            fromDate = DateTimeOffset.UtcNow.AddMinutes(-168 * 5);
        }
        else if (interval == "1m")
        {
            fromDate = DateTimeOffset.UtcNow.AddMinutes(-168);
        }
        else
        {
            fromDate = DateTimeOffset.UtcNow.AddHours(-1);
        }

        return fromDate;
    }
}
