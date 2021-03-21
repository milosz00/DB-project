ALTER PROCEDURE [dbo].[addTableInCovidPeriod]
	-- Add the parameters for the stored procedure here
	@table_id int,
	@covid_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO tables_in_covid(table_id,covid_id)
	VALUES(
		@table_id,
		@covid_id
	);
END