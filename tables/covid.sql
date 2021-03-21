CREATE TABLE [dbo].[covid](
	[covid_id] [int] IDENTITY(1,1) NOT NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
 CONSTRAINT [PK_covid] PRIMARY KEY CLUSTERED 
(
	[covid_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[covid]  WITH CHECK ADD  CONSTRAINT [CHC_Start_End_date] CHECK  (([start_date]<[end_date]))
GO

ALTER TABLE [dbo].[covid] CHECK CONSTRAINT [CHC_Start_End_date]
GO