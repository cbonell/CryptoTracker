using CryptoTracker.DataAccess.Data;
using CryptoTracker.DataAccess.Data.Interfaces;
using CryptoTracker.DataAccess.DbAccess;
using Moq;
using static SharedConstants.Constants;

namespace CryptoTracker.Tests.DataAccess;

[TestClass]
public class UserWalletDataTests
{
    Mock<ISqlDataAccess> _dataBase;
    UserWalletData userWalletData;

    [TestInitialize]
    public void Setup()
    {
        _dataBase = new Mock<ISqlDataAccess>();
        userWalletData = new(_dataBase.Object);
    }

    [TestMethod]
    public async Task GetUserWallet_InvalidUserId_ExpectException()
    {
        // Arrange             
        Exception? exception = null;

        // Act           
        try
        {
            await userWalletData.GetUserWallet(null);
        }
        catch (Exception e) { exception = e; }

        // Assert
        Assert.IsNotNull(exception);
        Assert.AreEqual(exception.Message, InvalidUserId);
    }

    [TestMethod]
    public async Task GetUserWallet_ValidUserId_ExpectSuccess()
    {
        // Arrange             
        Exception? exception = null;

        // Act           
        try
        {
            await userWalletData.GetUserWallet(TestUser_UserId);
        }
        catch (Exception e) { exception = e; }

        // Assert
        Assert.IsNull(exception);
    }

    [TestMethod]
    public async Task ResetUserWallet_InvalidUserId_ExpectException()
    {
        // Arrange             
        Exception? exception = null;

        // Act           
        try
        {
            await userWalletData.GetUserWallet(null);
        }
        catch (Exception e) { exception = e; }

        // Assert
        Assert.IsNotNull(exception);
        Assert.AreEqual(exception.Message, InvalidUserId);
    }

    [TestMethod]
    public async Task ResetUserWallet_ValidUserId_ExpectSuccess()
    {
        // Arrange             
        Exception? exception = null;

        // Act           
        try
        {
            await userWalletData.ResetUserWallet(TestUser_UserId);
        }
        catch (Exception e) { exception = e; }

        // Assert
        Assert.IsNull(exception);
    }

    [TestMethod]
    public async Task InitializeUserWalletForPaperTrading_InvalidUserId_ExpectException()
    {
        // Arrange             
        Exception? exception = null;

        // Act           
        try
        {
            await userWalletData.InitializeUserWalletForPaperTrading(null);
        }
        catch (Exception e) { exception = e; }

        // Assert
        Assert.IsNotNull(exception);
        Assert.AreEqual(exception.Message, InvalidUserId);
    }

    [TestMethod]
    public async Task InitializeUserWalletForPaperTrading_ValidUserId_ExpectSuccess()
    {
        // Arrange             
        Exception? exception = null;

        // Act           
        try
        {
            await userWalletData.InitializeUserWalletForPaperTrading(InvalidUserId);
        }
        catch (Exception e) { exception = e; }

        // Assert
        Assert.IsNull(exception);
    }
}
