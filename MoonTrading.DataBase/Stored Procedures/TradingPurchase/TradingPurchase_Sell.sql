CREATE PROCEDURE [dbo].[TradingPurchase_Sell]
	@UserId VARCHAR(255),
	@CoinId NVARCHAR(255),
	@Quantity decimal(20,6),
	@SellPrice decimal(20,2),
	@PurchaseDate DATETIME
AS
	DECLARE @CurrentQuantity INT,
			@PurchaseType INT = (SELECT TOP 1 Id FROM PurchaseType WHERE [Name] = 'Sell'),
			@err nvarchar(255) = 'User tried to sell more ' + @CoinId  + ' than than they own'


	IF(EXISTS(SELECT TOP 1 *FROM UserWallet WHERE UserId = @UserId AND CoinGeckoId = @CoinId))
	BEGIN
		SELECT TOP 1 @CurrentQuantity = Quantity FROM UserWallet WHERE UserId = @UserId AND CoinGeckoId = @CoinId
		IF(@CurrentQuantity >= @Quantity)
		BEGIN
			UPDATE
				UserWallet 
			SET
				Quantity = Quantity - @Quantity
			WHERE 
				UserId = @UserId
				AND CoinGeckoId = @CoinId

			INSERT INTO 
				TradingPurchase(UserId
						, CoinId
						, PurchasingCurrency
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

			UPDATE
				UserWallet
			SET
				Quantity = Quantity + (@Quantity * @SellPrice)
			WHERE 
				UserId = @UserId 
				AND CoinGeckoId = 'usd'
		END		
		ELSE					
			THROW 51000, @err, 1;  

	END
RETURN 0
