ALTER PROCEDURE [dbo].[addNewProductToRecipe] 
	-- Add the parameters for the stored procedure here
	@product_id int,
	@quantity int,
	@offer_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF NOT EXISTS
	(
		SELECT * FROM offer WHERE offer_id = @offer_id
	)
	BEGIN
		;THROW 56000 , 'This offer does not exists' , 1
	END

	ELSE
		INSERT INTO recipes(product_id,quantity,offer_id)
		VALUES(
			@product_id,
			@quantity,
			@offer_id
		);
END
