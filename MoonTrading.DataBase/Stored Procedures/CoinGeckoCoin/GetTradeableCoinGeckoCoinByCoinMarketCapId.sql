CREATE PROCEDURE [dbo].[GetTradeableCoinGeckoCoinByCoinMarketCapId]
	@CoinMarketCapId int
AS
	SELECT
		*
	FROM
		CoinGeckoCoin
	WHERE
		CoinMarketCapId = @CoinMarketCapId
RETURN 0
