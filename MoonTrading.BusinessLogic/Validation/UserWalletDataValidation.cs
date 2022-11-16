namespace MoonTrading.BusinessLogic.Validation;
using static SharedConstants.Constants;

public class UserWalletDataValidation
{
    public static bool IsValidUser(string userId) => !string.IsNullOrWhiteSpace(userId);
}
