CREATE TABLE [dbo].[customers_individual](
	[customer_id] [int] NOT NULL,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
 CONSTRAINT [PK_customers_individual] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[customers_individual]  WITH CHECK ADD  CONSTRAINT [FK_customers_individual_customers] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([customer_id])
GO

ALTER TABLE [dbo].[customers_individual] CHECK CONSTRAINT [FK_customers_individual_customers]
GO