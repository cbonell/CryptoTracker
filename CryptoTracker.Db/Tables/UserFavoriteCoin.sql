CREATE TABLE [dbo].[UserFavoriteCoin]
(
	[Id] INT IDENTITY (100, 1) NOT NULL PRIMARY KEY,
	[UserId] NVARCHAR(255) NOT NULL,
	[CurrencyId] INT NOT NULL,

	UNIQUE(UserId, CurrencyId),
	CONSTRAINT [FK_UserFavoriteCoin_CurrencyId] FOREIGN KEY ([CurrencyId]) REFERENCES [Currency]([Id]),
	CONSTRAINT [CK_UserFavoriteCoin_CurrencyId] CHECK (dbo.ChkCurrencyIsCoin(CurrencyId) = 1)
)
