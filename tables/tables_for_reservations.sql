CREATE TABLE [dbo].[tables_for_reservation](
	[reservation_id] [int] NOT NULL,
	[table_id] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tables_for_reservation]  WITH CHECK ADD  CONSTRAINT [FK_tables_for_reservation_reservations] FOREIGN KEY([reservation_id])
REFERENCES [dbo].[reservations] ([reservation_id])
GO

ALTER TABLE [dbo].[tables_for_reservation] CHECK CONSTRAINT [FK_tables_for_reservation_reservations]
GO

ALTER TABLE [dbo].[tables_for_reservation]  WITH CHECK ADD  CONSTRAINT [FK_tables_for_reservation_tables] FOREIGN KEY([table_id])
REFERENCES [dbo].[tables] ([table_id])
GO

ALTER TABLE [dbo].[tables_for_reservation] CHECK CONSTRAINT [FK_tables_for_reservation_tables]
GO