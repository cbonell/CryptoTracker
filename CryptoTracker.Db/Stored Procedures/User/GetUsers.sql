CREATE PROCEDURE [dbo].[GetUsers]
AS
	SELECT
		FirstName
		, LastName
		, DateCreated
		, LastModified
	FROM
		dbo.[User]
RETURN 0
