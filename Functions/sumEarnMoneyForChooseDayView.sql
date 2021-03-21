ALTER FUNCTION [dbo].[sumEarnMoneyForChooseDayView]
(	
	-- Add the parameters for the function here
	@permises_id int,
	@date date

)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT CAST(SUM(od.price*od.quantity*(1-od.discount))AS DECIMAL(10,2)) AS SumEarnMoney,o.date FROM orders o 
	INNER JOIN [order details] od ON o.order_id = od.order_id
	WHERE o.permises_id = @permises_id AND o.date = @date AND o.is_completed = 1
	GROUP BY o.date
)