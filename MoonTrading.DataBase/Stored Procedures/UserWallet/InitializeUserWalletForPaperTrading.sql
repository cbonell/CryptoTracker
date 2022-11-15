CREATE PROCEDURE [dbo].[InitializeUserWalletForPaperTrading]
	@UserId VARCHAR(255),
	@StartingAmount int = 100000
AS
	IF(NOT EXISTS(SELECT TOP 1 * FROM UserWallet WHERE UserId = @UserId))
	BEGIN 
		INSERT INTO
			UserWallet(UserId, CoinGeckoId, Quantity)
		VALUES(@UserId, 'usd', @StartingAmount)
	END
RETURN 0
