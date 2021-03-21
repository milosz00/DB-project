CREATE VIEW [dbo].[customer_individual_data] AS
SELECT first_name,last_name,city,country,street,number,phone
FROM customers_individual 
	join customers on customers.customer_id = customers_individual.customer_id
GO