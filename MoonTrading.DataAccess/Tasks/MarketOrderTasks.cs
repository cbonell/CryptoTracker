using MoonTrading.DataAccess.Data.Interfaces;
using MoonTrading.Tools.Email;

namespace MoonTrading.DataAccess.Tasks;

public class MarketOrderTasks
{
    readonly IMarketOrderData _marketOrderData;
    readonly ICryptoWatchData _cryptoWatchData;
    readonly ITradingPurchaseData _tradingData;
    readonly IEmailClient _emailClient;

    public MarketOrderTasks(IMarketOrderData marketOrderData, ICryptoWatchData cryptoWatchData, ITradingPurchaseData tradingData, IEmailClient emailClient)
    {
        _marketOrderData = marketOrderData;
        _cryptoWatchData = cryptoWatchData;
        _tradingData = tradingData;
        _emailClient = emailClient;
    }

    /// <summary>
    /// Executes all live market orders that meet predefined criteria
    /// </summary>
    /// <returns></returns>
    public async Task ExecuteMarketOrders()
    {
        foreach (var order in await _marketOrderData.GetMarketOrders())
        {
            double currentPrice = await _cryptoWatchData.GetPrice(order.Symbol);


            if(order.OrderType == 0) // buy
            {
                if(order.PurchasePrice <= currentPrice)
                {
                    await _tradingData.Purchase(order.UserId, new CoinGeckCoinModel() { Id = order.CoinGeckoId }, order.Quantity, currentPrice, DateTime.Now);
                    _emailClient.SendEmail("Stop Market Fulfilled", $"Stop market order has been executed for {order.Symbol} at {currentPrice} on {DateTime.Now}", order.UserEmail);
                    await _marketOrderData.DeleteMarketOrder(int.Parse(order.Id));
                }
            }
            else if(order.OrderType == 1) // sell
            {
                if(order.PurchasePrice >= currentPrice)
                {
                    await _tradingData.Sell(order.UserId, new CoinGeckCoinModel() { Id = order.CoinGeckoId }, order.Quantity, currentPrice, DateTime.Now);
                    _emailClient.SendEmail("Stop Loss Fulfilled", $"Stop loss order has been executed for {order.Symbol} at {currentPrice} on {DateTime.Now}", order.UserEmail);
                    await _marketOrderData.DeleteMarketOrder(int.Parse(order.Id));
                }
            }
        }
    }
}
