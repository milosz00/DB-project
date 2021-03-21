ALTER FUNCTION [dbo].[statisticOrdersCustomerIndividualView]
(	
	-- Add the parameters for the function here
	@company_id int
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT ci.first_name,ci.last_name,COUNT(*) count, 
			CAST(SUM(od.price*od.quantity*(1-od.discount))AS decimal(10,2)) totalSum 
	FROM customers c
		INNER JOIN customers_individual ci ON ci.customer_id = c.customer_id
		INNER JOIN orders o ON o.customer_id = c.customer_id
		INNER JOIN [order details] od ON od.order_id = o.order_id
	WHERE c.company_id = @company_id AND o.is_completed = 1
	GROUP BY ci.customer_id, ci.first_name,ci.last_name
)