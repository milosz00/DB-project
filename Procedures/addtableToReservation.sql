ALTER PROCEDURE [dbo].[addTableToReservation] 
	-- Add the parameters for the stored procedure here
	@reservation_id int,
	@table_id int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @customer_id int = (SELECT customer_id from reservations where reservation_id = @reservation_id)
	DECLARE @countTablesReserved int = (SELECT count(*) from 
										tables_for_reservation 
										where reservation_id = @reservation_id )

	DECLARE @startDate datetime =  (SELECT date from reservations where reservation_id = @reservation_id)
	Declare @endData datetime = DATEADD(hour, 2, '12/30/06 2:00:00')
	DECLARE @permise_id int = (SELECT permises_id from reservations where reservation_id = @reservation_id)
	IF [dbo].isIdnividualCustomer(@customer_id) = 1 and @countTablesReserved >= 2
	BEGIN
		THROW 56000 , 'You cannot add more tables' , 1 
	END
	
	IF @table_id not in (select * from [dbo].showAllfreeTable(@permise_id,@startDate,@endData) )
	BEGIN
		THROW 56000 , 'This table is not free' , 1 
	END

	IF EXISTS (SELECT * 
			FROM tables_for_reservation 
			where table_id = @table_id and @reservation_id = reservation_id)
	BEGIN
		THROW 56000 , 'This reservation have already this table' , 1 
	END

    -- Insert statements for procedure here
	INSERT INTO tables_for_reservation(reservation_id,table_id)
		VALUES(
			@reservation_id ,
			@table_id 
		);
END