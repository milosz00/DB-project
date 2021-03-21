CREATE TABLE [dbo].[discounts_steps](
	[company_id] [int] NOT NULL,
	[z1] [int] NULL,
	[k1] [money] NULL,
	[r1] [float] NULL,
	[k2] [money] NULL,
	[r2] [float] NULL,
	[d1] [int] NULL,
	[k3] [money] NULL,
	[r3] [float] NULL,
	[d2] [int] NULL,
	[fz] [int] NULL,
	[fk1] [money] NULL,
	[fr1] [float] NULL,
	[fm] [float] NULL,
	[fk2] [money] NULL,
	[fr2] [float] NULL,
 CONSTRAINT [PK_discounts_steps] PRIMARY KEY CLUSTERED 
(
	[company_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[discounts_steps]  WITH CHECK ADD  CONSTRAINT [FK_rabats_steps_firm] FOREIGN KEY([company_id])
REFERENCES [dbo].[company] ([company_id])
GO

ALTER TABLE [dbo].[discounts_steps] CHECK CONSTRAINT [FK_rabats_steps_firm]
GO

ALTER TABLE [dbo].[discounts_steps]  WITH CHECK ADD  CONSTRAINT [CHC_discounts] CHECK  (([r1]<(1) AND [r2]<(1) AND [r3]<(1) AND [fr1]<(1) AND [fr2]<(1) AND [fm]<(1)))
GO

ALTER TABLE [dbo].[discounts_steps] CHECK CONSTRAINT [CHC_discounts]
GO