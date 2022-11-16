using MoonTrading.Tests.Data;
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
    public async Task TwitterSearch_InvaidCoinName_ExpectException()
    {
        // Arrange
        Exception? exception = null;

        // Act
        try
        {
            await TwitterSearch.GetTrendingByHashTag("!@!#!@#$@!#");
        }
        catch(ArgumentNullException e) { exception = e; }

        // Assert
        Assert.IsNotNull(exception);
    }
}
