CREATE PROCEDURE [dbo].[CheckIfCoinIsUsersFavorite]
	@CoinGeckoId VARCHAR(255),
	@UserId NVARCHAR(255)
AS
	IF(EXISTS(SELECT TOP 1 * FROM UserFavoriteCoin WHERE CoinGeckoId = @CoinGeckoId AND UserId = @UserId))
	BEGIN
		SELECT 1
	END
	ELSE
		SELECT 0
RETURN 0
