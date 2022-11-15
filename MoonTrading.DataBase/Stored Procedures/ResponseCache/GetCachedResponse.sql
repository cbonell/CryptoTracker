CREATE PROCEDURE [dbo].[GetCachedResponse]
	@RequestPath NVARCHAR(MAX),
	@Method VARCHAR(10),
	@ResonseThreshold INT
AS
	IF(EXISTS(SELECT TOP 1 * FROM ResponseCache WHERE Method = @Method AND RequestPath = @RequestPath AND (DATEDIFF(second, LastModified, GETDATE()) <= @ResonseThreshold)))
	BEGIN
		SELECT TOP 1 
			[Data]
		FROM
			ResponseCache 
		WHERE 
			Method = @Method
			AND RequestPath = @RequestPath
	END
	ELSE IF(EXISTS(SELECT TOP 1 * FROM ResponseCache WHERE Method = @Method AND RequestPath = @RequestPath AND (DATEDIFF(second, LastModified, GETDATE()) > @ResonseThreshold)))
	BEGIN
		SELECT 'DATA_EXPIRED' AS [Data] 
	END
	ELSE
	BEGIN
		SELECT NULL AS [Data]
	END
RETURN 0
