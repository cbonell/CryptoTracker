CREATE PROCEDURE [dbo].[CreatePriceAlert]
	@UserId NVARCHAR(255),
	@Email NVARCHAR(255),	
	@CurrencyId INT,
    @AlertType INT, 
    @AlertPrice DECIMAL(20, 6)
AS
	IF(NOT EXISTS(
					SELECT TOP 1 * FROM [dbo].[PriceAlert] 
					WHERE UserId = @UserId AND Email = @Email AND CurrencyId = @CurrencyId AND AlertType = @AlertType AND AlertPrice = @AlertPrice
				  ))
	BEGIN
		INSERT INTO
			[dbo].[PriceAlert](UserId, Email, CurrencyId, AlertType, AlertPrice)
		VALUES(@UserId, @Email, @CurrencyId, @AlertType, @AlertPrice)
	END
RETURN 0
