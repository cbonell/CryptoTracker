CREATE TABLE [dbo].[UserFavoriteCoin]
(
	[Id] INT IDENTITY (100, 1) NOT NULL PRIMARY KEY,
	[UserId] NVARCHAR(255) NOT NULL,
	[CoinGeckoId] NVARCHAR(255) NOT NULL,

	UNIQUE([UserId], [CoinGeckoId]),
	CONSTRAINT [FK_UserFavoriteCoin_CoinGeckoId] FOREIGN KEY ([CoinGeckoId]) REFERENCES [CoinGeckoCoin]([Id])
)
