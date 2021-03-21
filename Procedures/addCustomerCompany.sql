ALTER PROCEDURE [dbo].[addCustomerCompany]
	-- Add the parameters for the stored procedure here
	@company_id int,
	@city varchar(40),
	@country varchar(40),
	@street varchar(60),
	@number int,
	@phone varchar(12),
	@company_name varchar(100),
	@email varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
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

	DECLARE @customer_id INT  = (SELECT TOP 1 customer_id FROM dbo.customers ORDER BY customer_id DESC);


	INSERT INTO dbo.customers_company(
		customer_id,
	    company_name,
	    email
	)
	VALUES
	(   
		@customer_id,
	    @company_name, -- company_name - varchar(100)
	    @email  -- email - varchar(50)
	    )



END