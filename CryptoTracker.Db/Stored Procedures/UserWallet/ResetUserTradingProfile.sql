CREATE PROCEDURE [dbo].[ResetUserTradingProfile]
	@UserId VARCHAR(255)
AS
	DELETE FROM UserWallet WHERE UserId = @UserId;

	DELETE FROM TradingPurchase WHERE UserId = @UserId;
RETURN 0
