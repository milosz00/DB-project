CREATE TABLE [dbo].[reservations](
	[reservation_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[permises_id] [int] NULL,
	[order_id] [int] NULL,
	[date] [datetime] NULL,
	[expected_time] [time](7) NULL,
	[description] [varchar](200) NULL,
 CONSTRAINT [reservation_id_index] PRIMARY KEY CLUSTERED 
(
	[reservation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[reservations]  WITH CHECK ADD  CONSTRAINT [FK_reservations_customers] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([customer_id])
GO

ALTER TABLE [dbo].[reservations] CHECK CONSTRAINT [FK_reservations_customers]
GO

ALTER TABLE [dbo].[reservations]  WITH CHECK ADD  CONSTRAINT [FK_reservations_orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO

ALTER TABLE [dbo].[reservations] CHECK CONSTRAINT [FK_reservations_orders]
GO

ALTER TABLE [dbo].[reservations]  WITH CHECK ADD  CONSTRAINT [FK_reservations_permises] FOREIGN KEY([permises_id])
REFERENCES [dbo].[permises] ([permises_id])
GO

ALTER TABLE [dbo].[reservations] CHECK CONSTRAINT [FK_reservations_permises]
GO