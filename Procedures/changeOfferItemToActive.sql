ALTER PROCEDURE [dbo].[changeOfferItemToActive]
	-- Add the parameters for the stored procedure here
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
		UPDATE offer
			SET is_active = 1
			WHERE offer_id = @offer_id
END