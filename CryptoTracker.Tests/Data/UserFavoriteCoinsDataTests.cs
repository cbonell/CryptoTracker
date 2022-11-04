using CryptoTracker.DataAccess.Data;
using CryptoTracker.DataAccess.Data.Interfaces;
using CryptoTracker.DataAccess.DbAccess;
using Moq;
using static SharedConstants.Constants;

namespace CryptoTracker.Tests.DataAccess;

[TestClass]
public class UserFavoriteCoinsDataTests
{
    Mock<ISqlDataAccess> _dataBase;
    UserFavoriteCoinData userFavoriteCoinData;

    [TestInitialize]
    public void Setup()
    {
        _dataBase = new Mock<ISqlDataAccess>();
        userFavoriteCoinData = new(_dataBase.Object);
    }

    [TestMethod]
    public async Task GetUserFavoriteCoins_NullUserId_ExpectException()
    {
        // Arrange             
        Exception exception = null;

        // Act           
        try
        {
            await userFavoriteCoinData.GetUserFavoriteCoins(null);
        }
        catch (Exception e) { exception = e; }

        // Assert
        Assert.IsNotNull(exception);
        Assert.AreEqual(exception.Message, InvalidUserId);
    }

    [TestMethod]
    public async Task GetUserFavoriteCoins_EmptyUserId_ExpectException()
    {
        // Arrange 
        Exception? exception = null;

        // Act           
        try
        {
            await userFavoriteCoinData.GetUserFavoriteCoins(string.Empty);
        }
        catch (Exception e) { exception = e; }

        // Assert
        Assert.IsNotNull(exception);
        Assert.AreEqual(exception.Message, InvalidUserId);
    }

    [TestMethod]
    public async Task GetUserFavoriteCoins_ValidUserId_ExpectSuccess()
    {
        // Arrange 
        Exception? exception = null;

        // Act           
        try
        {
            var a = await userFavoriteCoinData.GetUserFavoriteCoins(TestUser_UserId);
        }
        catch (Exception e) { exception = e; }

        // Assert
        Assert.IsNull(exception);
    }

    [TestMethod]
    public async Task AddUserFavoriteCoins_ValidUserId_ExpectSuccess()
    {
        // Arrange 
        Exception? exception = null;

        // Act           
        try
        {
            await userFavoriteCoinData.AddUserFavoriteCoin(TestUser_UserId, "bitcoin");
        }
        catch (Exception e) { exception = e; }

        // Assert
        Assert.IsNull(exception);
    }

    [TestMethod]
    public async Task AddUserFavoriteCoins_NullUserId_ExpectException()
    {
        // Arrange 
        Exception? exception = null;

        // Act           
        try
        {
            await userFavoriteCoinData.AddUserFavoriteCoin(null, "");
        }
        catch (Exception e) { exception = e; }

        // Assert
        Assert.IsNotNull(exception);
        Assert.AreEqual(exception.Message, InvalidUserId);
    }

    [TestMethod]
    public async Task AddUserFavoriteCoins_InvlaidCoinId_ExpectException()
    {
        // Arrange 
        Exception? exception = null;

        // Act           
        try
        {
            await userFavoriteCoinData.AddUserFavoriteCoin(TestUser_UserId, "");
        }
        catch (Exception e) { exception = e; }

        // Assert
        Assert.IsNotNull(exception);
        Assert.AreEqual(exception.Message, InvalidCoinId);
    }
}