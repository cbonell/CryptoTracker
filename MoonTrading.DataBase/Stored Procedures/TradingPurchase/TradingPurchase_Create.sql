CREATE PROCEDURE [dbo].[TradingPurchase_Create]
	@UserId VARCHAR(255),
	@CoinGeckoId NVARCHAR(255),
	@PurchasingCurrency NVARCHAR(255),
	@Quantity decimal(20,6),
	@PurchasePrice decimal(20,2),
	@PurchaseDate DATETIME
AS
	DECLARE @PurchaseType INT = (SELECT TOP 1 Id FROM PurchaseType WHERE [Name] = 'Buy')

	IF(@UserId IS NULL)
	BEGIN
		print('UserId cant by null');
		return 1
	END

	INSERT INTO 
		TradingPurchase(UserId
						, CoinId
						, PurchasingCurrency
						, PurchaseTypeId
						, Quantity
						, PurchasePrice
						, PurchaseDate)
	VALUES(@UserId
		   , @CoinGeckoId
		   , @PurchasingCurrency
		   , @PurchaseType
		   , @Quantity
		   , @PurchasePrice
		   , @PurchaseDate)

	IF(NOT EXISTS(SELECT TOP 1 * FROM UserWallet WHERE UserId = @UserId AND CoinGeckoId = @CoinGeckoId))
	BEGIN
		INSERT INTO
			UserWallet(UserId, CoinGeckoId, Quantity)
		VALUES(@UserId, @CoinGeckoId, @Quantity)
	END
	ELSE
	BEGIN
		UPDATE
			UserWallet
		SET
			Quantity = Quantity + @Quantity
		WHERE 
			UserId = @UserId 
			AND CoinGeckoId = @CoinGeckoId
			
	END

	UPDATE
		UserWallet
	SET
		Quantity = Quantity - (@Quantity * @PurchasePrice)
	WHERE 
		UserId = @UserId 
		AND CoinGeckoId = @CoinGeckoId

RETURN 0
