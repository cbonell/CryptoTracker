CREATE TABLE [dbo].[MarketOrder]
(
	[Id] INT IDENTITY (100, 1) NOT NULL PRIMARY KEY,
	[CoinGeckoId] NVARCHAR(255) NOT NULL,
	[UserId] NVARCHAR(255) NOT NULL,
	[UserEmail] NVARCHAR(255) NOT NULL,
	[AlertPrice] DECIMAL(20, 6) NOT NULL,
	[Quantity] DECIMAL(20, 6) NOT NULL, 
	[OrderType] INT NOT NULL,

	CONSTRAINT [FK_MarketOrder_CoinGeckoId] FOREIGN KEY ([CoinGeckoId]) REFERENCES [CoinGeckoCoin]([Id])
)
