CREATE TABLE [dbo].[stock](
	[stock_id] [int] IDENTITY(1,1) NOT NULL,
	[permises_id] [int] NULL,
	[product_id] [int] NULL,
	[units_in_stock] [int] NULL,
	[minimum_units_in_stock] [int] NULL,
 CONSTRAINT [PK_stock] PRIMARY KEY CLUSTERED 
(
	[stock_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[stock]  WITH CHECK ADD  CONSTRAINT [FK_stock_permises] FOREIGN KEY([permises_id])
REFERENCES [dbo].[permises] ([permises_id])
GO

ALTER TABLE [dbo].[stock] CHECK CONSTRAINT [FK_stock_permises]
GO

ALTER TABLE [dbo].[stock]  WITH CHECK ADD  CONSTRAINT [FK_stock_products] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO

ALTER TABLE [dbo].[stock] CHECK CONSTRAINT [FK_stock_products]
GO

ALTER TABLE [dbo].[stock]  WITH CHECK ADD  CONSTRAINT [CHC_Min_Unit_In_STOCK] CHECK  (([minimum_units_in_stock]>(0)))
GO

ALTER TABLE [dbo].[stock] CHECK CONSTRAINT [CHC_Min_Unit_In_STOCK]
GO