ALTER PROCEDURE [dbo].[updateUnitsInStock]
	-- Add the parameters for the stored procedure here
	@stock_id INT,
	@units INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS
	(
		SELECT * FROM dbo.stock WHERE stock_id = @stock_id
	)
	BEGIN
		UPDATE dbo.stock
		SET units_in_stock = units_in_stock + @units
		WHERE stock_id = @stock_id
	END
	ELSE
		THROW 52000, 'This position does not exists in stock', 1

END