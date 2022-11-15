CREATE PROCEDURE [dbo].[GetCurrenciesByType]
	@CurrencyTypeId int
AS
	SELECT
		*
	FROM
		Currency
	WHERE
		CurrencyTypeId = @CurrencyTypeId
RETURN 0
