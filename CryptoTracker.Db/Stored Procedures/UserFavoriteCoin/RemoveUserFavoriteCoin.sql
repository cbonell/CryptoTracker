CREATE PROCEDURE [dbo].[RemoveUserFavoriteCoin]
	@UserId VARCHAR(255),
	@CurrencyId INT
AS
	DELETE FROM
		UserFavoriteCoin 
	WHERE 
		UserId = @UserId
		AND CurrencyId = @CurrencyId
RETURN 0
