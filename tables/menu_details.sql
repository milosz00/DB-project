CREATE TABLE [dbo].[menu details](
	[menu_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[menu_id] [int] NOT NULL,
	[offer_id] [int] NULL,
 CONSTRAINT [PK_menu details] PRIMARY KEY CLUSTERED 
(
	[menu_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[menu details]  WITH CHECK ADD  CONSTRAINT [FK_menu details_menu] FOREIGN KEY([menu_id])
REFERENCES [dbo].[menu] ([menu_id])
GO

ALTER TABLE [dbo].[menu details] CHECK CONSTRAINT [FK_menu details_menu]
GO

ALTER TABLE [dbo].[menu details]  WITH CHECK ADD  CONSTRAINT [FK_menu details_offer] FOREIGN KEY([offer_id])
REFERENCES [dbo].[offer] ([offer_id])
GO

ALTER TABLE [dbo].[menu details] CHECK CONSTRAINT [FK_menu details_offer]
GO