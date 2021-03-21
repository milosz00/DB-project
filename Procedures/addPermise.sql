ALTER PROCEDURE [dbo].[addPermise]
	-- Add the parameters for the stored procedure here
	@company_id int,
	@city varchar(40),
	@country varchar(40),
	@street varchar(60),
	@number int,
	@phone varchar(12)
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
		INSERT INTO permises(company_id,city,country,street,number,phone,is_active)
		VALUES(
			@company_id,
			@city,
			@country,
			@street,
			@number,
			@phone,
			0
		);

END