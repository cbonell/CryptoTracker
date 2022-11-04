using CryptoTracker.DataAccess.CoinGeckoAccess;
using CryptoTracker.DataAccess.Data;
using CryptoTracker.DataAccess.Data.Interfaces;
using CryptoTracker.DataAccess.DbAccess;
using Microsoft.Extensions.Caching.Memory;
using Moq;
using RestSharp;
using static SharedConstants.Constants;

namespace CryptoTracker.Tests.Data;

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
            var a = await coinGeckoData.GetPriceInUsd(null);
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
    public async Task GetPriceHistory_InvalidCurrency_ExpectException()
    {
        // Arrange
        ArgumentException? exception = null;

        // Act
        try
        {
            var a = await coinGeckoData.GetPriceHistory("", "");
        }
        catch (ArgumentNullException e) { exception = e; }

        // Assert
        Assert.IsNotNull(exception);
        Assert.AreEqual(exception.Message, "Value cannot be null. (Parameter 'currency')");
    }
}
