CREATE TABLE [dbo].[PriceAlert]
(
	[Id] INT IDENTITY (100, 1) NOT NULL PRIMARY KEY,
	[UserId] NVARCHAR(255) NOT NULL,
	[Email] NVARCHAR(255) NOT NULL,	
	[CurrencyId] INT NOT NULL,
    [AlertType] INT NOT NULL, 
    [AlertPrice] DECIMAL(20, 6) NOT NULL, 
    CONSTRAINT [FK_PriceAlert_Currency] FOREIGN KEY ([CurrencyId]) REFERENCES [Currency]([Id])
)
