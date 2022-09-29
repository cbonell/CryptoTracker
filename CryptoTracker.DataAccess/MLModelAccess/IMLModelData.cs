namespace CryptoTracker.DataAccess.MLModelAccess
{
    public interface IMLModelData
    {
        Task<double> GetPricePrediction();
    }
}