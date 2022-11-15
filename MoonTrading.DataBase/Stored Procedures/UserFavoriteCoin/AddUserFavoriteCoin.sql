CREATE PROCEDURE [dbo].[AddUserFavoriteCoin]
	@UserId VARCHAR(255),
	@CoinGeckoId VARCHAR(255)
AS
	IF(NOT EXISTS(SELECT TOP 1 * FROM UserFavoriteCoin WHERE UserId = @UserId AND CoinGeckoId = @CoinGeckoId))
	BEGIN
		INSERT INTO 
			UserFavoriteCoin(UserId, CoinGeckoId)
		VALUES(@UserId, @CoinGeckoId)
	END
RETURN 0
