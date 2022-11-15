using MoonTrading.Tests.Data;
using MoonTrading.Tests.Data.Interfaces;
using MoonTrading.Tests.DbAccess;
using Microsoft.Extensions.Caching.Memory;
using Moq;
using static SharedConstants.Constants;

namespace MoonTrading.Tests.Data;

[TestClass]
public class CoinMarketCapMetaDataTests
{
    Mock<ISqlDataAccess>? _dataBase;
    CoinMarketCapData? CoinMarketCapData;
    IMemoryCache _memoryCache;

    [TestInitialize]
    public void Setup()
    {
        _dataBase = new Mock<ISqlDataAccess>();
        CoinMarketCapData = new(_dataBase.Object, _memoryCache);
    }

    [TestMethod]
    public async Task GetCoinMetaData_InvalidCoinMarketCapId_ExpectException()
    {
        // Arrange             
        Exception? exception = null;

        // Act           
        try
        {
            await CoinMarketCapData.GetCoinMetaData(-1);
        }
        catch (Exception e) { exception = e; }

        // Assert
        Assert.IsNotNull(exception);
        Assert.AreEqual(exception.Message, InvalidCoinMarketCapId);
    }
}
