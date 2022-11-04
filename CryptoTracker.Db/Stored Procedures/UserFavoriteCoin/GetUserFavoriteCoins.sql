CREATE PROCEDURE [dbo].[GetUserFavoriteCoins]
	@UserId VARCHAR(255)
AS
	SELECT
		ufc.*,
		c.CoinMarketCapId,
		c.Id CurrencyId,
		c.[Name] [Name]
	FROM
		UserFavoriteCoin ufc
		INNER JOIN CoinGeckoCoin c ON c.Id = ufc.CoinGeckoId
	WHERE
		ufc.UserId = @UserId
RETURN 0
