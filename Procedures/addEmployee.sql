ALTER PROCEDURE [dbo].[addEmployee]
	@permises_id int,
	@company_id int,
	@first_name varchar(50),
	@last_name varchar(50),
	@phone varchar(12),
	@address varchar(100),
	@reports_to int,
	@position varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO employees(permises_id,company_id,first_name,last_name,phone,address,is_active,reports_to,position)
		VALUES(
			@permises_id ,
			@company_id ,
			@first_name,
			@last_name ,
			@phone ,
			@address ,
			1 ,
			@reports_to,
			@position
		);
END