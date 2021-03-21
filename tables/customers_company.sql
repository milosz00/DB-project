CREATE TABLE [dbo].[customers_company](
	[customer_id] [int] NOT NULL,
	[company_name] [varchar](100) NULL,
	[email] [varchar](50) NULL,
 CONSTRAINT [PK_customers_company] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_email_cus] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[customers_company]  WITH CHECK ADD  CONSTRAINT [FK_customers_company_customers] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([customer_id])
GO

ALTER TABLE [dbo].[customers_company] CHECK CONSTRAINT [FK_customers_company_customers]
GO