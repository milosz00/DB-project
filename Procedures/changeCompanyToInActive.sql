ALTER PROCEDURE [dbo].[changeCompanyToInactive] 
	-- Add the parameters for the stored procedure here
	@company_id int
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

	IF (SELECT is_active FROM company WHERE company_id = @company_id) = 0
	BEGIN
		;THROW 52001, 'This company has already Inactive!' , 1
	END
	ELSE
		UPDATE company
			SET is_active = 0
			WHERE company_id = @company_id;
		
END
