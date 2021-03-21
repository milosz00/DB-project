ALTER PROCEDURE[dbo].[addCustomerIndividual] 
	-- Add the parameters for the stored procedure here
	@company_id int,
	@city varchar(40),
	@country varchar(40),
	@street varchar(60),
	@number int,
	@phone varchar(12),
	@first_name varchar(50),
	@last_name varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF NOT EXISTS(
		SELECT * FROM company
		WHERE company_id = @company_id
	)
	BEGIN
		;THROW 52000, 'This company does not exists' , 1
	END


    INSERT INTO customers(company_id,city,country,street,number,phone)
	VALUES(
		@company_id,
		@city,
		@country,
		@street,
		@number,
		@phone
	);
	
	DECLARE @customer_id int;
	SET @customer_id = (SELECT TOP 1 customer_id FROM customers ORDER BY customer_id DESC);

	INSERT INTO customers_individual(customer_id,first_name,last_name)
	VALUES(
		@customer_id,
		@first_name,
		@last_name
	);

END