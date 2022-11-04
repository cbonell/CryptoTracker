CREATE TABLE [dbo].[UserWallet]
(
	[Id] INT IDENTITY (100, 1) NOT NULL PRIMARY KEY,
	[UserId] NVARCHAR(255) NOT NULL,
	[CoinGeckoId] NVARCHAR(255) NOT NULL,
	[Quantity] DECIMAL(20, 6) NOT NULL,

	UNIQUE (UserId, CoinGeckoId), 
    CONSTRAINT [FK_UserWallet_CoinGeckoId] FOREIGN KEY ([CoinGeckoId]) REFERENCES [CoinGeckoCoin]([Id])
)
