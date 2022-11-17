using MoonTrading.DataModels.Model;

namespace MoonTrading.DataAccess.Data
{
    public interface IMarketOrderData
    {
        Task CreateMarketOrder(string userId, string userEmail, string coinGeckoId, double purchasePrice, double quantity, int orderType);
        Task DeleteMarketOrder(int id);
        Task<IEnumerable<MarketOrderModel>> GetMarketOrders();
        Task<IEnumerable<MarketOrderModel>> GetUserMarketOrders(string userId);
    }
}