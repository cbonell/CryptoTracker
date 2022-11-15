CREATE TABLE [dbo].[Currency]
(
	[Id] INT IDENTITY (100, 1) NOT NULL PRIMARY KEY,
	[CoinMarketCapId] INT NOT NULL,
	[CurrencyTypeId] INT NOT NULL,
	[Name] NVARCHAR(40) NOT NULL,
	[Sign] NVARCHAR(5) NOT NULL,
	[Symbol] NVARCHAR(10) NOT NULL,

	UNIQUE ([Name], CoinMarketCapId), 
    CONSTRAINT [FK_Currency_CurrencyType] FOREIGN KEY ([CurrencyTypeId]) REFERENCES [CurrencyType]([Id])
)

GO

CREATE INDEX [IX_Currency_Id] ON [dbo].[Currency] ([Id]);

GO
CREATE INDEX [IX_Currency_Name] ON [dbo].[Currency] ([Name]);

GO
CREATE INDEX [IX_Currency_CoinMarketCapId] ON [dbo].[Currency] ([CoinMarketCapId]);
