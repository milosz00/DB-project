CREATE TABLE [dbo].[products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NULL,
	[product_name] [varchar](50) NULL,
 CONSTRAINT [PK_ingriedents] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_company] FOREIGN KEY([company_id])
REFERENCES [dbo].[company] ([company_id])
GO

ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_company]
GO