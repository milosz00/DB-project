CREATE TABLE [dbo].[tables](
	[table_id] [int] IDENTITY(1,1) NOT NULL,
	[permises_id] [int] NULL,
	[capacity] [int] NULL,
 CONSTRAINT [PK_tables] PRIMARY KEY CLUSTERED 
(
	[table_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tables]  WITH CHECK ADD  CONSTRAINT [FK_tables_permises] FOREIGN KEY([permises_id])
REFERENCES [dbo].[permises] ([permises_id])
GO

ALTER TABLE [dbo].[tables] CHECK CONSTRAINT [FK_tables_permises]
GO

ALTER TABLE [dbo].[tables]  WITH CHECK ADD  CONSTRAINT [CHC_Capacity] CHECK  (([capacity]>(0)))
GO

ALTER TABLE [dbo].[tables] CHECK CONSTRAINT [CHC_Capacity]
GO