CREATE PROCEDURE [dbo].[CreateUser]
	@FirstName VARCHAR(50),
	@LastName VARCHAR(50)
AS
	INSERT INTO
		dbo.[User](FirstName, LastName)
	VALUES(@FirstName, @LastName)
RETURN 0
