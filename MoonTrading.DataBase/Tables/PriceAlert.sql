CREATE TABLE [dbo].[PriceAlert]
(
	[Id] INT IDENTITY (100, 1) NOT NULL PRIMARY KEY,
	[UserId] NVARCHAR(255) NOT NULL,
	[Email] NVARCHAR(255) NOT NULL,	
    [AlertType] INT NOT NULL, 
    [AlertPrice] DECIMAL(20, 6) NOT NULL, 
    [CoinGeckoId] NVARCHAR(255) NOT NULL,

	CONSTRAINT [FK_PriceAlert_CoinGeckoId] FOREIGN KEY ([CoinGeckoId]) REFERENCES [CoinGeckoCoin]([Id])
)
