CREATE TABLE [dbo].[User]
(
	[Id] INT IDENTITY (100, 1) NOT NULL PRIMARY KEY,
	[FirstName] VARCHAR(50) NOT NULL,
	[LastName] VARCHAR(50) NOT NULL,
	[DateCreated] DATETIME NOT NULL DEFAULT GETDATE(),
	[LastModified] DATETIME NULL DEFAULT GETDATE(),
)

GO

CREATE TRIGGER [dbo].[Trigger_UserUpdated]
    ON [dbo].[User]
    FOR UPDATE
    AS
    BEGIN
        SET NoCount ON
        DECLARE @UpdatedId INT;

        SELECT @UpdatedId = ins.Id FROM INSERTED ins;
        
        IF(@UpdatedId IS NOT NULL AND @UpdatedId > 0)
        BEGIN
            UPDATE dbo.[User] SET LastModified = GETDATE() WHERE Id = @UpdatedId
        END
    END