ALTER FUNCTION [dbo].[allProductInStockStateView]
(
	@permise_id INT
)
RETURNS 
@stockState TABLE 
(
	-- Add the column definitions for the TABLE variable here
	product_name varchar(50),
	units_in_stock int,
	minimum_units_in_stock int
)
AS
BEGIN

	INSERT INTO @stockState (product_name, units_in_stock,minimum_units_in_stock)
	SELECT product_name,units_in_stock,minimum_units_in_stock 
	from stock 
		join products on stock.product_id = products.product_id							
	where permises_id = @permise_id
	
	RETURN 
END