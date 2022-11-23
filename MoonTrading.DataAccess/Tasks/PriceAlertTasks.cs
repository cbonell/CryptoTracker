using MoonTrading.DataAccess.Data;
using MoonTrading.DataAccess.Data.Interfaces;
using MoonTrading.Tools.Email;

namespace MoonTrading.Tests.Tasks;

public class PriceAlertTasks
{
    IPriceAlertData _priceAlertData;
    ICoinGeckoData _coinGeckoData;
    IEmailClient _emailClient;

    public PriceAlertTasks(IPriceAlertData priceAlertData, ICoinGeckoData coinGeckoData, IEmailClient emailClient)
    {
        _priceAlertData = priceAlertData;
        _coinGeckoData = coinGeckoData;
        _emailClient = emailClient;
    }

    /// <summary>
    /// Send all live alerts that meet predefined criteria
    /// </summary>
    /// <returns></returns>
    public async Task SendPriceAlerts()
    {
        var alerts = await _priceAlertData.GetAlerts();

        foreach(var alert in alerts)
        {
            AlertType alertType = (AlertType)alert.AlertType;
            CoinGeckCoinModel currency = await _coinGeckoData.GetMetaData(alert.CoinGeckoId);
            double currentPrice = await _coinGeckoData.GetPriceInUsd(currency.Id);

            bool sendAlert = false;
            if(alertType == AlertType.Below)
            {
                if(currentPrice < alert.AlertPrice)
                {
                    sendAlert = true;
                }
            }
            else if(alertType == AlertType.Above)
            {
                if (currentPrice > alert.AlertPrice)
                {
                    sendAlert = true;
                }
            }

            if(sendAlert)
            {
                string subject = String.Format("Moon Trading Exchange Price Alert for {0}", currency.Name);
                string body = String.Format("{0} {1} your alert price of ${2} and the current price is ${3}"
                                             , currency.Name
                                             , alertType == AlertType.Above ? "went above" : "dropped below"
                                             , alert.AlertPrice.ToString("0.0000")
                                             , currentPrice.ToString("0.0000"));
                string to = alert.email;
                _emailClient.SendEmail(subject, body, to);
                await _priceAlertData.DeletePriceAlert(alert.Id);
            }
        }
    }
}
