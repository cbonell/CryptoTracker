using MoonTrading.DataAccess.Data;
using MoonTrading.DataAccess.Data.Interfaces;
using Moq;
using static SharedConstants.Constants;


namespace MoonTrading.DataAccess.DataAccess;

[TestClass]
public class TradingPurchaseDataTests
{
    Mock<ISqlDataAccess> _dataBase;
    TradingPurchaseData tradingPurchaseData;

    [TestInitialize]
    public void Setup()
    {
        _dataBase = new Mock<ISqlDataAccess>();
        tradingPurchaseData = new(_dataBase.Object);
    }

    [TestMethod]
    public async Task GetUserTradingHistory_InvalidUserId_ExpectException()
    {
        // Arrange             
        Exception? exception = null;

        // Act           
        try
        {
            await tradingPurchaseData.GetUserTradingHistory("");
        }
        catch (Exception e) { exception = e; }

        // Assert
        Assert.IsNotNull(exception);
        Assert.AreEqual(exception.Message, InvalidUserId);
    }
    
    [TestMethod]
    public async Task GetUserTradingHistory_ValidUserId_ExpectSuccess()
    {
        // Arrange             
        Exception? exception = null;

        // Act           
        try
        {
            await tradingPurchaseData.GetUserTradingHistory(TestUser_UserId);
        }
        catch (Exception e) { exception = e; }

        // Assert
        Assert.IsNull(exception);
    }
    
    [TestMethod]
    public async Task Sell_InvalidUserId_ExpectException()
    {
        // Arrange             
        Exception? exception = null;

        // Act           
        try
        {
            await tradingPurchaseData.Sell("", 100, 2.0, 100, DateTime.Now);
        }
        catch (Exception e) { exception = e; }

        // Assert
        Assert.IsNotNull(exception);
        Assert.AreEqual(exception.Message, InvalidUserId);
    }

    [TestMethod]
    public async Task Sell_InvalidQuantity_ExpectException()
    {
        // Arrange             
        Exception? exception = null;

        // Act           
        try
        {
            await tradingPurchaseData.Sell(TestUser_UserId, 10, -2.0, 100, DateTime.Now);
        }
        catch (Exception e) { exception = e; }

        // Assert
        Assert.IsNotNull(exception);
        Assert.AreEqual(exception.Message, InvalidQuantity);
    }
    
    [TestMethod]
    public async Task Sell_InvalidCoinId_ExpectException()
    {
        // Arrange             
        Exception? exception = null;

        // Act           
        try
        {
            await tradingPurchaseData.Sell(TestUser_UserId, -1, 2.0, 100, DateTime.Now);
        }
        catch (Exception e) { exception = e; }

        // Assert
        Assert.IsNotNull(exception);
        Assert.AreEqual(exception.Message, InvalidCoinId);
    }
    
    [TestMethod]
    public async Task Sell_InvalidSellPrice_ExpectException()
    {
        // Arrange             
        Exception? exception = null;

        // Act           
        try
        {
            await tradingPurchaseData.Sell(TestUser_UserId, 10, 2.0, -100, DateTime.Now);
        }
        catch (Exception e) { exception = e; }

        // Assert
        Assert.IsNotNull(exception);
        Assert.AreEqual(exception.Message, InvalidSellPrice);
    }
    
    [TestMethod]
    public async Task Sell_ValidRequest_ExpectSuccess()
    {
        // Arrange             
        Exception? exception = null;

        // Act           
        try
        {
            await tradingPurchaseData.Sell(TestUser_UserId, 10, 2.0, 100, DateTime.Now);
        }
        catch (Exception e) { exception = e; }

        // Assert
        Assert.IsNull(exception);
    }
    
    [TestMethod]
    public async Task Purchase_InvalidUserId_ExpectException()
    {
        // Arrange             
        Exception? exception = null;

        // Act           
        try
        {
            await tradingPurchaseData.Purchase("", 100, 100, 2.0, 100, DateTime.Now);
        }
        catch (Exception e) { exception = e; }

        // Assert
        Assert.IsNotNull(exception);
        Assert.AreEqual(exception.Message, InvalidUserId);
    }

    [TestMethod]
    public async Task Purchase_InvalidQuantity_ExpectException()
    {
        // Arrange             
        Exception? exception = null;

        // Act           
        try
        {
            await tradingPurchaseData.Purchase(TestUser_UserId, 100, 100, -2.0, 100, DateTime.Now);
        }
        catch (Exception e) { exception = e; }

        // Assert
        Assert.IsNotNull(exception);
        Assert.AreEqual(exception.Message, InvalidQuantity);
    }
    
    [TestMethod]
    public async Task Purchase_InvalidCoinId_ExpectException()
    {
        // Arrange             
        Exception? exception = null;

        // Act           
        try
        {
            await tradingPurchaseData.Purchase(TestUser_UserId, -100, 100, 2.0, 100, DateTime.Now);
        }
        catch (Exception e) { exception = e; }

        // Assert
        Assert.IsNotNull(exception);
        Assert.AreEqual(exception.Message, InvalidCoinId);
    }
    
    [TestMethod]
    public async Task Purchase_InvalidPurchaseCurrencyId_ExpectException()
    {
        // Arrange             
        Exception? exception = null;

        // Act           
        try
        {
            await tradingPurchaseData.Purchase(TestUser_UserId, 100, -100, 2.0, 100, DateTime.Now);
        }
        catch (Exception e) { exception = e; }

        // Assert
        Assert.IsNotNull(exception);
        Assert.AreEqual(exception.Message, InvalidCoinId);
    }
    
    [TestMethod]
    public async Task Purchase_InvalidPurchasePrice_ExpectException()
    {
        // Arrange             
        Exception? exception = null;

        // Act           
        try
        {
            await tradingPurchaseData.Purchase(TestUser_UserId, 100, 100, 2.0, -100, DateTime.Now);
        }
        catch (Exception e) { exception = e; }

        // Assert
        Assert.IsNotNull(exception);
        Assert.AreEqual(exception.Message, InvalidPurchasePrice);
    }
    
    [TestMethod]
    public async Task Purchase_ValidRequest_ExpectSuccess()
    {
        // Arrange             
        Exception? exception = null;

        // Act           
        try
        {
            await tradingPurchaseData.Purchase(TestUser_UserId, 100, 100, 2.0, 100, DateTime.Now);
        }
        catch (Exception e) { exception = e; }

        // Assert
        Assert.IsNull(exception);
    }
}
