ALTER PROCEDURE [dbo].[dismissEmployee] 
	@employee_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE [employees]
	set is_active = 0
	WHERE [employees].employee_id = @employee_id
END