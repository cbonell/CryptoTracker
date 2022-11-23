using Microsoft.Extensions.Caching.Memory;
using MoonTrading.BusinessLogic.Actions;
using MoonTrading.DataAccess.Data.Interfaces;
using RestSharp;

namespace MoonTrading.DataAccess.Data;

public class CryptoWatchData : ICryptoWatchData
{
    internal IMemoryCache _memoryCache;
    public CryptoWatchData(IMemoryCache memory)
    {
        _memoryCache = memory;
    }


    public static DateTimeOffset GetOffsetFromInterval(string interval)
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

    public async Task<CoinPriceVolumePair> GetCoinPriceVolumePair(string coinSymbol, DateTimeOffset fromDate, string interval = "1h", DateTimeOffset? _toDate = null)
    {
        List<OHLCPairModel> ohlcPairs = await GetOHLCPairs(coinSymbol, fromDate, interval, _toDate);
        CoinPriceVolumePair coinPriceVolumePair = new CoinPriceVolumePair();
        foreach (OHLCPairModel pair in ohlcPairs)
        {
            coinPriceVolumePair.VolumePairs.Add(new VolumePairModel()
            {
                TimeStamp = pair.TimeStamp,
                Volume = pair.QuoteVolume
            });

            coinPriceVolumePair.DatePricePairs.Add(new DatePricePairModel()
            {
                TimeStamp = pair.TimeStamp,
                Price = pair.Close
            });
        }

        return coinPriceVolumePair;
    }

    public async Task<List<OHLCPairModel>> GetOHLCPairs(string coinSymbol, DateTimeOffset fromDate, string interval = "1h", DateTimeOffset? _toDate = null)
    {
        string requestUrl = CryptoWatchDataHandler.GetOHLCRequestUrl(coinSymbol, fromDate, interval, _toDate ?? DateTimeOffset.UtcNow);
        RestResponse response;
        string cacheKey = $"cryptoWatchData-OHLC-{interval}";
        if (!_memoryCache.TryGetValue(cacheKey, out response))
        {
            response = await ExecuteRequest(requestUrl);
            var cacheEntryOptions = new MemoryCacheEntryOptions()
            .SetAbsoluteExpiration(TimeSpan.FromSeconds(10));

            _memoryCache.Set(cacheKey, response, cacheEntryOptions);
        }


        return CryptoWatchDataHandler.HandleOHLCResponse(response);
    }

    public async Task<double> GetPrice(string coinSymbol)
    {
        string requestUrl = CryptoWatchDataHandler.GetPriceRequestUrl(coinSymbol);
        RestResponse response;//= await ExecuteRequest(requestUrl);
        string cacheKey = $"cryptoWatchData-Price-{coinSymbol}";
        if (!_memoryCache.TryGetValue(cacheKey, out response))
        {
            response = await ExecuteRequest(requestUrl);
            var cacheEntryOptions = new MemoryCacheEntryOptions()
            .SetAbsoluteExpiration(TimeSpan.FromSeconds(10));

            _memoryCache.Set(cacheKey, response, cacheEntryOptions);
        }

        return CryptoWatchDataHandler.HandlePriceResponse(response);
    }

    private static async Task<RestResponse> ExecuteRequest(string requestUrl)
    {
        RestRequest request = new RestRequest(requestUrl);
        RestClient client = new RestClient();

        return await client.ExecuteAsync(request);
    }
}
