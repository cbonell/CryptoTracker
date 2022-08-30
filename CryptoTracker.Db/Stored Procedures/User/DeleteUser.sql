CREATE PROCEDURE [dbo].[DeleteUser]
	@UserId int
AS
	DELETE FROM
		dbo.[User]
	WHERE
		Id = @UserId
RETURN 0
