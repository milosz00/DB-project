CREATE TABLE [dbo].[offer](
	[company_id] [int] NULL,
	[offer_id] [int] IDENTITY(1,1) NOT NULL,
	[price] [money] NULL,
	[name] [varchar](50) NULL,
	[last_out_date] [date] NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_offer] PRIMARY KEY CLUSTERED 
(
	[offer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[offer]  WITH CHECK ADD  CONSTRAINT [FK_offer_firm] FOREIGN KEY([company_id])
REFERENCES [dbo].[company] ([company_id])
GO

ALTER TABLE [dbo].[offer] CHECK CONSTRAINT [FK_offer_firm]
GO

ALTER TABLE [dbo].[offer]  WITH CHECK ADD  CONSTRAINT [CHK_Price] CHECK  (([price]>(0)))
GO

ALTER TABLE [dbo].[offer] CHECK CONSTRAINT [CHK_Price]
GO