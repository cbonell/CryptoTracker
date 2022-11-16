CREATE TABLE [dbo].[UserPaperBank]
(
	[Id] INT IDENTITY (100, 1) NOT NULL PRIMARY KEY,
	[UserId] VARCHAR(255) NOT NULL,
	[CurrencyId] INT NOT NULL,
	[Quantity] DECIMAL(20, 6) NOT NULL,

	UNIQUE(UserId, CurrencyId),
	CONSTRAINT [CK_UserPaperBank_CurrencyId] CHECK (dbo.ChkCurrencyIsFiat(CurrencyId) = 1)
)
