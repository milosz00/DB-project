ALTER FUNCTION [dbo].[menuWeekView](@company_id int, @date date)
RETURNS TABLE
AS
RETURN
(
	SELECT o.name,o.price FROM offer o
	INNER JOIN [menu details] md ON md.offer_id = o.offer_id
	INNER JOIN menu m ON m.menu_id = md.menu_id
	INNER JOIN company c ON c.company_id = m.company_id
	WHERE (m.start_date <= @date AND m.end_date >= @date)
			AND c.company_id = @company_id
)