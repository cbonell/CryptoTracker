CREATE PROCEDURE [dbo].[GetCurrencyByCoinMarketCapId]
	@CoinMarketCapId INT,
	@CurrencyTypeId INT
AS
	SELECT
		*
	FROM
		Currency
	WHERE
		CoinMarketCapId = @CoinMarketCapId
		AND CurrencyTypeId = @CurrencyTypeId
RETURN 0
