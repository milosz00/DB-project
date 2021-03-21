ALTER PROCEDURE [dbo].[addTable]
	-- Add the parameters for the stored procedure here
	@permises_id INT,
	@capacity INT
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

	INSERT INTO tables(permises_id,capacity)
	VALUES(
		@permises_id,
		@capacity
	);
END