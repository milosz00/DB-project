ALTER PROCEDURE [dbo].[addItemToOrder] 
	-- Add the parameters for the stored procedure here
	@order_id int,
	@offer_id int,
	@quantity int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    IF NOT EXISTS
	(
		SELECT * FROM orders WHERE order_id = @order_id
	)
	BEGIN
		;THROW 56000 , 'This order does not exists' , 1
	END
	ELSE
	BEGIN 
		DECLARE @userdiscount float
		DECLARE @customer_id int  = (SELECT customer_id from orders where orders.order_id = @order_id)
		IF [dbo].isIdnividualCustomer(@customer_id) = 1
		BEGIN
			SELECT @userDiscount = discount from [dbo].customerIndividualDiscountsView(@customer_id)
		END
		ELSE
		BEGIN
			SELECT @userDiscount = discount from [dbo].customerCompanyDiscountsView(@customer_id)
		END
		
		INSERT INTO [order details](order_id,offer_id,price,quantity,discount)
		VALUES(
			@order_id ,
			@offer_id ,
			(SELECT price FROM dbo.offer WHERE offer_id = @offer_id),
			@quantity ,
			@userDiscount
		);
	END
END