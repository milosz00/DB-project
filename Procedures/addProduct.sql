ALTER PROCEDURE [dbo].[addProduct]
	-- Add the parameters for the stored procedure here
	@company_id INT,
	@product_name VARCHAR(50)
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

	INSERT INTO dbo.products(company_id,product_name)
	VALUES(  
	    @company_id, -- company_id - int
	    @product_name -- product_name - varchar(50)
	)
END