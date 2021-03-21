ALTER PROCEDURE [dbo].[addNewMenu]
	-- Add the parameters for the stored procedure here
	@company_id int,
	@start_date date,
	@end_date date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF DATEDIFF(day,@start_date,@end_date) > 14
	BEGIN
		;THROW 52000, 'To long preoid time' , 1
	END

	IF DATEDIFF(day,@start_date,@end_date) < 0
	BEGIN
		;THROW 52000, 'End date is before start date' , 1
	END

	DECLARE @lastMenuEndDate date = (SELECT TOP 1 end_date from menu where company_id = @company_id order by end_date DESC)
	DECLARE @lastMenuID int = (SELECT TOP 1 menu_id from menu where company_id = @company_id order by end_date DESC)

	IF  (@lastMenuEndDate IS NOT  NULL ) and DATEDIFF(day,@lastMenuEndDate,@start_date) <> 1
	BEGIN
		;THROW 52000, 'The menus are discontinuous' , 1
	END

	IF NOT EXISTS(
		SELECT * FROM company
		WHERE company_id = @company_id
	)
	BEGIN
		;THROW 52000, 'This company does not exists' , 1
	END
	ELSE
	BEGIN
		INSERT INTO menu(company_id,start_date,end_date)
		VALUES(
			@company_id,
			@start_date,
			@end_date
		);

	declare @actualMenuId int = (SELECT menu_id 
								FROM menu 
								WHERE company_id = @company_id 
								and start_date = @start_date 
								and end_date = @end_date) 

	declare @maxMeduDetailsId int  = (SELECT TOP 1 menu_detail_id FROM [menu details] ORDER BY menu_detail_id DESC);
	declare @i int = 1

	WHILE @i <= @maxMeduDetailsId
	
		IF EXISTS(
			SELECT * FROM [menu details] WHERE menu_detail_id = @i and menu_id = @lastMenuID
		)  
		BEGIN
			DECLARE @offer_id int = (SELECT offer_id FROM [menu details] WHERE menu_detail_id = @i and menu_id = @lastMenuID)

			INSERT INTO [menu details](offer_id,menu_id)
			VALUES(
				(@offer_id ),
				(@actualMenuId )
			);
		END
		SET @i = @i + 1;
	END



    -- Insert statements for procedure here
	
END