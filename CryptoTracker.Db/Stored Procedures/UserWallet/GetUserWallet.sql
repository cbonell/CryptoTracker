CREATE PROCEDURE [dbo].[GetUserWallet]
	@UserId VARCHAR(255)
AS
	SELECT
		uw.*,
		c.CurrencyTypeId,
		c.[Name] CurrencyName,
		c.Symbol,
		c.[Sign],
		c.CoinMarketCapId
	FROM
		UserWallet uw
		INNER JOIN Currency c ON c.Id = uw.CurrencyId
		INNER JOIN CurrencyType ct ON ct.Id = c.CurrencyTypeId
	WHERE
		UserId = @UserId
RETURN 0
