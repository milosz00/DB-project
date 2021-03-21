ALTER PROCEDURE [dbo].[addProductToPermiseStock]
	-- Add the parameters for the stored procedure here
	@permises_id INT,
	@product_id INT,
	@units_in_stock INT,
	@minimum_units_in_stock INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF NOT EXISTS(
		SELECT * FROM dbo.permises
		WHERE permises_id = @permises_id
	)
	BEGIN
		;THROW 52000, 'This permise does not exists' , 1
	END


	INSERT INTO stock(permises_id,product_id,units_in_stock,minimum_units_in_stock)
	VALUES(
		@permises_id,
		@product_id,
		@units_in_stock,
		@minimum_units_in_stock
	)
END