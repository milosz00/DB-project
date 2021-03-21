ALTER PROCEDURE [dbo].[addNewCovidLimit]
	-- Add the parameters for the stored procedure here
	@start_date date,
	@end_date date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF @start_date >= @end_date
	BEGIN
		THROW 52000 , 'Start Date cannot be later than End Date' , 1;
	END


    -- Insert statements for procedure here
	INSERT INTO covid(start_date, end_date)
	VALUES(
		@start_date,
		@end_date
	);
END