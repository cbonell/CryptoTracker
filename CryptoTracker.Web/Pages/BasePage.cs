using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Authorization;
using System.Security.Claims;

namespace CryptoTracker.Web.Pages;

public class BasePage : ComponentBase
{
    [Inject]
    AuthenticationStateProvider AuthState { get; set; }

    public string UserId { get; private set; } = "";
    public bool IsAuthenticated { get; private set; } = false;

    protected override async Task OnInitializedAsync()
    {
        var state = await AuthState.GetAuthenticationStateAsync();
        if (state != null && state.User != null && state.User.Identity != null)
        {
            if (state.User.Identity.IsAuthenticated)
            {
                IsAuthenticated = true;
                var tempUserClaim = state.User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.NameIdentifier);
                if (tempUserClaim != null)
                {
                    UserId = tempUserClaim.Value;
                }
            }
        }
    }
}
