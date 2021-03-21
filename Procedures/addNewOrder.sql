ALTER PROCEDURE [dbo].[addNewOrder]  
	-- Add the parameters for the stored procedure here
	@customer_id int,
	@permises_id int,
	@date date
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF NOT EXISTS(
		SELECT * FROM permises
		WHERE permises_id = @permises_id
	)
	BEGIN
		;THROW 54000, 'This permise does not exists' , 1
	END

	IF NOT EXISTS(
		SELECT * FROM customers
		WHERE customer_id = @customer_id
	)
	BEGIN
		;THROW 54000, 'This custormer does not exists' , 1
	END
   INSERT INTO orders(customer_id,permises_id,date,is_served,is_completed)
		VALUES(
			@customer_id ,
			@permises_id ,
			@date ,
			0,
			0
		);
END