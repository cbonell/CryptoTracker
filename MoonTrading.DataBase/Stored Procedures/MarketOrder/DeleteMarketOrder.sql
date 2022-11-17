CREATE PROCEDURE [dbo].[DeleteMarketOrder]
	@Id INT
AS
	DELETE FROM MarketOrder WHERE Id = @Id
RETURN 0
