USE [TeamNO3]
GO
/****** Object:  Table [dbo].[act_cross_product]    Script Date: 2021/4/19 下午 09:13:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[act_cross_product](
	[id_acp] [int] IDENTITY(1,1) NOT NULL,
	[id_product_acp] [varchar](255) NULL,
	[promotion_prodcutbyid] [numeric](19, 2) NULL,
	[promotion_productbycate] [numeric](19, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_acp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
