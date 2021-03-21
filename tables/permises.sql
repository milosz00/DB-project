CREATE TABLE [dbo].[permises](
	[permises_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[city] [varchar](40) NULL,
	[country] [varchar](40) NULL,
	[street] [varchar](60) NULL,
	[number] [int] NULL,
	[phone] [varchar](12) NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_permises] PRIMARY KEY CLUSTERED 
(
	[permises_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_phone] UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[permises]  WITH CHECK ADD  CONSTRAINT [FK_permises_firm] FOREIGN KEY([company_id])
REFERENCES [dbo].[company] ([company_id])
GO

ALTER TABLE [dbo].[permises] CHECK CONSTRAINT [FK_permises_firm]
G