ALTER PROCEDURE [dbo].[addNewOfferItem]
	-- Add the parameters for the stored procedure here
	@company_id int,
	@price money,
	@name varchar(50)
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

	ELSE
		INSERT INTO offer(company_id,price,name,is_active)
		VALUES(
			@company_id,
			@price,
			@name,
			0
		);
END