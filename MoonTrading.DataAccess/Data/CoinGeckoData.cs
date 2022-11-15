using MoonTrading.Tests.Caching;
using MoonTrading.Tests.Data;
using MoonTrading.Tests.Data.Interfaces;
using Microsoft.Extensions.Caching.Memory;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;
using static SharedConstants.Constants;

namespace MoonTrading.Tests.CoinGeckoAccess;

public class CoinGeckoData : DataBase, ICoinGeckoData
{
    internal IMemoryCache _memoryCache;
    internal ICryptoFacilitiesData _cryptoFacilitiesData;
    public CoinGeckoData(ISqlDataAccess db, IMemoryCache memory, ICryptoFacilitiesData cryptoFacilitiesData) : base(db)
    {
        _memoryCache = memory;
        _cryptoFacilitiesData = cryptoFacilitiesData;
    }

    public async Task<double> GetPriceInUsd(string currency, double amount = 1)
    {
        if (string.IsNullOrWhiteSpace(currency))
        {
            throw new ArgumentNullException(nameof(currency));
        }

        if (amount <= 0)
        {
            amount = 0;
        }

        double price;
        string cacheKey = $"{CacheKey.GetPriceInUsd}-{currency}";
        if (!_memoryCache.TryGetValue(cacheKey, out price))
        {
            var cacheEntryOptions = new MemoryCacheEntryOptions()
                .SetAbsoluteExpiration(TimeSpan.FromSeconds(10));

            RestClient client = new RestClient();
            RestRequest request = new RestRequest($"https://api.coingecko.com/api/v3/simple/price?ids={currency}&vs_currencies=usd");
            RestResponse response = await client.ExecuteAsync(request);
            JObject data = JObject.Parse(response.Content!);

            if (data != null)
            {
                JToken token = data.First;
                price = JsonConvert.DeserializeObject<double>(token.First.First.First.ToString())!;
            }

            _memoryCache.Set(cacheKey, price);
        }

        return price * amount;
    }

    public async Task<double> GetCoinPriceInUSDFromSymbol(string coinGeckoId)
    {
        string cryptoFacilitiesSymbol = _cryptoFacilitiesData.GetCryptoFacilitiesSymbol(coinGeckoId);
        List<TickerModel> tickers = new List<TickerModel>();
        string cacheKey = $"cryptofacilities-{tickers}";
        if (!_memoryCache.TryGetValue(cacheKey, out tickers))
        {
            var cacheEntryOptions = new MemoryCacheEntryOptions()
                .SetAbsoluteExpiration(TimeSpan.FromSeconds(3));
            tickers = await _cryptoFacilitiesData.GetTickers();
            _memoryCache.Set(cacheKey, tickers, cacheEntryOptions);
        }

        TickerModel tickerModel = tickers.Where(x => x.Symbol == cryptoFacilitiesSymbol).FirstOrDefault();
        if(tickerModel == null)
        {

            return 0;
        }

        return tickerModel.MarkPrice;
    }

        public async Task<List<DatePricePairModel>> GetPriceHistory(string coinName, string searchTerm)
    {
        if (string.IsNullOrWhiteSpace(coinName))
        {
            throw new ArgumentNullException("currency");
        }

        List<DatePricePairModel> responseData;
        if (!_memoryCache.TryGetValue(CacheKey.CoinGeckoGetTrending, out responseData))
        {
            responseData = new();
            var cacheEntryOptions = new MemoryCacheEntryOptions()
                .SetAbsoluteExpiration(TimeSpan.FromHours(1));

            int days = 1;
            int? hours = null;
            string interval = "hourly";
            if (searchTerm.Contains("d"))
            {
                days = int.Parse(searchTerm.Replace("d", "")); ;
            }
            else if (searchTerm.Contains("hr"))
            {
                hours = int.Parse(searchTerm.Replace("hr", ""));
                days = 1;
            }

            RestClient client = new RestClient();
            RestRequest request = new RestRequest($"https://api.coingecko.com/api/v3/coins/{coinName}/market_chart?vs_currency=usd&days={days}&interval={interval}");
            RestResponse response = await client.ExecuteAsync(request);
            JObject data = JObject.Parse(response.Content!);
            if (data != null)
            {
                JToken token = JObject.Parse(response.Content!)["prices"];
                JArray jArray = JArray.Parse(token.ToString());
                if (jArray != null && jArray.Count > 0)
                {
                    for (int i = 0; i < jArray.Count; i++)
                    {
                        if (jArray[i] != null)
                        {
                            string? time = jArray[i][0]?.ToString();
                            string? price = jArray[i][1]?.ToString();

                            if (hours.HasValue)
                            {
                                DateTime timeVal = long.Parse(time).DateTimeFromUnixTimeStampMillis();
                                if ((DateTime.Now - timeVal).TotalHours <= hours + 1)
                                {
                                    responseData.Add(new DatePricePairModel()
                                    {
                                        TimeStamp = timeVal,
                                        Price = double.Parse(price)
                                    });
                                }
                            }
                            else
                            {
                                responseData.Add(new DatePricePairModel()
                                {
                                    TimeStamp = long.Parse(time).DateTimeFromUnixTimeStampMillis(),
                                    Price = double.Parse(price)
                                });
                            }


                        }
                    }
                }
            }

            _memoryCache.Set(CacheKey.CoinGeckoGetTrending, responseData, cacheEntryOptions);
        }

        return responseData;
    }

    public async Task<List<CoinGeckoTrendingModel>> GetTrending()
    {
        List<CoinGeckoTrendingModel> coins = new();
        if (!_memoryCache.TryGetValue(CacheKey.CoinGeckoGetTrending, out coins))
        {
            coins = new();
            var cacheEntryOptions = new MemoryCacheEntryOptions()
                .SetAbsoluteExpiration(TimeSpan.FromHours(12));

            RestClient client = new RestClient();
            RestRequest request = new RestRequest($"https://api.coingecko.com/api/v3/search/trending");
            RestResponse response = await client.ExecuteAsync(request);
            JObject data = JObject.Parse(response.Content.ToString()!);
            JArray jArray = JArray.Parse(data["coins"].ToString());
            foreach (var item in jArray)
            {
                CoinGeckoMetaDataModel coinGeckoMetaData = await GetMetaData(item["item"]["id"].ToString());

                coins.Add(new CoinGeckoTrendingModel()
                {
                    Name = item["item"]["name"].ToString(),
                    Id = item["item"]["id"].ToString(),
                    ImagePath = item["item"]["thumb"].ToString(),
                    Symbol = item["item"]["symbol"].ToString(),
                    MarketCapRank = int.Parse(item["item"]["market_cap_rank"].ToString()),
                    PriceChange24hr = coinGeckoMetaData.market_data.price_change_percentage_24h ?? 0,
                    CurrentPriceUsd = coinGeckoMetaData.market_data.current_price.usd ?? 0,
                });
            }

            IEnumerable<CoinGeckoMarketModel> coinGeckoMarketModels = await GetMarkets();
            int i = 0;
            foreach (CoinGeckoMarketModel coinGeckoMarketModel in coinGeckoMarketModels)
            {
                if (i++ >= 15)
                {
                    break;
                }
                coins.Add(new CoinGeckoTrendingModel()
                {
                    Name = coinGeckoMarketModel.Name,
                    Id = coinGeckoMarketModel.Id,
                    ImagePath = coinGeckoMarketModel.image,
                    Symbol = coinGeckoMarketModel.Symbol,
                    MarketCapRank = coinGeckoMarketModel.market_cap_rank,
                    PriceChange24hr = coinGeckoMarketModel.price_change_percentage_24h,
                    CurrentPriceUsd = coinGeckoMarketModel.current_price,
                });
            }
            _memoryCache.Set(CacheKey.CoinGeckoGetTrending, coins.OrderByDescending(x => x.Id), cacheEntryOptions);
        }

        return coins;
    }

    public async Task<CoinGeckoMetaDataModel> GetMetaData(string geckoId)
    {
        if (string.IsNullOrWhiteSpace(geckoId))
        {
            throw new ArgumentNullException(geckoId);
        }

        string cacheKey = "GetGeckoMetaData-" + geckoId;
        CoinGeckoMetaDataModel? responseData = new();
        if (!_memoryCache.TryGetValue(cacheKey, out responseData))
        {
            responseData = new();
            var cacheEntryOptions = new MemoryCacheEntryOptions()
                .SetAbsoluteExpiration(TimeSpan.FromHours(12));

            RestClient client = new RestClient();
            RestRequest request = new RestRequest($"https://api.coingecko.com/api/v3/coins/{geckoId}");
            RestResponse response = await client.ExecuteAsync(request);
            JObject data = JObject.Parse(response.Content!);
            responseData = JsonConvert.DeserializeObject<CoinGeckoMetaDataModel>(data.ToString());
            if (responseData == null)
            {
                throw new Exception("Failed to retrieve metadata for " + geckoId);
            }

            _memoryCache.Set(cacheKey, responseData, cacheEntryOptions);
        }

        if (responseData == null)
        {
            throw new Exception("Failed to retrieve metadata for " + geckoId);
        }

        return responseData;
    }

    public async Task<IEnumerable<CoinGeckoMarketModel>> GetMarkets(int page = 1)
    {
        string cacheKey = "GetMarkets-" + page;
        IEnumerable<CoinGeckoMarketModel>? responseData = Enumerable.Empty<CoinGeckoMarketModel>();
        if (!_memoryCache.TryGetValue(cacheKey, out responseData))
        {
            var cacheEntryOptions = new MemoryCacheEntryOptions()
                .SetAbsoluteExpiration(TimeSpan.FromMinutes(30));

            RestClient client = new RestClient();
            RestRequest request = new RestRequest($"https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page={page}&sparkline=false");
            RestResponse response = await client.ExecuteAsync(request);
            JArray data = JArray.Parse(response.Content!);
            responseData = JsonConvert.DeserializeObject<IEnumerable<CoinGeckoMarketModel>>(data.ToString());
            if (responseData == null)
            {
                throw new Exception("Failed to retrieve markets for page " + page);
            }

            _memoryCache.Set(cacheKey, responseData, cacheEntryOptions);
        }

        if (responseData == null)
        {
            throw new Exception("Failed to retrieve markets for page " + page);
        }

        return responseData;
    }

    /// <summary>
    /// Returns OHLC pairs in 30 minute intervals
    /// </summary>
    /// <param name="coinName">Name of the coin</param>
    /// <param name="days">Number of days to be returned (deffault of 1)</param>
    /// <returns>List<OHLCPairModel></returns>
    public async Task<List<OHLCPairModel>> GetOHLCPairs(string coinName, string searchTerm = "7d")
    {
        if (string.IsNullOrEmpty(coinName) || string.IsNullOrEmpty(searchTerm))
        {
            throw new ArgumentException();
        }
        coinName = coinName.ToLower();

        string cacheKey = $"GetOHLCPairs-{coinName}-{searchTerm}";
        List<OHLCPairModel> responseData = new();
        if (!_memoryCache.TryGetValue(cacheKey, out responseData))
        {
            responseData = new();
            var cacheEntryOptions = new MemoryCacheEntryOptions()
                .SetAbsoluteExpiration(TimeSpan.FromSeconds(30));

            int days = 1;
            int? hours = null;
            if (searchTerm.Contains("d"))
            {
                days = int.Parse(searchTerm.Replace("d", "")); ;
            }
            else if (searchTerm.Contains("hr"))
            {
                hours = int.Parse(searchTerm.Replace("hr", ""));
                days = 1;
            }

            RestClient client = new RestClient();
            string searchParams = "vs_currency=usd&days=" + days;
            RestRequest request = new RestRequest($"https://api.coingecko.com/api/v3/coins/{coinName}/ohlc?{searchParams}");
            RestResponse response = await client.ExecuteAsync(request);
            JArray jArray = JArray.Parse(response.Content!);

            if (jArray != null && jArray.Count > 0)
            {
                for (int i = 0; i < jArray.Count; i++)
                {
                    if (jArray[i] != null)
                    {
                        string? time = jArray[i][0]?.ToString();
                        string? open = jArray[i][1]?.ToString();
                        string? high = jArray[i][2]?.ToString();
                        string? low = jArray[i][3]?.ToString();
                        string? close = jArray[i][4]?.ToString();


                        if (hours.HasValue)
                        {
                            DateTime timeVal = long.Parse(time).DateTimeFromUnixTimeStampMillis();
                            if ((DateTime.Now - timeVal).TotalHours <= hours + 1)
                            {
                                responseData.Add(new OHLCPairModel()
                                {
                                    //TimeStamp = timeVal,
                                    Open = double.Parse(open),
                                    High = double.Parse(high),
                                    Low = double.Parse(low),
                                    Close = double.Parse(close),
                                });
                            }
                        }
                        else
                        {
                            responseData.Add(new OHLCPairModel()
                            {
                                //TimeStamp = long.Parse(time).DateTimeFromUnixTimeStampMillis(),
                                Open = double.Parse(open),
                                High = double.Parse(high),
                                Low = double.Parse(low),
                                Close = double.Parse(close),
                            });
                        }


                    }
                }
            }


            _memoryCache.Set(CacheKey.CoinGeckoGetTrending, responseData, cacheEntryOptions);
        }

        return responseData;
    }

    /// <summary>
    /// Returns OHLC pairs in 30 minute intervals
    /// </summary>
    /// <param name="coinName">Name of the coin</param>
    /// <param name="days">Number of days to be returned (deffault of 1)</param>
    /// <returns>List<VolumePairModel></returns>
    public async Task<List<VolumePairModel>> GetCoinVolume(string coinName, string searchTerm)
    {
        if (string.IsNullOrEmpty(coinName) || string.IsNullOrEmpty(searchTerm))
        {
            throw new ArgumentException();
        }

        coinName = coinName.ToLower();

        string cacheKey = $"GetCoinVolume-{coinName}-{searchTerm}";
        List<VolumePairModel> responseData = new();
        if (!_memoryCache.TryGetValue(cacheKey, out responseData))
        {
            responseData = new();
            var cacheEntryOptions = new MemoryCacheEntryOptions()
                .SetAbsoluteExpiration(TimeSpan.FromSeconds(30));

            int days = 1;
            int? hours = null;
            string interval = "hourly";
            if (searchTerm.Contains("d"))
            {
                days = int.Parse(searchTerm.Replace("d", "")); ;
            }
            else if (searchTerm.Contains("hr"))
            {
                hours = int.Parse(searchTerm.Replace("hr", ""));
                days = 1;
            }

            RestClient client = new RestClient();
            RestRequest request = new RestRequest($"https://api.coingecko.com/api/v3/coins/{coinName}/market_chart?vs_currency=usd&days={days}&interval={interval}");
            RestResponse response = await client.ExecuteAsync(request);
            JObject data = JObject.Parse(response.Content!);
            if (data != null)
            {
                JToken token = JObject.Parse(response?.Content)["total_volumes"];
                JArray jArray = JArray.Parse(token.ToString());
                if (jArray != null && jArray.Count > 0)
                {
                    for (int i = 0; i < jArray.Count; i++)
                    {
                        if (jArray[i] != null)
                        {
                            string? time = jArray[i][0]?.ToString();
                            string? volume = jArray[i][1]?.ToString();

                            if (time != null && volume != null)
                            {

                                if (hours.HasValue)
                                {
                                    DateTime timeVal = long.Parse(time).DateTimeFromUnixTimeStampMillis();
                                    if ((DateTime.Now - timeVal).TotalHours <= hours + 1)
                                    {
                                        responseData.Add(new VolumePairModel()
                                        {
                                            TimeStamp = timeVal,
                                            Volume = double.Parse(volume)
                                        });
                                    }
                                }
                                else
                                {
                                    responseData.Add(new VolumePairModel()
                                    {
                                        TimeStamp = long.Parse(time).DateTimeFromUnixTimeStampMillis(),
                                        Volume = double.Parse(volume)
                                    });
                                }
                            }
                        }
                    }
                }
            }

            _memoryCache.Set(CacheKey.CoinGeckoGetTrending, responseData, cacheEntryOptions);
        }

        return responseData;
    }

    public async Task<IEnumerable<CoinGeckCoinModel>> GetTradeableCoins() =>
        await _db.LoadData<CoinGeckCoinModel, dynamic>(
                    "[dbo].[GetTradeableCoinGeckoCoins]",
                    new { });

    public async Task<CoinGeckCoinModel> GetTradeableCoinByCoinMarketCapId(int coinMarketCapId)
    {
        var result = await _db.LoadData<CoinGeckCoinModel, dynamic>(
           "[dbo].[GetTradeableCoinGeckoCoinByCoinMarketCapId]",
           new { CoinMarketCapId = coinMarketCapId });

        return result.FirstOrDefault() ?? new();
    }

    public async Task<CoinGeckCoinModel> GetTradeableCoinByCoinGeckoId(string coinGeckoId)
    {
        var result = await _db.LoadData<CoinGeckCoinModel, dynamic>(
           "[dbo].[GetTradeableCoinByCoinGeckoId]",
           new { Id = coinGeckoId });

        return result.FirstOrDefault() ?? new();
    }
    
    public async Task<CoinGeckCoinModel> GetTradeableCoinByCoinGeckoSymbol(string coinGeckoSymbol)
    {
        var result = await _db.LoadData<CoinGeckCoinModel, dynamic>(
           "[dbo].[GetTradeableCoinByCoinGeckoSymbol]",
           new { Symbol = coinGeckoSymbol });

        return result.FirstOrDefault() ?? new();
    }
}

//RestClient client = new RestClient();
//RestRequest request = new RestRequest($"https://api.coingecko.com/api/v3/coins/list");
//RestResponse response = await client.ExecuteAsync(request);
//JArray jArray = JArray.Parse(response.Content!);

//        if (jArray != null && jArray.Count > 0)
//        {
//            for (int i = 0; i<jArray.Count; i++)
//            {
//                if (jArray[i] != null)
//                {
//                    string? id = jArray[i]["id"]?.ToString();
//string? sym = jArray[i]["symbol"]?.ToString();
//string? name = jArray[i]["name"]?.ToString();

//                    try
//                    {
//                        await _db.SaveData<dynamic>(
//                      "[dbo].[CreatCoinGeckoCoin]",
//                      new { Id = id, Symbol = sym, Name = name });
//                    }
//                    catch { }
//                }
//            }
//        }



