ALTER FUNCTION [dbo].[countMonthReservationsView]
(	
	-- Add the parameters for the function here
	@permises_id int,
	@date date
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT COUNT(*) countReservations , MONTH(r.date) MonthNumber  FROM permises p
	INNER JOIN tables t ON t.permises_id = p.permises_id
	INNER JOIN tables_for_reservation tfr ON tfr.table_id = t.table_id
	INNER JOIN reservations r ON r.reservation_id = tfr.reservation_id
	WHERE p.permises_id = @permises_id AND YEAR(r.date) = YEAR(@date)
	GROUP BY MONTH(r.date)
)