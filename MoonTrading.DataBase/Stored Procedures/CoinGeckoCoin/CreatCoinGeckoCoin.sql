CREATE PROCEDURE [dbo].[CreatCoinGeckoCoin]
	@Id NVARCHAR(255),
	@Symbol NVARCHAR(255),
	@Name NVARCHAR(255)
AS
	INSERT INTO
		CoinGeckoCoin(Id, Symbol, [Name])
	VALUES(@Id, @Symbol, @Name)
