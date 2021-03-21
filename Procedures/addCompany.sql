CREATE PROCEDURE [dbo].[addCompany]
	-- Add the parameters for the stored procedure here
	@company_name varchar(50),
	@email varchar(50),
	@phone varchar(12),
	@home_page varchar(100),
	@city varchar(40),
	@country varchar(40),
	@street varchar(60),
	@number int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO company(company_name,email,phone,home_page,city,country,street,number,is_active)
	VALUES(
		@company_name,
		@email,
		@phone,
		@home_page,
		@city,
		@country,
		@street,
		@number,
		0
	);
END
GO