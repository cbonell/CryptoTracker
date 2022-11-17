CREATE PROCEDURE [dbo].[GetMarketOrders]
	@UserId VARCHAR(255) = ''
AS
	SELECT
		mo.*,
		cgc.[Symbol],
		cgc.[Name],
		cgc.[CoinMarketCapId]
	FROM
		MarketOrder mo
		INNER JOIN CoinGeckoCoin cgc ON cgc.Id = mo.CoinGeckoId
	WHERE
		(@UserId = '') OR (UserId = @UserId)
RETURN 0
