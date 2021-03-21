ALTER FUNCTION [dbo].[getOrderValue] 
(
	-- Add the parameters for the function here
	@order_id int
)
RETURNS Money
AS
BEGIN
	-- Declare the return variable here
	DECLARE @value Money

	-- Add the T-SQL statements to compute the return value here
	SELECT @value = sum(price*quantity*(1 - discount)) FROM [order details] where order_id = @order_id 

	-- Return the result of the function
	RETURN isNull(@value,0)

END