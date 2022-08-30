CREATE PROCEDURE [dbo].[UpdateUser]
	@UserId int,
	@FirstName VARCHAR(50),
	@LastName VARCHAR(50)
AS
	UPDATE 
		dbo.[User]
	SET
		FirstName = @FirstName,
		LastName = @LastName
	WHERE
		Id = @UserId
RETURN 0
