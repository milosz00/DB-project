CREATE VIEW [dbo].[company_discounts] AS
SELECT company_name,discounts_steps.* FROM company
		join discounts_steps on discounts_steps.company_id = company.company_id
GO