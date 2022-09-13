CREATE PROCEDURE [dbo].[CheckIfCoinIsUsersFavorite]
	@CurrencyId INT,
	@UserId VARCHAR(255)
AS
	IF(EXISTS(SELECT TOP 1 * FROM UserFavoriteCoin WHERE CurrencyId = @CurrencyId AND UserId = @UserId))
	BEGIN
		SELECT 1
	END
	ELSE
		SELECT 0
RETURN 0
