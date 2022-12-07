using MoonTrading.Tests.Tasks;
using MoonTrading.Startup;
using Hangfire;
using HangfireBasicAuthenticationFilter;
using MoonTrading.DataAccess.Tasks;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.AddServices();

var app = builder.Build();

app.UseHangfireDashboard("/AutomatedTasks", new DashboardOptions()
{
    AppPath = null,
    DashboardTitle = "Automated Tasks Dashboard",
    Authorization = new[]{
                new HangfireCustomBasicAuthenticationFilter{
                    User = builder.Configuration.GetSection("HangfireCredentials:UserName").Value,
                    Pass = builder.Configuration.GetSection("HangfireCredentials:Password").Value
                }
            },
});

// cron exprssion checker https://crontab.cronhub.io/
string cronExp = "*/10 * * * *"; // Every 10 minutes
RecurringJob.AddOrUpdate<PriceAlertTasks>("1", x => x.SendPriceAlerts(), cronExp, TimeZoneInfo.Local);

cronExp = "*/5 * * * *"; // Every 5 minutes
RecurringJob.AddOrUpdate<MarketOrderTasks>("2", x => x.ExecuteMarketOrders(), cronExp, TimeZoneInfo.Local);

app.UseHttpsRedirection();

app.UseStaticFiles();

app.UseRouting();
app.UseAuthentication();
app.UseAuthorization();

app.MapBlazorHub();
app.MapFallbackToPage("/_Host");

app.Run();
