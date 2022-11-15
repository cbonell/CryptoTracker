CREATE PROCEDURE [dbo].[GetUserWallet]
	@UserId VARCHAR(255)
AS
	SELECT
		uw.*,
		c.[Name] CurrencyName,
		c.Symbol,
		c.Symbol,
		c.CoinMarketCapId
	FROM
		UserWallet uw
		INNER JOIN CoinGeckoCoin c ON c.Id = uw.CoinGeckoId
	WHERE
		UserId = @UserId
RETURN 0
