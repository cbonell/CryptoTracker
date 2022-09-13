using Auth0.AspNetCore.Authentication;
using CryptoTracker.DataAccess.Data.Interfaces;

namespace CryptoTracker.Web.Startup;

public static class Services
{
    public static void AddServices(this WebApplicationBuilder builder)
    {
        builder.Services.AddRazorPages();
        builder.Services.AddServerSideBlazor();

        builder.Services.AddTransient<ISqlDataAccess, SqlDataAccess>();
        builder.Services.AddSingleton<IUserData, UserData>();
        builder.Services.AddSingleton<ICurrencyData, CurrencyData>();
        builder.Services.AddSingleton<IUserWalletData, UserWalletData>();
        builder.Services.AddSingleton<ITradingPurchaseData, TradingPurchaseData>();
        builder.Services.AddSingleton<IUserFavoriteCoinData, UserFavoriteCoinData>();

        builder.Services
    .AddAuth0WebAppAuthentication(options =>
    {
        options.Domain = builder.Configuration["Auth0:Domain"];
        options.ClientId = builder.Configuration["Auth0:ClientId"];
    });
    }
}
