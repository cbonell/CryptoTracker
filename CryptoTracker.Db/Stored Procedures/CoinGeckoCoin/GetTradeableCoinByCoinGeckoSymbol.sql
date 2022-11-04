CREATE PROCEDURE [dbo].[GetTradeableCoinByCoinGeckoSymbol]
	@Symbol NVARCHAR(255)
AS
	SELECT	
		*
	FROM
		CoinGeckoCoin
	WHERE
		Symbol = @Symbol
RETURN 0
