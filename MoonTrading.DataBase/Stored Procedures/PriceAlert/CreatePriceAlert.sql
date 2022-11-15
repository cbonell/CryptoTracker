CREATE PROCEDURE [dbo].[CreatePriceAlert]
	@UserId NVARCHAR(255),
	@Email NVARCHAR(255),	
	@CoinGeckoId NVARCHAR(255),
    @AlertType INT, 
    @AlertPrice DECIMAL(20, 6)
AS
	IF(NOT EXISTS(
					SELECT TOP 1 * FROM [dbo].[PriceAlert] 
					WHERE UserId = @UserId AND Email = @Email AND CoinGeckoId = @CoinGeckoId AND AlertType = @AlertType AND AlertPrice = @AlertPrice
				  ))
	BEGIN
		INSERT INTO
			[dbo].[PriceAlert](UserId, Email, CoinGeckoId, AlertType, AlertPrice)
		VALUES(@UserId, @Email, @CoinGeckoId, @AlertType, @AlertPrice)
	END
RETURN 0
