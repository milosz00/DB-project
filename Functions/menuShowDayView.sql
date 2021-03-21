ALTER FUNCTION [dbo].[menuShowDayView] 
(	-- Add the parameters for the stored procedure here
	@company_id int,
	@date date)
RETURNS TABLE
AS
RETURN  (

	SELECT offer.name,offer.price FROM [menu details]
		join menu on menu.menu_id = [menu details].menu_id
		join offer on offer.offer_id = [menu details].offer_id
		where menu.menu_id = (SELECT top 1 menu_id FROM menu m
	WHERE @company_id =m.company_id and @date between m.start_date and m.end_date)
) 