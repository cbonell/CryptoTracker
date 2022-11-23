using MoonTrading.DataAccess.Data;
using MoonTrading.DataAccess.Data.Interfaces;
using Moq;
using static SharedConstants.Constants;

namespace MoonTrading.DataAccess.Data;

[TestClass]
public class CurrencyDataTests
{
    Mock<ISqlDataAccess> _dataBase;
    CurrencyData currencyData;

    [TestInitialize]
    public void Setup()
    {
        _dataBase = new Mock<ISqlDataAccess>();
        currencyData = new(_dataBase.Object);
    }

    [TestMethod]
    public async Task GetCurrencies_ExpectSuccess()
    {
        // Arange

        // Act
        var currency = await currencyData.GetCurrencies();

        // Assert
        Assert.IsNotNull(currency);
    }
    
    //[TestMethod]
    //public async Task GetCurrenciesByType_InvalidCurrencyType_ExpectException()
    //{
    //    // Arange
    //    InvalidDataException? exception = null;
    //    // Act
    //    ICurrencyData.CurrencyType currencyType = (ICurrencyData.CurrencyType) (- 1);

    //    try
    //    {
    //        var currency = await currencyData.GetCurrenciesByType(currencyType);
    //    }
    //    catch(InvalidDataException e) { exception = e; }

    //    // Assert
    //    Assert.IsNotNull(exception);
    //    Assert.AreEqual(exception.Message, string.Format("Recieved invalid enum value for {0}", nameof(ICurrencyData.CurrencyType)));
    //}

    //[TestMethod]
    //public async Task GetCurrenciesByType_ValidCurrencyType_ExpectSuccess()
    //{
    //    // Arange
    //    InvalidDataException? exception = null;
    //    // Act
    //    ICurrencyData.CurrencyType currencyType = (ICurrencyData.CurrencyType)dbval_CurrencyType_Coin;

    //    try
    //    {
    //        var currency = await currencyData.GetCurrenciesByType(currencyType);
    //    }
    //    catch(InvalidDataException e) { exception = e; }

    //    // Assert
    //    Assert.IsNull(exception);
    //}
    
    //[TestMethod]
    //public async Task GetCurrencyByCoinMarketCapId_ValidCurrencyType_ExpectSuccess()
    //{
    //    // Arange
    //    InvalidDataException? exception = null;
    //    // Act
    //    ICurrencyData.CurrencyType currencyType = (ICurrencyData.CurrencyType)dbval_CurrencyType_Coin;

    //    try
    //    {
    //        var currency = await currencyData.GetCurrenciesByType(currencyType);
    //    }
    //    catch(InvalidDataException e) { exception = e; }

    //    // Assert
    //    Assert.IsNull(exception);
    //}
    
    //[TestMethod]
    //public async Task GetCurrencyByCoinMarketCapId_InvalidCurrencyType_ExpectException()
    //{
    //    // Arange
    //    InvalidDataException? exception = null;
    //    // Act
    //    ICurrencyData.CurrencyType currencyType = (ICurrencyData.CurrencyType)(-1);

    //    try
    //    {
    //        var currency = await currencyData.GetCurrencyByCoinMarketCapId(100, currencyType);
    //    }
    //    catch(InvalidDataException e) { exception = e; }

    //    // Assert
    //    Assert.IsNotNull(exception);
    //    Assert.AreEqual(exception.Message, string.Format("Recieved invalid enum value for {0}", nameof(ICurrencyData.CurrencyType)));
    //}
    
    //[TestMethod]
    //public async Task GetCurrencyByCoinMarketCapId_InvalidCoinMarketCapId_ExpectException()
    //{
    //    // Arange
    //    Exception? exception = null;
    //    // Act
    //    ICurrencyData.CurrencyType currencyType = (ICurrencyData.CurrencyType)(dbval_CurrencyType_Coin);

    //    try
    //    {
    //        var currency = await currencyData.GetCurrencyByCoinMarketCapId(-100, currencyType);
    //    }
    //    catch(Exception e) { exception = e; }

    //    // Assert
    //    Assert.IsNotNull(exception);
    //    Assert.AreEqual(exception.Message, InvalidCoinMarketCapId);
    //}
    
    //[TestMethod]
    //public async Task GetCurrencyByCoinMarketCapId_ValidRequest_ExpectSuccess()
    //{
    //    // Arange
    //    Exception? exception = null;
    //    // Act
    //    ICurrencyData.CurrencyType currencyType = (ICurrencyData.CurrencyType)(dbval_CurrencyType_Coin);

    //    try
    //    {
    //        var currency = await currencyData.GetCurrencyByCoinMarketCapId(100, currencyType);
    //    }
    //    catch(Exception e) { exception = e; }

    //    // Assert
    //    Assert.IsNull(exception);
    //}
}
