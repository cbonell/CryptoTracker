using CryptoTracker.DataAccess.CryptoFacilitiesDataAccess;
using CryptoTracker.DataAccess.Data.Interfaces;
using CryptoTracker.DataAccess.MLModelAccess;
using CryptoTracker.DataAccess.Model;
using Moq;
using Newtonsoft.Json.Linq;
using RestSharp;

namespace CryptoTracker.Tests.Data;

[TestClass]
public class CryptoFacilitiesTests
{
    [TestMethod]
    public async Task GetOHLCPairsTest()
    {
        var cryptoFacilitiesDataAccess = new CryptoFacilitiesData();        

        var nullPairs = await cryptoFacilitiesDataAccess.GetOHLCPairs("x");
        var pairs = await cryptoFacilitiesDataAccess.GetOHLCPairs("btc");
        
        // verify that a non-supported model returns an array of 0,  while a supported model does not
        Assert.AreEqual(nullPairs.Count, 0);
        Assert.AreNotEqual(pairs.Count, 0);
    }
}
