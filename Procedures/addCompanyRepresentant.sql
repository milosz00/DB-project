ALTER PROCEDURE [dbo].[addCompanyRepresentative]
	-- Add the parameters for the stored procedure here
	@company_id int,
	@first_name varchar(50),
	@last_name varchar(50),
	@phone varchar(12),
	@address varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    IF NOT EXISTS(
		SELECT * FROM company
		WHERE company_id = @company_id
	)
	BEGIN
		;THROW 52000, 'This company does not exists' , 1
	END

	INSERT INTO employees(permises_id,company_id,first_name,last_name,reports_to,address,is_active,phone,position)
	VALUES(
		NULL,
		@company_id,
		@first_name,
		@last_name,
		NULL,
		@address,
		1,
		@phone,
		'Representative'
	);
END