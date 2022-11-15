CREATE TABLE [dbo].[UserEmail]
(
	[Id] INT IDENTITY (100, 1) NOT NULL PRIMARY KEY,
	[UserId] INT NOT NULL,
	[Address] VARCHAR(255) NOT NULL,
	[DateCreated] DATETIME NOT NULL DEFAULT GETDATE(),
	[LastModified] DATETIME NULL DEFAULT GETDATE(),

    CONSTRAINT [FK_UserEmail_User] FOREIGN KEY ([UserId]) REFERENCES [User]([Id]), 
    CONSTRAINT [CK_UserEmail_Address] CHECK (dbo.ChkValidEmail(Address) = 1)
)