using MoonTrading.BusinessLogic.Validation;
using MoonTrading.DataAccess.Data.Interfaces;
using Microsoft.Extensions.Caching.Memory;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;
using MoonTrading.BusinessLogic.Actions;
using static SharedConstants.Constants;

namespace MoonTrading.DataAccess.Data;

public class CoinGeckoData : DataBase, ICoinGeckoData
{
    internal IMemoryCache _memoryCache;
    internal ICryptoFacilitiesData _cryptoFacilitiesData;
    public CoinGeckoData(ISqlDataAccess db, IMemoryCache memory, ICryptoFacilitiesData cryptoFacilitiesData) : base(db)
    {
        _memoryCache = memory;
        _cryptoFacilitiesData = cryptoFacilitiesData;
    }

    /// <summary>
    /// Gets the price conversion in USD based on the CoinGeckoId <paramref name="currency"/>
    /// </summary>
    /// <param name="currency"></param>
    /// <param name="amount"></param>
    /// <returns>double</returns>
    /// <exception cref="ArgumentNullException">When currency is null</exception>
    /// <exception cref="ArgumentOutOfRangeException">When amount is less than or equal to 0</exception>
    public async Task<double> GetPriceInUsd(string currency, double amount = 1)
    {
        CoinGeckoDataValidation.ValidateGetPrice(currency, amount);

        double price;
        string cacheKey = CoinGeckoDataHandler.GetCacheKeyForPrice(currency);
        if (!_memoryCache.TryGetValue(cacheKey, out price))
        {
            var cacheEntryOptions = new MemoryCacheEntryOptions()
                .SetAbsoluteExpiration(TimeSpan.FromSeconds(10));

            RestClient client = new RestClient();
            RestRequest request = new RestRequest($"https://api.coingecko.com/api/v3/simple/price?ids={currency}&vs_currencies=usd");
            RestResponse response = await client.ExecuteAsync(request);
            price = CoinGeckoDataHandler.HandleGetPriceInUsdResponse(response);

            _memoryCache.Set(cacheKey, price);
        }

        return price * amount;
    }

    /// <summary>
    /// Gets CoinGecko's top trending Coins in the last 24hrs
    /// </summary>
    /// <returns> <see cref="CoinGeckoTrendingModel"/> <seealso cref="List{T}"/> </returns>
    /// <exception cref="Exception"></exception>
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

            if (!response.IsSuccessful)
            {
                Guid corralationId = Guid.NewGuid();
                throw new Exception("An unexpected error occured when retrieving trending coins " + corralationId.ToString());
            }

            if (string.IsNullOrWhiteSpace(response.Content))
            {
                Guid corralationId = Guid.NewGuid();
                throw new Exception("An unexpected error occured when retrieving trending coins " + corralationId.ToString());
            }

            JObject data = JObject.Parse(response.Content.ToString()!);
            JArray jArray = JArray.Parse(Extensions.Extensions.NullableToString(data["coins"]));
            foreach (var item in jArray)
            {
                if (item != null && item["item"] != null)
                {
                    if (item["item"]?["id"] != null && item["item"]?["name"] != null)
                    {
                        string id = Extensions.Extensions.NullableToString(item["item"]?["id"]);
                        if (!string.IsNullOrWhiteSpace(id))
                        {
                            CoinGeckoMetaDataModel coinGeckoMetaData;
                            try
                            {
                                coinGeckoMetaData = await GetMetaData(id);
                            }
                            catch (Exception)
                            {
                                coinGeckoMetaData = new();
                            }

                            coins.Add(new CoinGeckoTrendingModel()
                            {
                                Name = Extensions.Extensions.NullableToString(item["item"]?["name"]),
                                Id = Extensions.Extensions.NullableToString(item["item"]?["id"]),
                                ImagePath = Extensions.Extensions.NullableToString(item["item"]?["thumb"]),
                                Symbol = Extensions.Extensions.NullableToString(item["item"]?["symbol"]),
                                MarketCapRank = int.Parse(Extensions.Extensions.NullableToString(item["item"]?["market_cap_rank"])),
                                PriceChange24hr = coinGeckoMetaData.market_data.price_change_percentage_24h ?? 0,
                                CurrentPriceUsd = coinGeckoMetaData.market_data.current_price.usd ?? 0,
                            });
                        }
                    }
                }
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

    /// <summary>
    /// Gets meta data associated with a particular coin
    /// </summary>
    /// <param name="geckoId"></param>
    /// <returns><see cref="CoinGeckoMetaDataModel"/></returns>
    /// <exception cref="ArgumentNullException">When <paramref name="geckoId"/> is null</exception>
    /// <exception cref="Exception"></exception>
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

    /// <summary>
    /// Gets available CoinGecko markets 
    /// </summary>
    /// <param name="page"></param>
    /// <returns><see cref="CoinGeckoMarketModel"/></returns>
    /// <exception cref="ArgumentOutOfRangeException">When page is less than 1</exception>
    /// <exception cref="Exception">When unable to retrieve specific page</exception>
    public async Task<IEnumerable<CoinGeckoMarketModel>> GetMarkets(int page = 1)
    {
        if(page < 1)
        {
            throw new ArgumentOutOfRangeException();
        }

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
            responseData = JsonConvert.DeserializeObject<IEnumerable<CoinGeckoMarketModel>>(data.ToString(), new JsonSerializerSettings { NullValueHandling = NullValueHandling.Ignore});
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
    //public async Task<List<OHLCPairModel>> GetOHLCPairs(string coinName, string searchTerm = "7d")
    //{
    //    if (string.IsNullOrEmpty(coinName) || string.IsNullOrEmpty(searchTerm))
    //    {
    //        throw new ArgumentException();
    //    }
    //    coinName = coinName.ToLower();

    //    string cacheKey = $"GetOHLCPairs-{coinName}-{searchTerm}";
    //    List<OHLCPairModel> responseData = new();
    //    if (!_memoryCache.TryGetValue(cacheKey, out responseData))
    //    {
    //        responseData = new();
    //        var cacheEntryOptions = new MemoryCacheEntryOptions()
    //            .SetAbsoluteExpiration(TimeSpan.FromSeconds(30));

    //        int days = 1;
    //        int? hours = null;
    //        if (searchTerm.Contains("d"))
    //        {
    //            days = int.Parse(searchTerm.Replace("d", "")); ;
    //        }
    //        else if (searchTerm.Contains("hr"))
    //        {
    //            hours = int.Parse(searchTerm.Replace("hr", ""));
    //            days = 1;
    //        }

    //        RestClient client = new RestClient();
    //        string searchParams = "vs_currency=usd&days=" + days;
    //        RestRequest request = new RestRequest($"https://api.coingecko.com/api/v3/coins/{coinName}/ohlc?{searchParams}");
    //        RestResponse response = await client.ExecuteAsync(request);
    //        JArray jArray = JArray.Parse(response.Content!);

    //        if (jArray != null && jArray.Count > 0)
    //        {
    //            for (int i = 0; i < jArray.Count; i++)
    //            {
    //                if (jArray[i] != null)
    //                {
    //                    string? time = jArray[i][0]?.ToString();
    //                    string? open = jArray[i][1]?.ToString();
    //                    string? high = jArray[i][2]?.ToString();
    //                    string? low = jArray[i][3]?.ToString();
    //                    string? close = jArray[i][4]?.ToString();


    //                    if (hours.HasValue)
    //                    {
    //                        DateTime timeVal = long.Parse(time).DateTimeFromUnixTimeStampMillis();
    //                        if ((DateTime.Now - timeVal).TotalHours <= hours + 1)
    //                        {
    //                            responseData.Add(new OHLCPairModel()
    //                            {
    //                                //TimeStamp = timeVal,
    //                                Open = double.Parse(open),
    //                                High = double.Parse(high),
    //                                Low = double.Parse(low),
    //                                Close = double.Parse(close),
    //                            });
    //                        }
    //                    }
    //                    else
    //                    {
    //                        responseData.Add(new OHLCPairModel()
    //                        {
    //                            //TimeStamp = long.Parse(time).DateTimeFromUnixTimeStampMillis(),
    //                            Open = double.Parse(open),
    //                            High = double.Parse(high),
    //                            Low = double.Parse(low),
    //                            Close = double.Parse(close),
    //                        });
    //                    }


    //                }
    //            }
    //        }


    //        _memoryCache.Set(CacheKey.CoinGeckoGetTrending, responseData, cacheEntryOptions);
    //    }

    //    return responseData;
    //}

    /// <summary>
    /// Returns OHLC pairs in 30 minute intervals
    /// </summary>
    /// <param name="coinName">Name of the coin</param>
    /// <param name="days">Number of days to be returned (deffault of 1)</param>
    /// <returns>List<VolumePairModel></returns>
    //public async Task<List<VolumePairModel>> GetCoinVolume(string coinName, string searchTerm)
    //{
    //    if (string.IsNullOrEmpty(coinName) || string.IsNullOrEmpty(searchTerm))
    //    {
    //        throw new ArgumentException();
    //    }

    //    coinName = coinName.ToLower();

    //    string cacheKey = $"GetCoinVolume-{coinName}-{searchTerm}";
    //    List<VolumePairModel> responseData = new();
    //    if (!_memoryCache.TryGetValue(cacheKey, out responseData))
    //    {
    //        responseData = new();
    //        var cacheEntryOptions = new MemoryCacheEntryOptions()
    //            .SetAbsoluteExpiration(TimeSpan.FromSeconds(30));

    //        int days = 1;
    //        int? hours = null;
    //        string interval = "hourly";
    //        if (searchTerm.Contains("d"))
    //        {
    //            days = int.Parse(searchTerm.Replace("d", "")); ;
    //        }
    //        else if (searchTerm.Contains("hr"))
    //        {
    //            hours = int.Parse(searchTerm.Replace("hr", ""));
    //            days = 1;
    //        }

    //        RestClient client = new RestClient();
    //        RestRequest request = new RestRequest($"https://api.coingecko.com/api/v3/coins/{coinName}/market_chart?vs_currency=usd&days={days}&interval={interval}");
    //        RestResponse response = await client.ExecuteAsync(request);
    //        JObject data = JObject.Parse(response.Content!);
    //        if (data != null)
    //        {
    //            JToken token = JObject.Parse(response?.Content)["total_volumes"];
    //            JArray jArray = JArray.Parse(token.ToString());
    //            if (jArray != null && jArray.Count > 0)
    //            {
    //                for (int i = 0; i < jArray.Count; i++)
    //                {
    //                    if (jArray[i] != null)
    //                    {
    //                        string? time = jArray[i][0]?.ToString();
    //                        string? volume = jArray[i][1]?.ToString();

    //                        if (time != null && volume != null)
    //                        {

    //                            if (hours.HasValue)
    //                            {
    //                                DateTime timeVal = long.Parse(time).DateTimeFromUnixTimeStampMillis();
    //                                if ((DateTime.Now - timeVal).TotalHours <= hours + 1)
    //                                {
    //                                    responseData.Add(new VolumePairModel()
    //                                    {
    //                                        TimeStamp = timeVal,
    //                                        Volume = double.Parse(volume)
    //                                    });
    //                                }
    //                            }
    //                            else
    //                            {
    //                                responseData.Add(new VolumePairModel()
    //                                {
    //                                    TimeStamp = long.Parse(time).DateTimeFromUnixTimeStampMillis(),
    //                                    Volume = double.Parse(volume)
    //                                });
    //                            }
    //                        }
    //                    }
    //                }
    //            }
    //        }

    //        _memoryCache.Set(CacheKey.CoinGeckoGetTrending, responseData, cacheEntryOptions);
    //    }

    //    return responseData;
    //}

    public async Task<IEnumerable<CoinGeckCoinModel>> GetTradeableCoins() =>
        await _db.LoadData<CoinGeckCoinModel, dynamic>(
                    "[dbo].[GetTradeableCoinGeckoCoins]",
                    new { });

    public async Task<CoinGeckCoinModel> GetTradeableCoinByCoinMarketCapId(int coinMarketCapId)
    {
        if(coinMarketCapId <= 0)
        {
            throw new ArgumentOutOfRangeException();
        }

        var result = await _db.LoadData<CoinGeckCoinModel, dynamic>(
           "[dbo].[GetTradeableCoinGeckoCoinByCoinMarketCapId]",
           new { CoinMarketCapId = coinMarketCapId });

        return result.FirstOrDefault() ?? new();
    }

    public async Task<CoinGeckCoinModel> GetTradeableCoinByCoinGeckoId(string coinGeckoId)
    {
        if (string.IsNullOrWhiteSpace(coinGeckoId))
        {
            throw new ArgumentNullException(nameof(coinGeckoId));
        }

        var result = await _db.LoadData<CoinGeckCoinModel, dynamic>(
           "[dbo].[GetTradeableCoinByCoinGeckoId]",
           new { Id = coinGeckoId });

        return result.FirstOrDefault() ?? new();
    }

    public async Task<CoinGeckCoinModel> GetTradeableCoinByCoinGeckoSymbol(string coinGeckoSymbol)
    {
        if (string.IsNullOrWhiteSpace(coinGeckoSymbol))
        {
            throw new ArgumentNullException(nameof(coinGeckoSymbol));
        }

        var result = await _db.LoadData<CoinGeckCoinModel, dynamic>(
           "[dbo].[GetTradeableCoinByCoinGeckoSymbol]",
           new { Symbol = coinGeckoSymbol });

        return result.FirstOrDefault() ?? new();
    }
}
