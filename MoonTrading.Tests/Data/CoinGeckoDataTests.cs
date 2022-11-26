using MoonTrading.DataAccess.Data;
using MoonTrading.DataAccess.Data.Interfaces;
using Microsoft.Extensions.Caching.Memory;
using Moq;
using RestSharp;
using static SharedConstants.Constants;
using MoonTrading.Model;

namespace MoonTrading.DataAccess.Data;

[TestClass]
public class CoinGeckoDataTests
{
    Mock<ISqlDataAccess> _dataBase;
    Mock<IMemoryCache> _memoryCache;
    CoinGeckoData coinGeckoData;
    Mock<RestClient> mockRestClient;
    Mock<ICryptoFacilitiesData> _cryptoFacility;

    [TestInitialize]
    public void Setup()
    {
        _dataBase = new Mock<ISqlDataAccess>();
        _memoryCache = new Mock<IMemoryCache>();
        _cryptoFacility = new Mock<ICryptoFacilitiesData>();
        coinGeckoData = new(_dataBase.Object, _memoryCache.Object, _cryptoFacility.Object);
        mockRestClient = new Mock<RestClient>();
    }

    [TestMethod]
    public async Task GetPriceInUsd_InvalidCurrency_ExpectException()
    {
        // Arrange
        ArgumentException? exception = null;

        // Act
        try
        {
            var a = await coinGeckoData.GetPriceInUsd("");
        }
        catch (ArgumentNullException e) { exception = e; }

        // Assert
        Assert.IsNotNull(exception);
        Assert.AreEqual(exception.Message, "Value cannot be null. (Parameter 'currency')");
    }
    
    [TestMethod]
    public async Task GetPriceInUsd_ValidCurrency_ExpectSuccess()
    {
        // Arrange
        string n = "";
         var mockCacheEntry = new Mock<ICacheEntry>();

        Exception? exception = null;
        _memoryCache.Setup(mc => mc.CreateEntry(It.IsAny<object>()))
        .Callback((object k) => n = (string)k)
        .Returns(mockCacheEntry.Object);

        // Act
        try
        {
            var a = await coinGeckoData.GetPriceInUsd("bitcoin");
        }
        catch (Exception e) { exception = e; }

        // Assert
        Assert.IsNull(exception);
    }
    
    [TestMethod]
    public async Task GetTrending_ExpectSuccess()
    {
        // Arrange
        Mock<ICoinGeckoData> coinGeckoData = new Mock<ICoinGeckoData>();
        coinGeckoData.Setup(x => x.GetTrending()).ReturnsAsync(new List<CoinGeckoTrendingModel>());

        // Act
        var response = await coinGeckoData.Object.GetTrending();

        // Assert
        Assert.IsNotNull(response);
        Assert.IsTrue(response.Count >= 0);
    }
    
    [TestMethod]
    [ExpectedException(typeof(ArgumentNullException))]
    public async Task GetMetaData_InvalidCoinId_ExpectSuccess()
    {
        // Arrange

        // Act
        var response = await coinGeckoData.GetMetaData(string.Empty);

        // Assert
    }
    
    [TestMethod]
    public async Task GetMetaData_ValidCoinId_ExpectSuccess()
    {
        // Arrange
        string n = "";
        var mockCacheEntry = new Mock<ICacheEntry>();

        _memoryCache.Setup(mc => mc.CreateEntry(It.IsAny<object>()))
        .Callback((object k) => n = (string)k)
        .Returns(mockCacheEntry.Object);

        // Act
        var response = await coinGeckoData.GetMetaData("bitcoin");

        // Assert
        Assert.IsNotNull(response);
    }
    
    [TestMethod]
    public async Task GetMetaData_ValidPage_ExpectSuccess()
    {
        // Arrange
        string n = "";
        var mockCacheEntry = new Mock<ICacheEntry>();

        _memoryCache.Setup(mc => mc.CreateEntry(It.IsAny<object>()))
        .Callback((object k) => n = (string)k)
        .Returns(mockCacheEntry.Object);

        // Act
        var response = await coinGeckoData.GetMarkets(1);

        // Assert
        Assert.IsNotNull(response);
    }
    
    [TestMethod]
    [ExpectedException(typeof(ArgumentOutOfRangeException))]
    public async Task GetMetaData_InvalidPage_ExpectException()
    {
        // Arrange

        // Act
        var response = await coinGeckoData.GetMarkets(-1);

        // Assert
    }
    
    [TestMethod]
    [ExpectedException(typeof(ArgumentNullException))]
    public async Task GetTradeableCoinByCoinGeckoId_InvalidCoinGeckoId_ExpectException()
    {
        // Arrange

        // Act
        var response = await coinGeckoData.GetTradeableCoinByCoinGeckoId(string.Empty);

        // Assert
        // throws exception
    }
    
    [TestMethod]
    public async Task GetTradeableCoinByCoinGeckoId_ValidCoinGeckoId_ExpectSuccess()
    {
        // Arrange
        CoinGeckCoinModel coinGeckCoinModel;

        // Act
        coinGeckCoinModel = await coinGeckoData.GetTradeableCoinByCoinGeckoId("bitcoin");

        // Assert
        Assert.IsNotNull(coinGeckCoinModel);
    }
    
    [TestMethod]
    [ExpectedException(typeof(ArgumentNullException))]
    public async Task GetTradeableCoinByCoinGeckoSymbol_InvalidCoinSymbol_ExpectException()
    {
        // Arrange

        // Act
        var response = await coinGeckoData.GetTradeableCoinByCoinGeckoSymbol(string.Empty);

        // Assert
        // throws exception
    }
    
    [TestMethod]
    public async Task GetTradeableCoinByCoinGeckoSymbol_ValidCoinSymbol_ExpectSuccess()
    {
        // Arrange
        CoinGeckCoinModel coinGeckCoinModel;

        // Act
        coinGeckCoinModel = await coinGeckoData.GetTradeableCoinByCoinGeckoSymbol("btc");

        // Assert
        Assert.IsNotNull(coinGeckCoinModel);
    }
    
    [TestMethod]
    [ExpectedException(typeof(ArgumentOutOfRangeException))]
    public async Task GetTradeableCoinByCoinMarketCapId_InvalidIdExpectException()
    {
        // Arrange

        // Act
        var response = await coinGeckoData.GetTradeableCoinByCoinMarketCapId(-1);

        // Assert
        // throws exception
    }
    
    [TestMethod]
    public async Task GetTradeableCoinByCoinMarketCapId_ValidCoinId_ExpectSuccess()
    {
        // Arrange
        CoinGeckCoinModel coinGeckCoinModel;

        // Act
        coinGeckCoinModel = await coinGeckoData.GetTradeableCoinByCoinMarketCapId(1);

        // Assert
        Assert.IsNotNull(coinGeckCoinModel);
    }
    
    [TestMethod]
    public async Task GetTradeableCoins_ExpectValidEnumerable()
    {
        // Arrange
        IEnumerable<CoinGeckCoinModel> coinGeckCoinModels;

        // Act
        coinGeckCoinModels = await coinGeckoData.GetTradeableCoins();

        // Assert
        Assert.IsNotNull(coinGeckCoinModels);
    }
}
