namespace MoonTrading.BusinessLogic.Validation;

public class Auth0DataValidation
{    
    public static bool ValidateAuth0UserId(string userId)
    {
        return !string.IsNullOrWhiteSpace(userId);
    }
}
