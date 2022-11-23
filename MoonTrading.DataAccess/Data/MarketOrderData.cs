using MoonTrading.DataAccess.Data.Interfaces;

namespace MoonTrading.DataAccess.Data;

public class MarketOrderData : DataBase, IMarketOrderData
{
    public MarketOrderData(ISqlDataAccess db) : base(db) { }

    /// <summary>
    /// Get all open market orders
    /// </summary>
    /// <returns><see cref="MarketOrderModel"/></returns>
    public async Task<IEnumerable<MarketOrderModel>> GetMarketOrders() => await _db.LoadData<MarketOrderModel, dynamic>("[dbo].[GetMarketOrders]", new { });

    /// <summary>
    /// Get all market orders for a specific user
    /// </summary>
    /// <param name="userId"></param>
    /// <returns>IEnumerable<MarketOrderModel></returns>
    public async Task<IEnumerable<MarketOrderModel>> GetUserMarketOrders(string userId) => await _db.LoadData<MarketOrderModel, dynamic>("[dbo].[GetMarketOrders]", new { UserId = userId });
    
    /// <summary>
    /// Create a new market order for a specific user
    /// </summary>
    /// <param name="userId"></param>
    /// <param name="userEmail"></param>
    /// <param name="coinGeckoId"></param>
    /// <param name="purchasePrice"></param>
    /// <param name="quantity"></param>
    /// <param name="orderType"></param>
    /// <returns></returns>
    public async Task CreateMarketOrder(string userId, string userEmail, string coinGeckoId, double purchasePrice, double quantity, int orderType) =>
        await _db.SaveData<dynamic>("[dbo].[CreateMarketOrder]", new { UserId = userId, UserEmail = userEmail, CoinGeckoId = coinGeckoId, AlertPrice = purchasePrice, Quantity = quantity, OrderType = orderType});
    
    /// <summary>
    /// Deletes a specific Market Order by Id
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public async Task DeleteMarketOrder(int id) => await _db.SaveData<dynamic>("[dbo].[DeleteMarketOrder]", new { Id = id });
}