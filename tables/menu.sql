CREATE TABLE [dbo].[menu](
	[menu_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
 CONSTRAINT [PK_menu] PRIMARY KEY CLUSTERED 
(
	[menu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[menu]  WITH CHECK ADD  CONSTRAINT [FK_menu_firm] FOREIGN KEY([company_id])
REFERENCES [dbo].[company] ([company_id])
GO

ALTER TABLE [dbo].[menu] CHECK CONSTRAINT [FK_menu_firm]
GO