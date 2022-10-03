CREATE TABLE [dbo].[ResponseCache]
(
	[Id] INT IDENTITY (100, 1) NOT NULL PRIMARY KEY,
	[RequestPath] VARCHAR(500) NOT NULL,
	[Data] NVARCHAR(MAX) NOT NULL,
	[Method] VARCHAR(10) NOT NULL,
	[LastModified] DATETIME NOT NULL,

	UNIQUE([RequestPath], [Method])
)

GO

CREATE INDEX [IX_ResponseCache_RequestPath] ON [dbo].[ResponseCache] ([RequestPath])
