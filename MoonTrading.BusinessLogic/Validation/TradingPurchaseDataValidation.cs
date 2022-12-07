using static SharedConstants.Constants;

namespace MoonTrading.BusinessLogic.Validation;

public static class TradingPurchaseDataValidation
{
    public static bool TryValidatePurchase(string userId
                                         , int coinId
                                         , int purchaseCurrencyId
                                         , double quanitity
                                         , double purchasePrice
                                         , DateTime? purchaseDate)
    {
        if (string.IsNullOrWhiteSpace(userId))
        {
            throw new Exception(InvalidUserId);
        }

        if (coinId <= 0 || purchaseCurrencyId <= 0)
        {
            throw new Exception(InvalidCoinId);
        }

        if (quanitity <= 0.00)
        {
            throw new Exception(InvalidQuantity);
        }

        if (purchasePrice <= 0.00)
        {
            throw new Exception(InvalidPurchasePrice);
        }

        return true;
    }
    
    public static bool TryValidatePurchase(string userId, double quanitity, double purchasePrice, DateTime? purchaseDate, string purchaseCurrency = "")
    {
        if (string.IsNullOrWhiteSpace(userId))
        {
            throw new Exception(InvalidUserId);
        }

        if (quanitity <= 0.00)
        {
            throw new Exception(InvalidQuantity);
        }

        if (purchasePrice <= 0.00)
        {
            throw new Exception(InvalidPurchasePrice);
        }

        return true;
    }

    public static bool TryValidateSell(string userId, int coinId, double quanitity, double sellPrice, DateTime? purchaseDate)
    {
        if (string.IsNullOrWhiteSpace(userId))
        {
            throw new Exception(InvalidUserId);
        }

        if (coinId <= 0)
        {
            throw new Exception(InvalidCoinId);
        }

        if (quanitity <= 0.00)
        {
            throw new Exception(InvalidQuantity);
        }

        if (sellPrice <= 0.00)
        {
            throw new Exception(InvalidSellPrice);
        }

        return true;
    }

    public static bool TryValidateGetUserTradingHistory(string userId)
    {
        if (string.IsNullOrWhiteSpace(userId))
        {
            throw new Exception(InvalidUserId);
        }

        return false;
    }
}
