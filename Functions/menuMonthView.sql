ALTER FUNCTION [dbo].[menuMonthView]
(	
	-- Add the parameters for the function here
	@company_id int,
	@date date
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT o.name FROM menu m 
	INNER JOIN [menu details] md ON md.menu_id = m.menu_id
	INNER JOIN offer o ON o.offer_id = md.offer_id
	WHERE YEAR(m.start_date) = YEAR(@date) AND MONTH(m.start_date) = MONTH(@date) AND m.company_id = @company_id 
)