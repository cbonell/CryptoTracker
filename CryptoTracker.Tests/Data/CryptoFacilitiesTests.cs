using CryptoTracker.DataAccess.Data.Interfaces;
using Moq;

namespace CryptoTracker.Tests.Data;

[TestClass]
public class CryptoFacilitiesTests
{
    Mock<ICryptoFacilitiesData> _cryptoFacilitiesData;
    [TestInitialize]
    public void Setup()
    {
        _cryptoFacilitiesData = new Mock<ICryptoFacilitiesData>();
    }

    [TestMethod]
    public async Task GetOHLCPairsTest()
    {
        var nullPairs = await _cryptoFacilitiesData.Object.GetOHLCPairs("x", DateTimeOffset.UtcNow);
        var pairs = await _cryptoFacilitiesData.Object.GetOHLCPairs("btc", DateTimeOffset.UtcNow.AddDays(-1));
        
        // verify that a non-supported model returns an array of 0,  while a supported model does not
        Assert.AreEqual(nullPairs.Count, 0);
        Assert.AreNotEqual(pairs.Count, 0);
    }
}
