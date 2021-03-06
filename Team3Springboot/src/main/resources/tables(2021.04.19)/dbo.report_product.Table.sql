USE [TeamNO3]
GO
/****** Object:  Table [dbo].[report_product]    Script Date: 2021/4/19 下午 09:13:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_product](
	[event_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[product_name] [varchar](255) NULL,
	[report_description] [varchar](255) NULL,
	[report_type] [varchar](255) NULL,
	[report_vision] [int] NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[event_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
