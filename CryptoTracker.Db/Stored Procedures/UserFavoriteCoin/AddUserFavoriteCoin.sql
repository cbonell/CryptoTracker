CREATE PROCEDURE [dbo].[AddUserFavoriteCoin]
	@UserId VARCHAR(255),
	@CurrencyId INT
AS
	IF(NOT EXISTS(SELECT TOP 1 * FROM UserFavoriteCoin WHERE UserId = @UserId AND CurrencyId = @CurrencyId))
	BEGIN
		INSERT INTO 
			UserFavoriteCoin(UserId, CurrencyId)
		VALUES(@UserId, @CurrencyId)
	END
RETURN 0
