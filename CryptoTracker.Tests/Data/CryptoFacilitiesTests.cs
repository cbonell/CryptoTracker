using CryptoTracker.DataAccess.Data;
using CryptoTracker.DataAccess.Data.Interfaces;
using Moq;

namespace CryptoTracker.Tests.Data;

[TestClass]
public class CryptoFacilitiesTests
{
    //Mock<ICryptoFacilitiesData> _cryptoFacilitiesData;
    CryptoFacilitiesData _cryptoFacilitiesData;
    [TestInitialize]
    public void Setup()
    {
        //Mock<ICryptoFacilitiesData> _cryptoFacilitiesDat
        _cryptoFacilitiesData = new CryptoFacilitiesData();
    }

    [TestMethod]
    public async Task GetOHLCPairsTest()
    {
        var nullPairs = await _cryptoFacilitiesData.GetOHLCPairs("x", DateTimeOffset.UtcNow);
        var pairs = await _cryptoFacilitiesData.GetOHLCPairs("btc", DateTimeOffset.UtcNow.AddDays(-1));
        
        // verify that a non-supported model returns an array of 0,  while a supported model does not
        Assert.AreEqual(nullPairs.Count, 0);
        Assert.AreNotEqual(pairs.Count, 0);
    }
}
