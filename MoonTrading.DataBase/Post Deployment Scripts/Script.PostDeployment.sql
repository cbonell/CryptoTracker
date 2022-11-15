IF(NOT EXISTS(SELECT * FROM CurrencyType WHERE [Name] = 'Fiat'))
BEGIN
	INSERT INTO CurrencyType VALUES('Fiat')
END

IF(NOT EXISTS(SELECT * FROM CurrencyType WHERE [Name] = 'Coin'))
BEGIN
	INSERT INTO CurrencyType VALUES('Coin')
END

-- Create the test user and data
IF(NOT EXISTS(SELECT TOP 1 * FROM UserFavoriteCoin WHERE UserId = 'testuser:systemtestuser' AND CurrencyId = 100))
BEGIN
	INSERT INTO UserFavoriteCoin(UserId, CurrencyId) VALUES('testuser:systemtestuser', 100)
END
