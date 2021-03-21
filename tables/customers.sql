CREATE TABLE [dbo].[customers](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NULL,
	[city] [varchar](40) NULL,
	[country] [varchar](40) NULL,
	[street] [varchar](60) NULL,
	[number] [int] NULL,
	[phone] [varchar](12) NULL,
 CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[customers]  WITH CHECK ADD  CONSTRAINT [FK_customers_company] FOREIGN KEY([company_id])
REFERENCES [dbo].[company] ([company_id])
GO

ALTER TABLE [dbo].[customers] CHECK CONSTRAINT [FK_customers_company]
GO