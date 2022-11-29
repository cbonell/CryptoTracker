using Microsoft.Extensions.Configuration;
using MoonTrading.DataAccess.Data;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoonTrading.Tests.Data;

[TestClass]
public class TwitterSearchTests
{
    TwitterSearch _twitterSearchMock;
    Mock<IConfiguration> _mockConfig;

    [TestInitialize]
    public void Setup()
    {
        _mockConfig = new Mock<IConfiguration>();
        _twitterSearchMock = new TwitterSearch(_mockConfig.Object);
    }

    [TestMethod]
    [ExpectedException(typeof(ArgumentNullException))]
    public async Task TwitterSearch_InvaidHashTag_ExpectException()
    {
        // Arrange

        // Act
        await _twitterSearchMock.GetTrendingByHashTag(string.Empty);

        // Assert
    }
}
