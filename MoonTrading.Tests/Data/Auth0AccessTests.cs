using MoonTrading.DataAccess.Data;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoonTrading.Tests.Data;

[TestClass]
public class Auth0AccessTests
{
    [TestMethod]
    [ExpectedException(typeof(ArgumentNullException))]
    public async Task GetUserMetaData_InvalidUserId_ExpectException()
    {
        // Arrange

        // Act
        await Auth0Access.GetUserMetaData(string.Empty);

        // Assert
    }
}
