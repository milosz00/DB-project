ALTER PROCEDURE [dbo].[deleteMenuItem]
	
	@menu_id int,
	@offer_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF NOT EXISTS(
		SELECT * FROM menu
		WHERE menu_id = @menu_id
	)
	BEGIN
		;THROW 52000, 'This menu does not exists' , 1
	END

	IF NOT EXISTS(
		SELECT * FROM [menu details]
		WHERE menu_id = @menu_id and offer_id = @offer_id
	)
	BEGIN
		;THROW 52000, 'This menu does not have this offer ' , 1
	END

	DECLARE @menuStartDate date = (SELECT start_date from menu where menu_id = @menu_id)

	DELETE FROM [menu details]
	WHERE menu_id = @menu_id and offer_id = @offer_id

	UPDATE offer
	SET offer.last_out_date = @menuStartDate
	where offer_id = @offer_id

END