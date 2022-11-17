using MoonTrading.DataModels.Model;
using MoonTrading.Tests.Data;
using MoonTrading.Tools.Email;

namespace MoonTrading.DataAccess.Data;

public class MarketOrderData : DataBase, IMarketOrderData
{
    public MarketOrderData(ISqlDataAccess db) : base(db) { }

    public async Task<IEnumerable<MarketOrderModel>> GetMarketOrders() => await _db.LoadData<MarketOrderModel, dynamic>("[dbo].[GetMarketOrders]", new { });
    public async Task<IEnumerable<MarketOrderModel>> GetUserMarketOrders(string userId) => await _db.LoadData<MarketOrderModel, dynamic>("[dbo].[GetMarketOrders]", new { UserId = userId });
    public async Task CreateMarketOrder(string userId, string userEmail, string coinGeckoId, double purchasePrice, double quantity, int orderType) =>
        await _db.SaveData<dynamic>("[dbo].[CreateMarketOrder]", new { UserId = userId, UserEmail = userEmail, CoinGeckoId = coinGeckoId, AlertPrice = purchasePrice, Quantity = quantity, OrderType = orderType});
    public async Task DeleteMarketOrder(int id) => await _db.SaveData<dynamic>("[dbo].[DeleteMarketOrder]", new { Id = id });
}