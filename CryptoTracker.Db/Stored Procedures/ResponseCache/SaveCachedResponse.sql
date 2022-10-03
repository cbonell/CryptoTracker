CREATE PROCEDURE [dbo].[SaveCachedResponse]
	@Data NVARCHAR(MAX),
	@BaseUrl VARCHAR(MAX),
	@Method VARCHAR(10)
AS
	IF(EXISTS(SELECT TOP 1 * FROM ResponseCache WHERE Method = @Method AND RequestPath = @BaseUrl))
	BEGIN
		UPDATE
			ResponseCache
		SET
			[Data] = @Data, LastModified = GETDATE()
		WHERE 
			Method = @Method 
			AND RequestPath = @BaseUrl
	END
	ELSE
	BEGIN
		INSERT INTO 
			ResponseCache(RequestPath, [Data], Method, LastModified)
		VALUES(@BaseUrl, @Data, @Method, GETDATE())
	END
RETURN 0
