using CryptoTracker.DataAccess.Data;
using CryptoTracker.DataAccess.Data.Interfaces;
using Tools.Email;

namespace CryptoTracker.DataAccess.Tasks;

public class PriceAlertTasks
{
    IPriceAlertData _priceAlertData;
    ICoinMarketCapData _coinMarketCapData;
    ICurrencyData _currencyData;
    public PriceAlertTasks(IPriceAlertData priceAlertData, ICoinMarketCapData coinMarketCapData, ICurrencyData currencyData)
    {
        _priceAlertData = priceAlertData;
        _coinMarketCapData = coinMarketCapData;
        _currencyData = currencyData;
    }

    public async Task SendPriceAlerts()
    {
        var alerts = await _priceAlertData.GetAlerts();

        foreach(var alert in alerts)
        {
            AlertType alertType = (AlertType)alert.AlertType;
            CurrencyModel currency = await _currencyData.GetCurrencyById(alert.CurrencyId);
            double currentPrice = await _coinMarketCapData.GetPriceConversion(1, currency.CoinMarketCapId, 2781);

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
                EmailClient.SendEmail(subject, body, to);
            }
        }
    }
}
