CREATE TABLE [dbo].[order details](
	[order_id] [int] NOT NULL,
	[offer_id] [int] NULL,
	[price] [money] NULL,
	[quantity] [int] NULL,
	[discount] [float] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[order details]  WITH CHECK ADD  CONSTRAINT [FK_order details_offer] FOREIGN KEY([offer_id])
REFERENCES [dbo].[offer] ([offer_id])
GO

ALTER TABLE [dbo].[order details] CHECK CONSTRAINT [FK_order details_offer]
GO

ALTER TABLE [dbo].[order details]  WITH CHECK ADD  CONSTRAINT [FK_order details_orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO

ALTER TABLE [dbo].[order details] CHECK CONSTRAINT [FK_order details_orders]
GO

ALTER TABLE [dbo].[order details]  WITH CHECK ADD  CONSTRAINT [CHC_Quantity_OD] CHECK  (([quantity]>(0)))
GO

ALTER TABLE [dbo].[order details] CHECK CONSTRAINT [CHC_Quantity_OD]
GO