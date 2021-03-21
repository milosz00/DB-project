CREATE TABLE [dbo].[recipes](
	[product_id] [int] NULL,
	[quantity] [float] NULL,
	[offer_id] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[recipes]  WITH CHECK ADD  CONSTRAINT [FK_recipes_offer] FOREIGN KEY([offer_id])
REFERENCES [dbo].[offer] ([offer_id])
GO

ALTER TABLE [dbo].[recipes] CHECK CONSTRAINT [FK_recipes_offer]
GO

ALTER TABLE [dbo].[recipes]  WITH CHECK ADD  CONSTRAINT [FK_recipes_products] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO

ALTER TABLE [dbo].[recipes] CHECK CONSTRAINT [FK_recipes_products]
GO

ALTER TABLE [dbo].[recipes]  WITH CHECK ADD  CONSTRAINT [CHC_Quantity] CHECK  (([quantity]>(0)))
GO

ALTER TABLE [dbo].[recipes] CHECK CONSTRAINT [CHC_Quantity]
GO