using CryptoTracker.DataAccess.CoinGeckoAccess;
using CryptoTracker.DataAccess.Data;
using CryptoTracker.DataAccess.Data.Interfaces;
using CryptoTracker.DataAccess.DbAccess;
using Moq;
using RestSharp;
using static SharedConstants.Constants;

namespace CryptoTracker.Tests.Data;

[TestClass]
public class CoinGeckoDataTests
{
    Mock<ISqlDataAccess> _dataBase;
    CoinGeckoData coinGeckoData;
    Mock<RestClient> mockRestClient;

    [TestInitialize]
    public void Setup()
    {
        _dataBase = new Mock<ISqlDataAccess>();
        coinGeckoData = new(_dataBase.Object);
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
        ArgumentException? exception = null;

        // Act
        try
        {
            var a = await coinGeckoData.GetPriceInUsd("bitcoin");
        }
        catch (ArgumentNullException e) { exception = e; }

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
            var a = await coinGeckoData.GetPriceHistory(null);
        }
        catch (ArgumentNullException e) { exception = e; }

        // Assert
        Assert.IsNotNull(exception);
        Assert.AreEqual(exception.Message, "Value cannot be null. (Parameter 'currency')");
    }
}
