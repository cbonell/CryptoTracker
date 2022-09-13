CREATE FUNCTION [dbo].[ChkCurrencyIsCoin](@CurrencyId INT) RETURNS BIT as
BEGIN     
  DECLARE @isFiat BIT,
          @TypeId INT = (SELECT Id FROM CurrencyType WHERE [Name] = 'Coin')

  SET @isFiat = case when @CurrencyId IS NULL OR @CurrencyId < 0 then 0
                     when EXISTS(SELECT * FROM Currency WHERE Id = @CurrencyId AND CurrencyTypeId = @TypeId) then 1
                     else 0 
                end
  RETURN @isFiat
END 
GO