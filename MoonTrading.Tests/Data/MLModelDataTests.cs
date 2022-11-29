using MoonTrading.DataAccess.Data.Interfaces;

using MoonTrading.DataAccess.MLModelAccess;
using MoonTrading.Model;
using Moq;

namespace MoonTrading.DataAccess.Data;

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
    public async Task GetPricePredictionTestSupportedCoins()
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

        string supported = "btc";

        List<DatePricePairModel> supportedPairs = await mlModelData.GetPricePrediction(supported);
        
        Assert.IsNotNull(supportedPairs);
    }

    [TestMethod]
    public async Task GetPricePredictionTestUnsupportedCoins()
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

        List<DatePricePairModel> notSupportedPairs = await mlModelData.GetPricePrediction(notSupported);

        Assert.IsNotNull(notSupportedPairs);
        Assert.AreEqual(notSupportedPairs.Count(), 0);
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

        // Verify that dimensions of the data 1 x tuples x #Features(18))
        Assert.AreEqual(tensors.Count, 1);
        Assert.AreEqual(tensors[0].Count, 4);
        Assert.AreEqual(tensors[0][0].Count, 18);
    }

    [TestMethod]
    public void ConvertLogitsToProbabilitiesTest()
    {
        var mlModelData = new MLModelData();
        double[] logits = { -0.57095057, 0.165661201, 0.696 };
        double[] expectedProbabilities = { 0.15062834871739389, 0.3146394270482894, 0.53473222423431666 };
        logits = mlModelData.ConvertLogitsToProbabilities(logits);
        Assert.AreEqual(expectedProbabilities.Length, logits.Length);
        CollectionAssert.AreEqual(expectedProbabilities, logits);
    }

    [TestMethod]
    public void GetPredictedClassTest()
    {
        var mlModelData = new MLModelData();
        double[] probabilities = { 0.15062834871739389, 0.3146394270482894, 0.53473222423431666 };
        var predictedClass = mlModelData.GetPredictedClass(probabilities);
        Assert.AreEqual(predictedClass, 2);
    }

    [TestMethod]
    public void RemoveExtraTuplesTest()
    {
        List<OHLCPairModel> OHLC = new List<OHLCPairModel>();
        OHLCPairModel btcTuple1;

        for (int i = 0; i < 336; i++)
        {
            btcTuple1 = new OHLCPairModel();
            btcTuple1.TimeStamp = DateTime.Now;
            btcTuple1.Close = 50000.0;
            btcTuple1.Low = btcTuple1.Close - 1000;
            btcTuple1.High = btcTuple1.Close + 1000;
            OHLC.Add(btcTuple1);
        }

        int originalHalfLength = OHLC.Count() / 2;
        OHLC = MLModelData.RemoveExtraTuples(OHLC);
        Assert.AreEqual(OHLC.Count(), originalHalfLength);
    }

    [TestMethod]
    public void Calculate7dAndIncreasedFeaturesTest()
    {
        List<OHLCPairModel> OHLC = new();
        OHLCPairModel tuple;

        for (int i = 0; i < 4; i++)
        {
            tuple = new OHLCPairModel();
            tuple.Open = i + 1;
            tuple.High = i + 1;
            tuple.Low = i + 1;
            tuple.Close = i + 1;
            OHLC.Add(tuple);
        }

        OHLC = MLModelData.Calculate7dAndIncreasedFeatures(OHLC);
        Assert.AreEqual(OHLC[3].Open7dAvg, 2.5);
        Assert.AreEqual(OHLC[3].Open7dIncrease, 1);
        Assert.AreEqual(OHLC[3].OpenIncrease, 1.0/3);
    }

    [TestMethod]
    public void CalculateStdDevsTest()
    {
        List<OHLCPairModel> OHLC = new();
        OHLCPairModel tuple;

        for (int i = 0; i < 4; i++)
        {
            tuple = new OHLCPairModel();
            tuple.Open = i + 10;
            tuple.High = i + 20;
            tuple.Low = i + 30;
            tuple.Close = i + 40;
            OHLC.Add(tuple);
        }

        OHLC = MLModelData.calculateStdDevs(OHLC);
        Assert.AreEqual(OHLC[3].RowStdev, 11.180339887498949);
        Assert.AreEqual(OHLC[3].Close7dStdev, .5);
    }
}
