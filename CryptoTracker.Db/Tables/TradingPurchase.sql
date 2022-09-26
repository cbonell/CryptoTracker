CREATE TABLE [dbo].[TradingPurchase]
(
	[Id] INT IDENTITY (100, 1) NOT NULL PRIMARY KEY,
	[UserId] NVARCHAR(255) NOT NULL,
	[CoinId] INT NOT NULL,
	[PurchasingCurrencyId] INT NULL,
	[PurchaseTypeId] INT NOT NULL,
	[Quantity] DECIMAL(20, 6) NOT NULL,
	[PurchasePrice] DECIMAL(20, 2) NOT NULL,
	[PurchaseDate] DateTime NOT NULL, 
    CONSTRAINT [FK_TradingPurchase_PurchaseType] FOREIGN KEY ([PurchaseTypeId]) REFERENCES [PurchaseType]([Id]),
    CONSTRAINT [FK_TradingPurchase_Currency] FOREIGN KEY ([PurchasingCurrencyId]) REFERENCES [Currency]([Id]),
    CONSTRAINT [FK_TradingPurchase_Currency2] FOREIGN KEY ([CoinId]) REFERENCES [Currency]([Id]),
)

GO

CREATE INDEX [IX_TradingPurchase_UserId] ON [dbo].[TradingPurchase] ([UserId])
