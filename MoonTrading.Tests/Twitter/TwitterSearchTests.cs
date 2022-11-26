using MoonTrading.DataAccess.Data;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoonTrading.Tests.Twitter;

[TestClass]
public class TwitterSearchTests
{
    [TestMethod]
    [ExpectedException(typeof(ArgumentNullException))]
    public async Task TwitterSearch_InvaidHashTag_ExpectException()
    {
        // Arrange

        // Act
        await TwitterSearch.GetTrendingByHashTag(String.Empty);

        // Assert
    }
}
