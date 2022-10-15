CREATE PROCEDURE [dbo].[GetCurrencyById]
	@Id INT
AS
	SELECT * FROM Currency WHERE Id = @Id
RETURN 0
