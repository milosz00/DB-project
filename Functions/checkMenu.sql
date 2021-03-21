ALTER FUNCTION [dbo].[checkMenu] 
(
	@menu_id int
)
RETURNS float 
AS
BEGIN

	DECLARE @menuBeforeId int = (SELECT top 1 menu_id 
			FROM menu 
			where end_date < (select start_date from menu where menu_id = @menu_id)
			order by end_date DESC)

	DECLARE @actualMenuSize float = (SELECT count(*) FROM [menu details] where  menu_id = @menu_id)

	DECLARE @identicalPositnion float  = (SELECT count(*) FROM (
														(SELECT offer_id FROM [menu details] where  menu_id = @menu_id)
														INTERSECT
													(SELECT offer_id FROM [menu details] where  menu_id = @menuBeforeId)) as tab)
	IF @identicalPositnion/@actualMenuSize < 0.5
	BEGIN
		return 1
	END

	return 0


END