using Auth0.AspNetCore.Authentication;
using CryptoTracker.DataAccess.CoinGeckoAccess;
using CryptoTracker.DataAccess.MLModelAccess;
using Hangfire;

namespace CryptoTracker.Web.Startup;

public static class Services
{
    public static void AddServices(this WebApplicationBuilder builder)
    {
        builder.Services.AddRazorPages();
        builder.Services.AddServerSideBlazor();
        builder.Services.AddMemoryCache();


        builder.Services.AddTransient<ISqlDataAccess, SqlDataAccess>();
        builder.Services.AddSingleton<IUserData, UserData>();
        builder.Services.AddSingleton<ICurrencyData, CurrencyData>();
        builder.Services.AddSingleton<IUserWalletData, UserWalletData>();
        builder.Services.AddSingleton<ITradingPurchaseData, TradingPurchaseData>();
        builder.Services.AddSingleton<IUserFavoriteCoinData, UserFavoriteCoinData>();
        builder.Services.AddSingleton<ICoinMarketCapData, CoinMarketCapData>();
        builder.Services.AddSingleton<ICoinGeckoData, CoinGeckoData>();
        builder.Services.AddSingleton<IMLModelData, MLModelData>();
        builder.Services.AddSingleton<IPriceAlertData, PriceAlertData>();
        builder.Services.AddSingleton<ICryptoFacilitiesData, CryptoFacilitiesData>();

        builder.Services
    .AddAuth0WebAppAuthentication(options =>
    {
        options.Domain = builder.Configuration["Auth0:Domain"];
        options.ClientId = builder.Configuration["Auth0:ClientId"];
    });

        // Hangfire task scheduler
        builder.Services.AddHangfire(x => x.UseSqlServerStorage(builder.Configuration.GetConnectionString("Default")));
        builder.Services.AddHangfireServer();
    }
}
