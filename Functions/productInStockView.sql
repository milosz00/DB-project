ALTER FUNCTION [dbo].[productsInStockView]
(	
	-- Add the parameters for the function here
	@permises_id int

)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT p.product_name,s.units_in_stock FROM stock s
	INNER JOIN products p ON s.product_id = p.product_id
	WHERE s.permises_id = @permises_id
)