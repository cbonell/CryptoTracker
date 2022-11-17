CREATE PROCEDURE [dbo].[CreateMarketOrder]
	@CoinGeckoId NVARCHAR(255),
	@UserId NVARCHAR(255),
	@UserEmail NVARCHAR(255),
	@AlertPrice DECIMAL(20, 6),
	@Quantity DECIMAL(20, 6), 
	@OrderType INT
AS
	INSERT INTO
		MarketOrder(CoinGeckoId, UserId, UserEmail, AlertPrice, Quantity, OrderType)
	VALUES
		(@CoinGeckoId, @UserId, @UserEmail, @AlertPrice, @Quantity, @OrderType)
RETURN 0
