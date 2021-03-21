ALTER FUNCTION [dbo].[customerIndividualDiscountsView]
(
	-- Add the parameters for the function here
	@customer_id int
)
RETURNS 
@customersDiscounts TABLE 
(
	-- Add the column definitions for the TABLE variable here
	CustomerID int,
	FirstName varchar(50),
	LastName varchar(50),
	Discount float
)
AS
BEGIN
	-- Fill the table variable with the rows for your result set
	
	DECLARE @company_id int = (SELECT company_id FROM customers WHERE customer_id = @customer_id);
	DECLARE @k1_order_counter int = (SELECT d.k1_order_counter FROM discounts d
										WHERE d.customer_id = @customer_id);
	DECLARE @k2_received_date date = (SELECT k2_received_date FROM discounts WHERE customer_id = @customer_id);
	DECLARE @k3_received_date date = (SELECT k3_received_date FROM discounts WHERE customer_id = @customer_id);

	DECLARE @r1 float;
	IF @k1_order_counter >= (SELECT z1 FROM discounts_steps WHERE company_id = @company_id)
	BEGIN
		SET @r1 = (SELECT r1 FROM discounts_steps WHERE company_id = @company_id)
	END
	ELSE
		SET @r1 = 0;

	IF @k1_order_counter >= 2*(SELECT z1 FROM discounts_steps WHERE company_id = @company_id)
	BEGIN
		SET @r1 += @r1; 
	END

	
	DECLARE @r2 float;
	IF @k2_received_date IS NOT NULL
	BEGIN
		IF DATEDIFF(DAY,@k2_received_date,GETDATE()) <= (SELECT d1 FROM discounts_steps WHERE company_id = @company_id)
		BEGIN
			SET @r2 = (SELECT r2 FROM discounts_steps WHERE company_id = @company_id)
		END
		ELSE
			SET @r2 = 0
	END
	ELSE
		SET @r2 = 0;
	
	
	
	DECLARE @r3 float;
	IF @k3_received_date IS NOT NULL
	BEGIN
		IF DATEDIFF(DAY,@k3_received_date,GETDATE()) <= (SELECT d2 FROM discounts_steps WHERE company_id = @company_id)
		BEGIN
			SET @r3 = (SELECT r3 FROM discounts_steps WHERE company_id = @company_id)
		END
		ELSE
			SET @r3 = 0
	END
	ELSE 
		SET @r3 = 0;
	
	
	INSERT INTO @customersDiscounts(CustomerID,FirstName,LastName,Discount)
	VALUES(
		@customer_id,
		(SELECT first_name FROM customers_individual WHERE customer_id = @customer_id),
		(SELECT last_name FROM customers_individual WHERE customer_id = @customer_id),
		@r1+@r2+@r3
	);

	RETURN
END