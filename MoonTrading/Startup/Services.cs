using Auth0.AspNetCore.Authentication;
using MoonTrading.Tests.CoinGeckoAccess;
using MoonTrading.Tests.MLModelAccess;
using Hangfire;
using MoonTrading.Tools.Email;
using MoonTrading.DataAccess.Data;

namespace MoonTrading.Startup;

public static class Services
{
    public static void AddServices(this WebApplicationBuilder builder)
    {
        builder.Services.AddRazorPages();
        builder.Services.AddServerSideBlazor();
        builder.Services.AddMemoryCache();


        builder.Services.AddTransient<ISqlDataAccess, SqlDataAccess>();
        builder.Services.AddSingleton<IEmailClient, EmailClient>();
        builder.Services.AddSingleton<IUserData, UserData>();
        builder.Services.AddSingleton<ICurrencyData, CurrencyData>();
        builder.Services.AddSingleton<IUserWalletData, UserWalletData>();
        builder.Services.AddSingleton<ITradingPurchaseData, TradingPurchaseData>();
        builder.Services.AddSingleton<IUserFavoriteCoinData, UserFavoriteCoinData>();
        builder.Services.AddSingleton<ICoinGeckoData, CoinGeckoData>();
        builder.Services.AddSingleton<IMLModelData, MLModelData>();
        builder.Services.AddSingleton<IPriceAlertData, PriceAlertData>();
        builder.Services.AddSingleton<ICryptoFacilitiesData, CryptoFacilitiesData>();
        builder.Services.AddSingleton<ICryptoWatchData, CryptoWatchData>();
        builder.Services.AddSingleton<IMarketOrderData, MarketOrderData>();

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
