CREATE VIEW [dbo].[customer_company_data] AS
SELECT company_name,email,city,country,street,number,phone
FROM customers_company
	join customers on customers.customer_id = customers_company.customer_id
GO