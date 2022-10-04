using CryptoTracker.DataAccess.Tasks;
using CryptoTracker.Web.Startup;
using Hangfire;
using HangfireBasicAuthenticationFilter;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.AddServices();

var app = builder.Build();

// Configure the HTTP request pipeline.
//if (!app.Environment.IsDevelopment())
//{
//    app.UseExceptionHandler("/Error");
//    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
//    app.UseHsts();
//}
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
string cronExp = "*/5 * * * *"; // Every 5 minutes
RecurringJob.AddOrUpdate<PriceAlertTasks>("1", x => x.SendPriceAlerts(), cronExp, TimeZoneInfo.Local);

app.UseHttpsRedirection();

app.UseStaticFiles();

app.UseRouting();
app.UseAuthentication();
app.UseAuthorization();

app.MapBlazorHub();
app.MapFallbackToPage("/_Host");

app.Run();
