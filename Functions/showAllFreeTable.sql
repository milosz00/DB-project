ALTER FUNCTION [dbo].[showAllFreeTable]
(
	@permise_id int,
	@startDate datetime,
	@endDate datetime
)
RETURNS 
@freeTablesId TABLE 
(
	-- Add the column definitions for the TABLE variable here
	table_id INT
)
AS
BEGIN
	
	DECLARE @countTables int = (SELECT TOP 1 table_id FROM dbo.tables ORDER BY table_id DESC);
	DECLARE @i int = 1;

	WHILE @i <= @countTables
	BEGIN
		IF EXISTS(
			SELECT * FROM tables WHERE table_id = @i and permises_id = @permise_id
		) and not EXISTS (SELECT * FROM tables_for_reservation tfr
								join reservations r  on tfr.reservation_id = r.reservation_id
								WHERE (tfr.table_id = @i and  (
								(@startDate < r.date and r.date < @endDate) 
								or (  @startDate <  DATEADD(hour, 2, r.date) and DATEADD(hour, 2, r.date) < @endDate)
								or (  @startDate <  r.date and DATEADD(hour, 2, r.date) < @endDate)
								or (  r.date < @startDate and @endDate  < DATEADD(hour, 2, r.date) ))))
		and not EXISTS (SELECT * from tables_in_covid tic join covid c on c.covid_id = tic.covid_id 
						WHERE (tic.table_id = @i and  (
								   (@startDate < c.start_date and c.start_date < @endDate) 
								or (@startDate < c.end_date   and c.end_date   < @endDate)
								or (@startDate < c.start_date and c.end_date   < @endDate )
								or (c.start_date < @startDate and @endDate     <c.end_date   ))))
		BEGIN		
			INSERT INTO @freeTablesId(table_id)
			VALUES(
				@i
			);
		END
		SET @i = @i + 1;
	END
	
	RETURN 
END