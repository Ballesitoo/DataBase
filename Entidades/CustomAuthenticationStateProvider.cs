using Blazored.LocalStorage;
using Microsoft.AspNetCore.Components.Authorization;
using System.Security.Claims;

public class CustomAuthenticationStateProvider : AuthenticationStateProvider
{
    private readonly ILocalStorageService _localStorage;
    private ClaimsPrincipal _anonymous => new(new ClaimsIdentity());

    public CustomAuthenticationStateProvider(ILocalStorageService localStorage)
    {
        _localStorage = localStorage;
    }

    public override async Task<AuthenticationState> GetAuthenticationStateAsync()
    {
        string userName = null;

        try
        {
            userName = await _localStorage.GetItemAsync<string>("authUser");
            Console.WriteLine($"Nombre de usuario: {userName}");
        }
        catch
        {
            // Si LocalStorage aún no está disponible o la clave no existe, no hacemos nada
        }

        ClaimsIdentity identity;

        if (!string.IsNullOrEmpty(userName))
        {
            identity = new ClaimsIdentity(new[]
            {
                new Claim(ClaimTypes.Name, userName)
            }, "apiauth_type");
        }
        else
        {
            identity = new ClaimsIdentity(); // usuario anónimo
        }

        var user = new ClaimsPrincipal(identity);
        return await Task.FromResult(new AuthenticationState(user));
    }


    public void MarkUserAsAuthenticated(string userName)
    {
        var identity = new ClaimsIdentity(new[]
        {
            new Claim(ClaimTypes.Name, userName)
        }, "apiauth_type");

        var user = new ClaimsPrincipal(identity);

        NotifyAuthenticationStateChanged(Task.FromResult(new AuthenticationState(user)));
    }


    public async void MarkUserAsLoggedOut()
    {
        await _localStorage.RemoveItemAsync("authUser");
        NotifyAuthenticationStateChanged(Task.FromResult(new AuthenticationState(_anonymous)));
    }
}