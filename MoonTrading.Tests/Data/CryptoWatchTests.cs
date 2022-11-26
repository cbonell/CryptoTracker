using Microsoft.Extensions.Caching.Memory;
using MoonTrading.DataAccess.Data;
using MoonTrading.DataAccess.Data.Interfaces;
using Moq;

namespace MoonTrading.Tests.Data;
[TestClass]
public class CryptoWatchTests
{
    ICryptoWatchData cryptoWatch;
    Mock<IMemoryCache> _memoryCache;

    [TestInitialize]
    public void SetUp()
    {
        _memoryCache = new Mock<IMemoryCache>();
        cryptoWatch = new CryptoWatchData(_memoryCache.Object);
    }

    [TestMethod]
    public void GetOffsetFromInterval_InvalidInterval_ReturnsDeffault()
    {
        // Arrange 

        // Act
        DateTimeOffset offset = cryptoWatch.GetOffsetFromInterval("imnotvalid");

        // Assert
        Assert.IsNotNull(offset);
        Assert.IsTrue(offset.ToString("MM/dd/yyyy/h") == DateTime.UtcNow.AddHours(-1).ToString("MM/dd/yyyy/h"));
    }
    
    [TestMethod]
    public void GetOffsetFromInterval_1wInterval_ReturnsExpected()
    {
        // Arrange 

        // Act
        DateTimeOffset offset = cryptoWatch.GetOffsetFromInterval("1w");

        // Assert
        Assert.IsNotNull(offset);
        Assert.IsTrue(offset.ToString("MM/dd/yyyy/h") == DateTime.UtcNow.AddDays(-7 * 168).ToString("MM/dd/yyyy/h"));
    }

    [TestMethod]
    public void GetOffsetFromInterval_1dInterval_ReturnsExpected()
    {
        // Arrange 

        // Act
        DateTimeOffset offset = cryptoWatch.GetOffsetFromInterval("1d");

        // Assert
        Assert.IsNotNull(offset);
        Assert.IsTrue(offset.ToString("MM/dd/yyyy/h") == DateTime.UtcNow.AddDays(-1 * 168).ToString("MM/dd/yyyy/h"));
    }
    
    [TestMethod]
    public void GetOffsetFromInterval_4hInterval_ReturnsExpected()
    {
        // Arrange 

        // Act
        DateTimeOffset offset = cryptoWatch.GetOffsetFromInterval("4h");

        // Assert
        Assert.IsNotNull(offset);
        Assert.IsTrue(offset.ToString("MM/dd/yyyy/h") == DateTime.UtcNow.AddHours(-4 * 168).ToString("MM/dd/yyyy/h"));
    }
    
    [TestMethod]
    public void GetOffsetFromInterval_1hInterval_ReturnsExpected()
    {
        // Arrange 

        // Act
        DateTimeOffset offset = cryptoWatch.GetOffsetFromInterval("1h");

        // Assert
        Assert.IsNotNull(offset);
        Assert.IsTrue(offset.ToString("MM/dd/yyyy/h") == DateTime.UtcNow.AddHours(-168).ToString("MM/dd/yyyy/h"));
    }
    
    [TestMethod]
    public void GetOffsetFromInterval_30mInterval_ReturnsExpected()
    {
        // Arrange 

        // Act
        DateTimeOffset offset = cryptoWatch.GetOffsetFromInterval("30m");

        // Assert
        Assert.IsNotNull(offset);
        Assert.IsTrue(offset.ToString("MM/dd/yyyy/hh") == DateTime.UtcNow.AddHours(-168 / 2).ToString("MM/dd/yyyy/hh"));
    }
    
    [TestMethod]
    public void GetOffsetFromInterval_15mInterval_ReturnsExpected()
    {
        // Arrange 

        // Act
        DateTimeOffset offset = cryptoWatch.GetOffsetFromInterval("15m");

        // Assert
        Assert.IsNotNull(offset);
        Assert.IsTrue(offset.ToString("MM/dd/yyyy/hh") == DateTime.UtcNow.AddHours(-168 / 4).ToString("MM/dd/yyyy/hh"));
    }
    
    [TestMethod]
    public void GetOffsetFromInterval_5mInterval_ReturnsExpected()
    {
        // Arrange 

        // Act
        DateTimeOffset offset = cryptoWatch.GetOffsetFromInterval("5m");

        // Assert
        Assert.IsNotNull(offset);
        Assert.IsTrue(offset.ToString("MM/dd/yyyy/hh") == DateTime.UtcNow.AddMinutes(-168 * 5).ToString("MM/dd/yyyy/hh"));
    }
    
    [TestMethod]
    public void GetOffsetFromInterval_1mInterval_ReturnsExpected()
    {
        // Arrange 

        // Act
        DateTimeOffset offset = cryptoWatch.GetOffsetFromInterval("1m");

        // Assert
        Assert.IsNotNull(offset);
        Assert.IsTrue(offset.ToString("MM/dd/yyyy/hh") == DateTime.UtcNow.AddMinutes(-168).ToString("MM/dd/yyyy/hh"));
    }
}
