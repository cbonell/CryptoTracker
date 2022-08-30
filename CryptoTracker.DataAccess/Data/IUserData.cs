﻿namespace CryptoTracker.DataAccess.Data
{
    public interface IUserData
    {
        Task CreateUser(UserModel newUser);
        Task DeleteUser(int id);
        Task<UserModel> GetUser(int id);
        Task<IEnumerable<UserModel>> GetUsers();
    }
}