ALTER FUNCTION [dbo].[allCustomersCompanyDiscountsView]
(
	@company_id INT
)
RETURNS 
@customersCompanyDiscounts TABLE 
(
	-- Add the column definitions for the TABLE variable here
	CustomerID INT,
	CompanyName VARCHAR(100),
	Discount FLOAT
)
AS
BEGIN
	
	DECLARE @countCustomers int = (SELECT TOP 1 customer_id FROM dbo.customers ORDER BY customer_id DESC);
	DECLARE @i int = 1;

	WHILE @i <= @countCustomers
	BEGIN
		IF EXISTS(
			SELECT * FROM dbo.customers_company WHERE customer_id = @i
		) AND @company_id = (SELECT company_id FROM dbo.customers WHERE customer_id = @i)
		BEGIN
			INSERT INTO @customersCompanyDiscounts(CustomerID,CompanyName,Discount)
			VALUES(
				(SELECT CustomerID FROM customerCompanyDiscountsView(@i) ),
				(SELECT CompanyName FROM customerCompanyDiscountsView(@i) ),
				(SELECT Discount FROM customerCompanyDiscountsView(@i) )
			);
		END
		SET @i = @i + 1;
	END
	
	RETURN 
END