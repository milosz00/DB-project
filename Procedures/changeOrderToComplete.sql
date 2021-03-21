ALTER PROCEDURE [dbo].[changeOrderToComplete] 
	-- Add the parameters for the stored procedure here
	@order_id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF NOT EXISTS(
		SELECT * FROM orders
		WHERE orders.order_id = @order_id
	)
	BEGIN
		;THROW 54000, 'This order does not exists' , 1
	END

	UPDATE orders
		SET is_completed = 1
		WHERE order_id = @order_id
END