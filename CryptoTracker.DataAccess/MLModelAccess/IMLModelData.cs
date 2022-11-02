namespace CryptoTracker.DataAccess.MLModelAccess
{
    public interface IMLModelData
    {
        Task<List<DatePricePairModel>> GetPricePrediction(string coinSymbol);
    }
}