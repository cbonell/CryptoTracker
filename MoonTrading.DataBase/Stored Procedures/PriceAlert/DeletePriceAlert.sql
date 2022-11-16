CREATE PROCEDURE [dbo].[DeletePriceAlert]
	@Id INT
AS
	DELETE FROM PriceAlert WHERE Id = @Id
RETURN 0
