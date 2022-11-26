using MoonTrading.DataAccess.Data;
using Moq;
using Microsoft.Extensions.Configuration;

namespace MoonTrading.Tests.Data;

[TestClass]
public class Auth0AccessTests
{
    Auth0Access _auth0Access;
    Mock<IConfiguration> _mockConfig;

    [TestInitialize]
    public void Setup()
    {
        _mockConfig = new Mock<IConfiguration>();
        _auth0Access = new Auth0Access(_mockConfig.Object);
    }

    [TestMethod]
    [ExpectedException(typeof(ArgumentNullException))]
    public async Task GetUserMetaData_InvalidUserId_ExpectException()
    {
        // Arrange

        // Act
        await _auth0Access.GetUserMetaData(string.Empty);

        // Assert
    }
}
