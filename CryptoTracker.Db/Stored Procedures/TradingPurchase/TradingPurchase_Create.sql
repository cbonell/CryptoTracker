CREATE PROCEDURE [dbo].[TradingPurchase_Create]
	@UserId VARCHAR(255),
	@CoinId int,
	@PurchasingCurrencyId INT,
	@Quantity decimal(20,6),
	@PurchasePrice decimal(20,2),
	@PurchaseDate DATETIME
AS
	DECLARE @PurchaseType INT = (SELECT TOP 1 Id FROM PurchaseType WHERE [Name] = 'Buy'),
			@UsdCurrencyId INT = (SELECT TOP 1 Id FROM Currency WHERE [Symbol] = 'USD')

	IF(@UserId IS NULL)
	BEGIN
		print('UserId cant by null');
		return 1
	END

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
		   , @PurchasingCurrencyId
		   , @PurchaseType
		   , @Quantity
		   , @PurchasePrice
		   , @PurchaseDate)

	IF(NOT EXISTS(SELECT TOP 1 * FROM UserWallet WHERE UserId = @UserId AND CurrencyId = @CoinId))
	BEGIN
		INSERT INTO
			UserWallet(UserId, CurrencyId, Quantity)
		VALUES(@UserId, @CoinId, @Quantity)
	END
	ELSE
	BEGIN
		UPDATE
			UserWallet
		SET
			Quantity = Quantity + @Quantity
		WHERE 
			UserId = @UserId 
			AND CurrencyId = @CoinId
			
	END

	IF(@PurchasingCurrencyId = @UsdCurrencyId)
	BEGIN
		UPDATE
			UserWallet
		SET
			Quantity = Quantity - (@Quantity * @PurchasePrice)
		WHERE 
			UserId = @UserId 
			AND CurrencyId = @UsdCurrencyId
	END

RETURN 0
