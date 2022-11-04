using CryptoTracker.DataAccess.Data.Interfaces;

using CryptoTracker.DataAccess.MLModelAccess;
using CryptoTracker.DataAccess.Model;
using Moq;

namespace CryptoTracker.Tests.Data;

[TestClass]
public class MLModelDataTests
{
    Mock<ICryptoFacilitiesData> _cryptoFacilitiesData;
    [TestInitialize]
    public void Setup()
    {
        _cryptoFacilitiesData = new Mock<ICryptoFacilitiesData>();
    }

    [TestMethod]
    public async Task GetPricePredictionTest()
    {
        List<OHLCPairModel> returned = new List<OHLCPairModel>();
        _cryptoFacilitiesData.Setup(
            a => a.GetOHLCPairs("btc", DateTimeOffset.UtcNow.AddDays(-7), "1h", null))
            .ReturnsAsync(returned);

        Random rnd = new Random();

        for (int i = 0; i < 168; i++)
        {
            int val = rnd.Next(20000, 60000);
            returned.Add(new OHLCPairModel
            {
                TimeStamp = DateTime.Now.AddHours(-1 * (168 - i + 1)),
                Open = val,
                High = val + 1000,
                Low = val - 1000,
                Close = val + rnd.Next(-1000, 1000),
            });
        }

        _cryptoFacilitiesData.Setup(
            a => a.GetOHLCPairs("btc", DateTimeOffset.UtcNow.AddDays(-7), "1h", null))
            .ReturnsAsync(returned);

        var mlModelData = new MLModelData();

        string notSupported = "x";
        string supported = "btc";

        List<DatePricePairModel> notSupportedPairs = await mlModelData.GetPricePrediction(notSupported);
        List<DatePricePairModel> supportedPairs = await mlModelData.GetPricePrediction(supported);
        
        
        // Test models that are supported and not supported
        Assert.IsNotNull(notSupportedPairs);
        Assert.IsNotNull(supportedPairs);
    }

    [TestMethod]
    public void MinMaxNormalizeTest()
    {
        var mlModelData = new MLModelData();

        List<OHLCPairModel> OHLC = new List<OHLCPairModel>();

        OHLCPairModel btcTuple1 = new OHLCPairModel();
        btcTuple1.TimeStamp = DateTime.Now;
        btcTuple1.Close = 50000.0;
        btcTuple1.Low = btcTuple1.Close - 1000;
        btcTuple1.High = btcTuple1.Close + 1000;


        OHLCPairModel btcTuple2 = new OHLCPairModel();
        btcTuple2.TimeStamp = DateTime.Now;
        btcTuple2.Close = 25000.0;
        btcTuple2.Low = btcTuple2.Close - 1000;
        btcTuple2.High = btcTuple2.Close + 1000;

        OHLCPairModel btcTuple3 = new OHLCPairModel();
        btcTuple3.TimeStamp = DateTime.Now;
        btcTuple3.Close = 40000.0;
        btcTuple3.Low = btcTuple3.Close - 1000;
        btcTuple3.High = btcTuple3.Close + 1000;

        OHLC.Add(btcTuple1);
        OHLC.Add(btcTuple2);
        OHLC.Add(btcTuple3);

        List<OHLCPairModel> normalized = mlModelData.MinMaxNormalize(OHLC, "btc", mlModelData.normalizationValues);

        Random rnd = new Random();
        int index = rnd.Next(0, 3);

        // Check that MinMax Normalized price values were converted to values between 0 and 1
        Assert.IsTrue(normalized[index].High <= 1.0);
        Assert.IsTrue(normalized[index].Low <= 1.0);
        Assert.IsTrue(normalized[index].Close <= 1.0);
        Assert.IsTrue(normalized[index].High >= 0.0);
        Assert.IsTrue(normalized[index].Low >= 0.0);
        Assert.IsTrue(normalized[index].Close >= 0.0);
    }

    [TestMethod]
    public void TensorizeTest()
    {
        var mlModelData = new MLModelData();
        List<OHLCPairModel> OHLC = new List<OHLCPairModel>();

        OHLCPairModel btcTuple1 = new OHLCPairModel();
        btcTuple1.TimeStamp = DateTime.Now;
        btcTuple1.Close = 50000.0;
        btcTuple1.Low = btcTuple1.Close - 1000;
        btcTuple1.High = btcTuple1.Close + 1000;


        OHLCPairModel btcTuple2 = new OHLCPairModel();
        btcTuple2.TimeStamp = DateTime.Now;
        btcTuple2.Close = 25000.0;
        btcTuple2.Low = btcTuple2.Close - 1000;
        btcTuple2.High = btcTuple2.Close + 1000;

        OHLCPairModel btcTuple3 = new OHLCPairModel();
        btcTuple3.TimeStamp = DateTime.Now;
        btcTuple3.Close = 40000.0;
        btcTuple3.Low = btcTuple3.Close - 1000;
        btcTuple3.High = btcTuple3.Close + 1000;

        OHLCPairModel btcTuple4 = new OHLCPairModel();
        btcTuple3.TimeStamp = DateTime.Now;
        btcTuple3.Close = 30000.0;
        btcTuple3.Low = btcTuple3.Close - 1000;
        btcTuple3.High = btcTuple3.Close + 1000;

        OHLC.Add(btcTuple1);
        OHLC.Add(btcTuple2);
        OHLC.Add(btcTuple3);
        OHLC.Add(btcTuple4);

        List<List<List<double>>> tensors = mlModelData.Tensorize(OHLC);

        // Verify that dimensions of the data 1 x tuples x 3 (#Features ={high, low, close})
        Assert.AreEqual(tensors.Count, 1);
        Assert.AreEqual(tensors[0].Count, 4);
        Assert.AreEqual(tensors[0][0].Count, 3);
    }

    [TestMethod]
    public void convertTODPPMTest()
    {

    }
}
