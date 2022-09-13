CREATE PROCEDURE [dbo].[InitializeUserWalletForPaperTrading]
	@UserId VARCHAR(255),
	@StartingAmount int = 100000
AS
	IF(NOT EXISTS(SELECT TOP 1 * FROM UserWallet WHERE UserId = @UserId))
	BEGIN 
	DECLARE @StartingCurrency INT = (SELECT Id from Currency where Symbol = 'USD');

		INSERT INTO
			UserWallet(UserId, CurrencyId, Quantity)
		VALUES(@UserId, @StartingCurrency, @StartingAmount)
	END
RETURN 0
