CREATE TABLE [dbo].[UserWallet]
(
	[Id] INT IDENTITY (100, 1) NOT NULL PRIMARY KEY,
	[UserId] NVARCHAR(255) NOT NULL,
	[CurrencyId] INT NOT NULL,
	[Quantity] DECIMAL(20, 6) NOT NULL,

	UNIQUE (UserId, CurrencyId), 
    CONSTRAINT [FK_UserWallet_CoinId] FOREIGN KEY ([CurrencyId]) REFERENCES [Currency]([Id])
)
