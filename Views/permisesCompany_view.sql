CREATE VIEW [dbo].[permisesCompany]
AS
SELECT TOP 61 c.company_name,p.country,p.city,p.street,p.phone FROM dbo.permises p
INNER JOIN dbo.company c ON p.company_id = c.company_id
ORDER BY c.company_name
GO