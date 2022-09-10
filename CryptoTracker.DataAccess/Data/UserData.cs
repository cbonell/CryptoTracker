using RestSharp;
using System.Text.Json;
using CryptoTracker.DataAccess.Auth0;
using CryptoTracker.DataAccess.Auth0.Model;
using Newtonsoft.Json;
using CryptoTracker.DataAccess.Data.Interfaces;

namespace CryptoTracker.DataAccess.Data;

public class UserData : DataBase, IUserData
{
    public UserData(ISqlDataAccess db) : base(db) { }

    public Task<IEnumerable<UserModel>> GetUsers() =>
        _db.LoadData<UserModel, dynamic>("dbo.GetUsers", new { });

    public async Task<UserModel> GetUser(int id)
    {
        var results = await _db.LoadData<UserModel, dynamic>(
                "dbo.GetUser",
                new { Id = id });
        return results.FirstOrDefault()!;
    }

    public async Task<UserModel> GetUser(string auth0Id)
    {
        var results = await _db.LoadData<UserModel, dynamic>(
                "dbo.GetUserByAuth0Id",
                new { Auth0Id = auth0Id });
        return results.FirstOrDefault()!;
    }

    public async Task<UserModel> GetUserByAuth0UserId(int id)
    {
        var results = await _db.LoadData<UserModel, dynamic>(
                "dbo.GetUser",
                new { Id = id });
        return results.FirstOrDefault()!;
    }

    public Task CreateUser(UserModel newUser) =>
        _db.SaveData<dynamic>("dbo.CreateUser", new { });

    public Task DeleteUser(int id) =>
        _db.SaveData<dynamic>("dbo.DeleteUser", new { UserId = id });
}
