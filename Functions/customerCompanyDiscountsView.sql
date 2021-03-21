ALTER FUNCTION [dbo].[customerCompanyDiscountsView]
(
	-- Add the parameters for the function here
	@customer_id int
)
RETURNS 
@customersDiscounts TABLE 
(
	-- Add the column definitions for the TABLE variable here
	CustomerID INT,
	CompanyName VARCHAR(100),
	Discount FLOAT
)
AS
BEGIN
	-- Fill the table variable with the rows for your result set
	DECLARE @company_id INT = (SELECT company_id FROM dbo.customers WHERE customer_id = @customer_id);
	DECLARE @fk1_month_counter INT = (SELECT fk1_month_counter FROM dbo.discounts WHERE customer_id = @customer_id);
	DECLARE @fm FLOAT = (SELECT fm FROM dbo.discounts_steps WHERE company_id = @company_id);
	DECLARE @fk2_received_date DATE = (SELECT fk2_received_date FROM dbo.discounts WHERE customer_id = @customer_id);

	DECLARE @fr1 FLOAT = @fk1_month_counter * (SELECT fr1 FROM dbo.discounts_steps WHERE company_id = @company_id);

	IF @fm < @fr1
		SET @fr1 = @fm;
	
	
	DECLARE @fr2 FLOAT;
  
	IF DATEDIFF(MONTH,@fk2_received_date,GETDATE()) <= 3
		SET @fr2 = (SELECT fr2 FROM dbo.discounts_steps WHERE company_id = @company_id);
	ELSE
		SET @fr2 = 0;
		

	INSERT INTO @customersDiscounts
	(
	    CustomerID,
		CompanyName,
	    Discount
	)
	VALUES
	(   @customer_id,  -- CustomerID - int
	    (SELECT company_name FROM dbo.customers_company WHERE customer_id = @customer_id), -- CompanyName - varchar(100)
	    @fr1 + @fr2 -- Discount - float
	 )

	
	RETURN 
END