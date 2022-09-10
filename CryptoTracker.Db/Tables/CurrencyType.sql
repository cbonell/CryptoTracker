CREATE TABLE [dbo].[CurrencyType]
(
	[Id] INT IDENTITY (100, 1) NOT NULL PRIMARY KEY,
	[Name] VARCHAR(255) NOT NULL,

	UNIQUE([Name])
)

GO

CREATE INDEX [IX_CurrencyType_Id] ON [dbo].[CurrencyType] ([Id])
