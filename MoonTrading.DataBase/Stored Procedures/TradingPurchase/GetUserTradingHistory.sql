CREATE PROCEDURE [dbo].[GetUserTradingHistory]
	@UserId VARCHAR(255)
AS
	SELECT
		tp.*,
		pt.[Name] TransactionType,
		c.[Name] CoinName,
		c.Id CoinGeckdId,
		c.CoinMarketCapId CoinMarketCapCoinId
	FROM
		TradingPurchase tp
		INNER JOIN PurchaseType pt ON pt.Id = tp.PurchaseTypeId
		INNER JOIN CoinGeckoCoin c ON c.Id = tp.CoinId
	WHERE
		tp.UserId = @UserId
	ORDER BY
		tp.PurchaseDate DESC
RETURN 0
