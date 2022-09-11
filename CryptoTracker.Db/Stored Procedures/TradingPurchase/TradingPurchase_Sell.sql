CREATE PROCEDURE [dbo].[TradingPurchase_Sell]
	@UserId VARCHAR(255),
	@CoinId int,
	@Quantity decimal(20,6),
	@SellPrice decimal(20,2),
	@PurchaseDate DATETIME
AS
	DECLARE @CurrentQuantity INT,
			@PurchaseType INT = (SELECT TOP 1 Id FROM PurchaseType WHERE [Name] = 'Sell')

	IF(EXISTS(SELECT TOP 1 *FROM UserWallet WHERE UserId = @UserId AND CurrencyId = @CoinId))
	BEGIN
		SELECT TOP 1 @CurrentQuantity = Quantity FROM UserWallet WHERE UserId = @UserId AND CurrencyId = @CoinId
		IF(@CurrentQuantity >= @Quantity)
		BEGIN
			UPDATE
				UserWallet 
			SET
				Quantity = Quantity - @Quantity
			WHERE 
				UserId = @UserId AND CurrencyId = @CoinId

			INSERT INTO 
				TradingPurchase(UserId
						, CoinId
						, PurchasingCurrencyId
						, PurchaseTypeId
						, Quantity
						, PurchasePrice
						, PurchaseDate)
			VALUES(@UserId
				, @CoinId
				, NULL
				, @PurchaseType
				, @Quantity
				, @SellPrice
				, @PurchaseDate)
		END		
	END
RETURN 0
