ALTER PROCEDURE [dbo].[deleteTable]
	-- Add the parameters for the stored procedure here
	@table_id int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF NOT EXISTS(
		SELECT * FROM dbo.tables
		WHERE table_id = @table_id
	)
	BEGIN
		;THROW 52000, 'This table does not exists' , 1
	END

	DELETE FROM dbo.tables
	WHERE table_id = @table_id

END