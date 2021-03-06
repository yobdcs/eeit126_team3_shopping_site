USE [TeamNO3]
GO
/****** Object:  Table [dbo].[MEMBER]    Script Date: 2021/4/6 下午 03:10:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MEMBER](
	[MEMBER_ID] [int] IDENTITY(1,1) NOT NULL,
	[ACCOUNT] [nvarchar](30) NOT NULL,
	[PASSWORD] [nvarchar](20) NOT NULL,
	[MEMBER_NAME] [nvarchar](20) NOT NULL,
	[GENDER] [nvarchar](10) NULL,
	[MEMBER_BIRTH] [nvarchar](20) NULL,
	[EMAIL] [nvarchar](50) NULL,
	[ADDR] [nvarchar](max) NULL,
 CONSTRAINT [PK__MEMBER__B1223B7068A4618F] PRIMARY KEY CLUSTERED 
(
	[MEMBER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MEMBER] ON 

INSERT [dbo].[MEMBER] ([MEMBER_ID], [ACCOUNT], [PASSWORD], [MEMBER_NAME], [GENDER], [MEMBER_BIRTH], [EMAIL], [ADDR]) VALUES (1, N'Tom123', N'Ksie456c', N'Tom', N'male', N'1985/12/04', N'ajcio13@gmail.com', N'桃園市中壢區中大路300號')
INSERT [dbo].[MEMBER] ([MEMBER_ID], [ACCOUNT], [PASSWORD], [MEMBER_NAME], [GENDER], [MEMBER_BIRTH], [EMAIL], [ADDR]) VALUES (3, N'tom9951', N'356dsz', N'tom', N'male', N'1984/12/05', N'tom9951@gmail.com', N'null')
INSERT [dbo].[MEMBER] ([MEMBER_ID], [ACCOUNT], [PASSWORD], [MEMBER_NAME], [GENDER], [MEMBER_BIRTH], [EMAIL], [ADDR]) VALUES (5, N'test', N'test', N'test', N'female', N'1985/04/12', N'test@gmail.com', N'測試')
INSERT [dbo].[MEMBER] ([MEMBER_ID], [ACCOUNT], [PASSWORD], [MEMBER_NAME], [GENDER], [MEMBER_BIRTH], [EMAIL], [ADDR]) VALUES (9, N'amy456', N'kidos75365', N'amy', N'female', N'1952/08/06', N'amy456@gmail.com', N'test')
INSERT [dbo].[MEMBER] ([MEMBER_ID], [ACCOUNT], [PASSWORD], [MEMBER_NAME], [GENDER], [MEMBER_BIRTH], [EMAIL], [ADDR]) VALUES (13, N'kitty567', N'dakld12358', N'kitty', N'female', N'1952/08/19', N'kitty567@gmail.com', N'test')
INSERT [dbo].[MEMBER] ([MEMBER_ID], [ACCOUNT], [PASSWORD], [MEMBER_NAME], [GENDER], [MEMBER_BIRTH], [EMAIL], [ADDR]) VALUES (14, N'wiley15', N'y=cKKy;!wx6U', N'白承承', N'male', N'1952/08/06', N'wiley15@gmail.com', N'test')
INSERT [dbo].[MEMBER] ([MEMBER_ID], [ACCOUNT], [PASSWORD], [MEMBER_NAME], [GENDER], [MEMBER_BIRTH], [EMAIL], [ADDR]) VALUES (15, N'chandler.toy', N'oj`''YIV46suO', N'東思柏', N'male', N'October 14, 1937', N'chandler.toy@gmail.com', N'429 高雄市燕巢區大慶街751巷938弄957號79樓')
INSERT [dbo].[MEMBER] ([MEMBER_ID], [ACCOUNT], [PASSWORD], [MEMBER_NAME], [GENDER], [MEMBER_BIRTH], [EMAIL], [ADDR]) VALUES (20, N'kls361csd', N'kls361csd', N'amy', N'female', N'1952/08/06', N'amy456@gmail.com', N'sdf')
INSERT [dbo].[MEMBER] ([MEMBER_ID], [ACCOUNT], [PASSWORD], [MEMBER_NAME], [GENDER], [MEMBER_BIRTH], [EMAIL], [ADDR]) VALUES (21, N'dsfakl123', N'dsfakl123', N'dsfakl123', N'female', N'1962/08/25', N'dsfakl123@gmail.com', N'dsfakl123')
INSERT [dbo].[MEMBER] ([MEMBER_ID], [ACCOUNT], [PASSWORD], [MEMBER_NAME], [GENDER], [MEMBER_BIRTH], [EMAIL], [ADDR]) VALUES (22, N'fkle56', N'fkle56', N'fkle56', N'female', N'1952/11/19', N'fkle56@gmail.com', N'fkle56')
INSERT [dbo].[MEMBER] ([MEMBER_ID], [ACCOUNT], [PASSWORD], [MEMBER_NAME], [GENDER], [MEMBER_BIRTH], [EMAIL], [ADDR]) VALUES (23, N'turcotte', N'/5~42pc1xDS#JbKA', N'sylvia', N'male', N'1966/06/22', N'kreiger.terrell@hotmail.com', N'397-56 高雄市旗津區太平街四段543巷530弄184號')
INSERT [dbo].[MEMBER] ([MEMBER_ID], [ACCOUNT], [PASSWORD], [MEMBER_NAME], [GENDER], [MEMBER_BIRTH], [EMAIL], [ADDR]) VALUES (24, N'john45932', N'john45932', N'john', N'male', N'1952/08/06', N'amy456@gmail.com', N'test')
INSERT [dbo].[MEMBER] ([MEMBER_ID], [ACCOUNT], [PASSWORD], [MEMBER_NAME], [GENDER], [MEMBER_BIRTH], [EMAIL], [ADDR]) VALUES (25, N'321pk', N'321pk', N'ann', N'female', N'1952/08/06', N'amy456@gmail.com', N'test')
INSERT [dbo].[MEMBER] ([MEMBER_ID], [ACCOUNT], [PASSWORD], [MEMBER_NAME], [GENDER], [MEMBER_BIRTH], [EMAIL], [ADDR]) VALUES (26, N'yobdcs', N't9307329', N'ys', N'male', N'1992/07/31', N'test@gmial.com', N'asdfg')
SET IDENTITY_INSERT [dbo].[MEMBER] OFF
GO
