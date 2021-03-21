CREATE TABLE [dbo].[discounts](
	[customer_id] [int] NOT NULL,
	[company_id] [int] NULL,
	[k1_order_counter] [int] NULL,
	[k2_received_date] [date] NULL,
	[k3_received_date] [date] NULL,
	[fk1_last_month] [date] NULL,
	[fk1_month_counter] [int] NULL,
	[fk2_received_date] [date] NULL,
 CONSTRAINT [PK_discounts] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[discounts]  WITH CHECK ADD  CONSTRAINT [FK_discounts_customers] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([customer_id])
GO

ALTER TABLE [dbo].[discounts] CHECK CONSTRAINT [FK_discounts_customers]
GO

ALTER TABLE [dbo].[discounts]  WITH CHECK ADD  CONSTRAINT [FK_rabats_firm] FOREIGN KEY([company_id])
REFERENCES [dbo].[company] ([company_id])
GO

ALTER TABLE [dbo].[discounts] CHECK CONSTRAINT [FK_rabats_firm]
GO