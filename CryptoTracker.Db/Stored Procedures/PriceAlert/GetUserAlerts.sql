CREATE PROCEDURE [dbo].[GetUserAlerts]
	@UserId NVARCHAR(255)
AS
	SELECT * FROM PriceAlert WHERE UserId = @UserId
RETURN 0
