CREATE TABLE [dbo].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[permises_id] [int] NULL,
	[date] [datetime] NULL,
	[is_served] [nchar](10) NULL,
	[is_completed] [bit] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_customers] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([customer_id])
GO

ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_customers]
GO

ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_permises] FOREIGN KEY([permises_id])
REFERENCES [dbo].[permises] ([permises_id])
GO

ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_permises]
GO