ALTER PROCEDURE [dbo].[changeCompanyDiscountSteps]
	-- Add the parameters for the stored procedure here
	@company_id int,
	@z1 int,
	@k1 money,
	@r1 float,
	@k2 money,
	@r2 float,
	@d1 int,
	@k3 money,
	@r3 float,
	@d2 int,
	@fz int,
	@fk1 money,
	@fr1 float,
	@fm float,
	@fk2 money,
	@fr2 float
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
		UPDATE discounts_steps
			SET
				z1 = @z1,
				k1 = @k1,
				r1 = @r1,
				k2 = @k2,
				r2 = @r2,
				d1 = @d1,
				k3 = @k3,
				r3 = @r3,
				d2 = @d2,
				fz = @fz,
				fk1 = @fk1,
				fr1 = @fr1,
				fm = @fm,
				fk2 = @fk2,
				fr2 = @fr2
			WHERE company_id = @company_id
END