ALTER PROCEDURE [dbo].[addReservation]
	@order_id int,
	@expected_time time,
	@description text
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    DECLARE @orderValue money = ([dbo].[getOrderValue](@order_id))
	DECLARE @customer_id int = (SELECT customer_id from orders WHERE order_id = @order_id)
	DECLARE @permises_id int = (SELECT permises_id from orders WHERE order_id = @order_id)
	DECLARE @date date = (SELECT date from orders WHERE order_id = @order_id)
	DECLARE @customerOrdersCount int = (SELECT count(*) FROM orders where customer_id = @customer_id)

	IF @customerOrdersCount >= 5 and @orderValue < 50
	BEGIN
		;THROW 5200,'Order value is less than 50',1
	END

	IF @customerOrdersCount < 5 and @orderValue < 200
	BEGIN
		;THROW 5200,'You have less than 5 ordes and this order value is less than 200',1
	END

	
	-- Insert statements for procedure here
	INSERT INTO reservations(customer_id,permises_id,date,expected_time,description)
		VALUES(
			@customer_id ,
			@permises_id ,
			@date ,
			@expected_time ,
			@description 
		);
END