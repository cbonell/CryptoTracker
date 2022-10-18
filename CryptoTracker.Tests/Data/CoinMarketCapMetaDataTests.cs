using CryptoTracker.DataAccess.Data;
using CryptoTracker.DataAccess.Data.Interfaces;
using CryptoTracker.DataAccess.DbAccess;
using Moq;
using static SharedConstants.Constants;

namespace CryptoTracker.Tests.Data;

[TestClass]
public class CoinMarketCapMetaDataTests
{
    Mock<ISqlDataAccess> _dataBase;
    CoinMarketCapMetaData coinMarketCapMetaData;

    [TestInitialize]
    public void Setup()
    {
        _dataBase = new Mock<ISqlDataAccess>();
        coinMarketCapMetaData = new(_dataBase.Object);
    }

    [TestMethod]
    public async Task GetCoinMetaData_InvalidCoinMarketCapId_ExpectException()
    {
        // Arrange             
        Exception? exception = null;

        // Act           
        try
        {
            await coinMarketCapMetaData.GetCoinMetaData(-1);
        }
        catch (Exception e) { exception = e; }

        // Assert
        Assert.IsNotNull(exception);
        Assert.AreEqual(exception.Message, InvalidCoinMarketCapId);
    }
}
