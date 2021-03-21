CREATE VIEW [dbo].[OfferCompany]
AS
SELECT TOP 450 o.name,o.price,c.company_name FROM dbo.offer o
INNER JOIN dbo.company c ON o.company_id = c.company_id
ORDER BY c.company_name
GO