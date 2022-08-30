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

    public Task CreateUser(UserModel newUser) =>
        _db.SaveData<dynamic>("dbo.CreateUser", new { FirstName = newUser.FirstName, LastName = newUser.LastName });

    public Task DeleteUser(int id) =>
        _db.SaveData<dynamic>("dbo.DeleteUser", new { UserId = id });
}
