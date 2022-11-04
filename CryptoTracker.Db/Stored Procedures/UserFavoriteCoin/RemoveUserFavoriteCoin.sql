CREATE PROCEDURE [dbo].[RemoveUserFavoriteCoin]
	@UserId VARCHAR(255),
	@CoinGeckoId NVARCHAR(255)
AS
	DELETE FROM
		UserFavoriteCoin 
	WHERE 
		UserId = @UserId
		AND CoinGeckoId = @CoinGeckoId
RETURN 0
