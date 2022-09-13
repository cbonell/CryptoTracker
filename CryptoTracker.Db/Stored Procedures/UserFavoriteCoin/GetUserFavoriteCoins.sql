CREATE PROCEDURE [dbo].[GetUserFavoriteCoins]
	@UserId VARCHAR(255)
AS
	SELECT
		ufc.*,
		c.CoinMarketCapId,
		c.Id CurrencyId,
		c.[Name] CoinName
	FROM
		UserFavoriteCoin ufc
		INNER JOIN Currency c ON c.Id = ufc.CurrencyId
	WHERE
		ufc.UserId = @UserId
RETURN 0
