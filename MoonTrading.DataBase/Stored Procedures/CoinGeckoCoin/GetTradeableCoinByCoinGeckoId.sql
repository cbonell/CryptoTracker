CREATE PROCEDURE [dbo].[GetTradeableCoinByCoinGeckoId]
	@Id VARCHAR(255)
AS
	SELECT
		*
	FROM
		CoinGeckoCoin
	WHERE
		Id = @Id
RETURN 0
