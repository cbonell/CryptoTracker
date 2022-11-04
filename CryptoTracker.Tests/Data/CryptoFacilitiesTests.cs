using CryptoTracker.DataAccess.Data;

namespace CryptoTracker.Tests.Data;

[TestClass]
public class CryptoFacilitiesTests
{
    CryptoFacilitiesData cryptoFacilitiesData;
    [TestInitialize]
    public void Setup()
    {
        cryptoFacilitiesData = new CryptoFacilitiesData();
    }

    [TestMethod]
    public async Task GetOHLCPairsTestValidInput()
    {
        var pairs = await cryptoFacilitiesData.GetOHLCPairs("xbt", DateTimeOffset.UtcNow.AddDays(-1));
        
        Assert.AreNotEqual(pairs.Count, 0);
    }

    [TestMethod]
    public async Task GetOHLCPairsTestInvalidInput()
    {
        var nullPairs = await cryptoFacilitiesData.GetOHLCPairs("x", DateTimeOffset.UtcNow);
        Assert.AreEqual(nullPairs.Count, 0);
    }
}
