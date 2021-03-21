CREATE TABLE [dbo].[employees](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[permises_id] [int] NULL,
	[company_id] [int] NULL,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	[reports_to] [int] NULL,
	[address] [varchar](100) NULL,
	[is_active] [bit] NULL,
	[phone] [varchar](12) NULL,
	[position] [varchar](50) NULL,
 CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[employees]  WITH CHECK ADD  CONSTRAINT [FK_employees_employees] FOREIGN KEY([reports_to])
REFERENCES [dbo].[employees] ([employee_id])
GO

ALTER TABLE [dbo].[employees] CHECK CONSTRAINT [FK_employees_employees]
GO

ALTER TABLE [dbo].[employees]  WITH CHECK ADD  CONSTRAINT [FK_employees_firm] FOREIGN KEY([company_id])
REFERENCES [dbo].[company] ([company_id])
GO

ALTER TABLE [dbo].[employees] CHECK CONSTRAINT [FK_employees_firm]
GO

ALTER TABLE [dbo].[employees]  WITH CHECK ADD  CONSTRAINT [FK_employees_permises] FOREIGN KEY([permises_id])
REFERENCES [dbo].[permises] ([permises_id])
GO

ALTER TABLE [dbo].[employees] CHECK CONSTRAINT [FK_employees_permises]
GO