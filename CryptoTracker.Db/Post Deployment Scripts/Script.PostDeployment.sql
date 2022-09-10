IF(NOT EXISTS(SELECT * FROM CurrencyType WHERE [Name] = 'Fiat'))
BEGIN
	INSERT INTO CurrencyType VALUES('Fiat')
END

IF(NOT EXISTS(SELECT * FROM CurrencyType WHERE [Name] = 'Coin'))
BEGIN
	INSERT INTO CurrencyType VALUES('Coin')
END
