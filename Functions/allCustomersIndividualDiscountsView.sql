ALTER FUNCTION [dbo].[allCustomersIndividualDiscountsView]
(
	@company_id INT
)
RETURNS 
@customersDiscounts TABLE 
(
	-- Add the column definitions for the TABLE variable here
	CustomerID INT,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	Discount FLOAT
)
AS
BEGIN
	-- Fill the table variable with the rows for your result set

	DECLARE @countCustomers INT = (SELECT TOP 1 customer_id FROM dbo.customers ORDER BY customer_id DESC);
	DECLARE @i INT = 1;

	WHILE @i <= @countCustomers
	BEGIN
		IF EXISTS(
			SELECT * FROM dbo.customers_individual WHERE customer_id = @i
		) AND @company_id = (SELECT company_id FROM dbo.customers WHERE customer_id = @i)
		BEGIN
			INSERT INTO @customersDiscounts(CustomerID,FirstName,LastName,Discount)
			VALUES(
				(SELECT CustomerID FROM customerIndividualDiscountsView(@i)),
				(SELECT FirstName FROM customerIndividualDiscountsView(@i)),
				(SELECT LastName FROM customerIndividualDiscountsView(@i)),
				(SELECT Discount FROM customerIndividualDiscountsView(@i))
			);
		END
		SET @i = @i + 1;
	END
	RETURN 
END