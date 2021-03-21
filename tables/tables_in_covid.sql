CREATE TABLE [dbo].[tables_in_covid](
	[table_id] [int] NULL,
	[covid_id] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tables_in_covid]  WITH CHECK ADD  CONSTRAINT [FK_tables_in_covid_covid] FOREIGN KEY([covid_id])
REFERENCES [dbo].[covid] ([covid_id])
GO

ALTER TABLE [dbo].[tables_in_covid] CHECK CONSTRAINT [FK_tables_in_covid_covid]
GO

ALTER TABLE [dbo].[tables_in_covid]  WITH CHECK ADD  CONSTRAINT [FK_tables_in_covid_tables] FOREIGN KEY([table_id])
REFERENCES [dbo].[tables] ([table_id])
GO

ALTER TABLE [dbo].[tables_in_covid] CHECK CONSTRAINT [FK_tables_in_covid_tables]
GO