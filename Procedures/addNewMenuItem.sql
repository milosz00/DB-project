ALTER PROCEDURE [dbo].[addNewMenuItem]
	-- Add the parameters for the stored procedure here
	@menu_id int,
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
		;THROW 55000 , 'This offer does not exists' , 1
	END

	IF NOT EXISTS
	(
		SELECT * FROM menu WHERE menu_id = @menu_id
	)
	BEGIN
		;THROW 56000 , 'This menu does not exists' , 1
	END

	IF  EXISTS
	(
		SELECT * FROM [menu details]WHERE menu_id = @menu_id and offer_id = @offer_id
	)
	BEGIN
		;THROW 56000 , 'This menu contains already this offer' , 1
	END

	DECLARE @menuStartDate date = (SELECT start_date from menu where @menu_id = menu_id)
	DECLARE @lastOutDate date =(SELECT last_out_date FROM offer WHERE offer_id = @offer_id)

	IF DATEDIFF(day,@lastOutDate,@menuStartDate) < 30
	BEGIN
		;THROW 56000 , 'You cannot add this offer yet' , 1
	END

	INSERT INTO [menu details](menu_id, offer_id)
	VALUES(
		@menu_id,
		@offer_id
	);
END