using Microsoft.Extensions.Caching.Memory;
using MoonTrading.Model;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;
using static SharedConstants.Constants;

namespace MoonTrading.BusinessLogic.Actions;

public static class CoinGeckoDataHandler
{
    public static double HandleGetPriceInUsdResponse(RestResponse response)
    {
        double price = 0;
        JObject data = JObject.Parse(response.Content!);

        if (data != null && data.First != null)
        {
            JToken token = data.First;
            if (token != null && token.First != null && token.First.First != null && token.First.First.First != null)
            {
                price = JsonConvert.DeserializeObject<double>(token.First.First.First.ToString());
            }
        }

        return price;
    }
    
    public static double HandleGetCoinPriceInUSDFromSymbol(List<TickerModel> tickers, string symbol)
    {
        double price = 0;
        var tickerTemp = tickers.Where(x => x.Symbol == symbol);
        TickerModel? tickerModel = tickerTemp == null ? new() : tickerTemp.FirstOrDefault();
        if (tickerModel != null)
        {
            price = tickerModel.MarkPrice;
        }

        return price;
    }

    public static string GetCacheKeyForPrice(string currency) => $"{CacheKey.GetPriceInUsd}-{currency}";
}
