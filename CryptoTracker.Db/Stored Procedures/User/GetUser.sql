CREATE PROCEDURE [dbo].[GetUser]
	@UserId INT
AS
	SELECT
		FirstName
		, LastName
		, DateCreated
		, LastModified
	FROM
		dbo.[User]
	WHERE
		Id = @UserId
RETURN 0
