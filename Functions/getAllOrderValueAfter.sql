ALTER FUNCTION [dbo].[getAllOrderValueAfter] 
(
	@customer_id int,
	@date date
)
RETURNS money
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ordersValue money

	-- Add the T-SQL statements to compute the return value here

	IF @date IS Null
	BEGIN
		SELECT @ordersValue = sum(( [dbo].getOrderValue(order_id))) 
		from orders 
		Where customer_id = @customer_id 
		-- Return the result of the function
		RETURN @ordersValue
	END
	SELECT @ordersValue = sum(( [dbo].getOrderValue(order_id))) 
		from orders 
		Where customer_id = @customer_id 
		-- Return the result of the function
		RETURN @ordersValue
END