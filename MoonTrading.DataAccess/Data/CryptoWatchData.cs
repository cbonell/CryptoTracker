using MoonTrading.BusinessLogic.Actions;
using RestSharp;

namespace MoonTrading.DataAccess.Data
{
    public class CryptoWatchData
    {

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

        public static async Task<CoinPriceVolumePair> GetCoinPriceVolumePair(string coinSymbol, DateTimeOffset fromDate, string interval = "1h", DateTimeOffset? _toDate = null)
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

        public static async Task<List<OHLCPairModel>> GetOHLCPairs(string coinSymbol, DateTimeOffset fromDate, string interval = "1h", DateTimeOffset? _toDate = null)
        {
            string requestUrl = CryptoWatchDataHandler.GetOHLCRequestUrl(coinSymbol, fromDate, interval, _toDate ?? DateTimeOffset.UtcNow);
            RestResponse response = await ExecuteRequest(requestUrl);

            return CryptoWatchDataHandler.HandleOHLCResponse(response);
        }

        public static async Task<double> GetPrice(string coinSymbol)
        {
            string requestUrl = CryptoWatchDataHandler.GetPriceRequestUrl(coinSymbol);
            RestResponse response = await ExecuteRequest(requestUrl);

            return CryptoWatchDataHandler.HandlePriceResponse(response);
        }

        private static async Task<RestResponse> ExecuteRequest(string requestUrl)
        {
            RestRequest request = new RestRequest(requestUrl);
            RestClient client = new RestClient();

            return await client.ExecuteAsync(request);
        }
    }
}
