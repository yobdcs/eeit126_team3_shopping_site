USE [TeamNO3]
GO
/****** Object:  Table [dbo].[chatroom]    Script Date: 2021/4/19 下午 09:13:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chatroom](
	[chat_id] [int] IDENTITY(1,1) NOT NULL,
	[acceptor] [varchar](255) NULL,
	[mailer] [varchar](255) NULL,
	[chat_message] [varchar](255) NULL,
	[time] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[chat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[chatroom] ON 

INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (1, N'test', N'qwert', N'有現貨嗎 我要十個', N'2021-04-11 11:27:40')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (2, N'123121', N'test', N'你好，還有現貨嗎?', N'2021-04-11 11:37:07')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (3, N'hello test', N'zzzzz', N'請問可以接在lite上面嗎？謝謝', N'2021-04-11 11:37:19')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (4, N'zzzzz', N'test', N'再請問接上XBOX手把是否有支援震動呢', N'2021-04-11 11:39:22')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (5, N'test', N'test', N'可以配對ps4手把在Switch主機上遊玩', N'2021-04-11 14:34:38')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (6, N'test', N'test', N'請問有現貨嗎
TYPE-C OTG轉接會提供還是需要自己買', N'2021-04-11 14:58:09')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (7, N'test', N'test', N'這項商品還有存貨嗎?', N'2021-04-11 15:06:56')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (8, N'test', N'test', N'再請問接上XBOX手把是否有支援震動呢', N'2021-04-11 15:53:23')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (9, N'test', N'zzzzz', N'你好，還有現貨嗎?', N'2021-04-11 15:54:40')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (10, N'test', N'test', N'有現貨嗎 我要十個', N'2021-04-12 15:13:35')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (11, N'test', N'test', N'請問有現貨嗎
TYPE-C OTG轉接會提供還是需要自己買', N'2021-04-12 15:13:36')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (12, N'test', N'test', N'請問可以接在lite上面嗎？謝謝', N'2021-04-12 15:17:40')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (13, N'test', N'test', N'你好，還有現貨嗎?', N'2021-04-12 15:17:43')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (14, N'test', N'test', N'有現貨嗎 我要十個', N'2021-04-12 15:17:44')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (15, N'test', N'test', N'請問可以接在lite上面嗎？謝謝', N'2021-04-12 15:17:44')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (16, N'test', N'test', N'再請問接上XBOX手把是否有支援震動呢', N'2021-04-12 15:17:45')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (17, N'test', N'test', N'可以配對ps4手把在Switch主機上遊玩', N'2021-04-12 15:17:45')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (18, N'test', N'test', N'你好，還有現貨嗎?', N'2021-04-12 15:17:45')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (19, N'test', N'test', N'可以配對ps4手把在Switch主機上遊玩', N'2021-04-12 15:17:45')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (20, N'test', N'test', N'請問有現貨嗎
TYPE-C OTG轉接會提供還是需要自己買', N'2021-04-12 15:17:48')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (21, N'test', N'test', N'這項商品還有存貨嗎?', N'2021-04-13 13:56:36')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (22, N'test', N'test', N'有現貨嗎 我要十個', N'2021-04-13 21:09:11')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (23, N'test', N'test', N'你好，還有現貨嗎?', N'2021-04-14 17:19:04')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (24, N'test', N'test', N'請問有現貨嗎
TYPE-C OTG轉接會提供還是需要自己買', N'2021-04-14 17:19:10')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (25, N'test', N'Tom123', N'可以配對ps4手把在Switch主機上遊玩', N'2021-04-14 17:22:08')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (26, N'Tom123', N'test', N'請問可以接在lite上面嗎？謝謝', N'2021-04-14 17:22:23')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (27, N'test', N'Tom123', N'再請問接上XBOX手把是否有支援震動呢', N'2021-04-14 17:22:40')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (28, N'test', N'test', N'可以配對ps4手把在Switch主機上遊玩', N'2021-04-14 18:09:57')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (29, N'yobdcs', N'yobdcs', N'有現貨嗎 我要十個', N'2021-04-16 17:30:13')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (30, N'yobdcs', N'yobdcs', N'你好，還有現貨嗎?', N'2021-04-16 17:30:23')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (31, N'yobdcs', N'yobdcs', N'請問可以接在lite上面嗎？謝謝', N'2021-04-16 17:30:36')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (32, N'yobdcs', N'yobdcs', N'再請問接上XBOX手把是否有支援震動呢', N'2021-04-16 17:30:52')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (33, N'yobdcs', N'yobdcs', N'你好，還有現貨嗎?', N'2021-04-16 17:31:00')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (34, N'test', N'yobdcs', N'請問可以接在lite上面嗎？謝謝', N'2021-04-16 17:31:37')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (35, N'yobdcs(買家)', N'test(賣家)', N'請問商品有什麼狀況嗎?', N'2021-04-19 11:42:12')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (36, N'yobdcs(買家)', N'test(賣家)', N'請問商品有什麼狀況嗎?', N'2021-04-19 11:43:34')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (37, N'test(賣家)', N'yobdcs(買家)', N'商品外殼有可見傷痕。。。想退貨', N'2021-04-19 11:44:12')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (38, N'yobdcs(買家)', N'test(賣家)', N'好，我知道了', N'2021-04-19 11:44:43')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (39, N'test(賣家)', N'yobdcs(買家)', N'感謝你的協助', N'2021-04-19 11:45:03')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (40, N'yobdcs', N'test', N'請問商品有什麼狀況嗎?', N'2021-04-19 11:57:20')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (41, N'test', N'yobdcs', N'商品外殼有可見傷痕。。。想退貨', N'2021-04-19 11:57:47')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (42, N'yobdcs', N'test', N'好，我知道了', N'2021-04-19 11:58:06')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (43, N'test', N'yobdcs', N'感謝你的協助', N'2021-04-19 11:58:18')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (44, N'fkle56', N'fkle56', N'自己跟自己聊天', N'2021-04-19 13:35:05')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (45, N'fkle56', N'fkle56', N'很奇怪嗎?', N'2021-04-19 13:35:14')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (46, N'fkle56', N'fkle56', N'對', N'2021-04-19 13:35:19')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (47, N'yobdcs', N'manager', N'請問商品有什麼狀況嗎
', N'2021-04-19 17:02:02')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (48, N'manager', N'yobdcs', N'商品外殼有可見傷痕。。。想退貨
', N'2021-04-19 17:02:21')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (49, N'yobdcs', N'manager', N'好，我知道了
', N'2021-04-19 17:02:34')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (50, N'manager', N'yobdcs', N'好，我知道了
', N'2021-04-19 17:02:44')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (51, N'yobdcs', N'manager', N'請問商品有什麼狀況嗎?', N'2021-04-19 20:28:38')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (52, N'manager', N'yobdcs', N'商品外殼有可見傷痕。。。想退貨
', N'2021-04-19 20:29:15')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (53, N'yobdcs', N'manager', N'好，我知道了
', N'2021-04-19 20:29:30')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (54, N'manager', N'yobdcs', N'好，我知道了
', N'2021-04-19 20:29:43')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (55, N'yobdcs', N'manager', N'請問商品有什麼狀況嗎?
', N'2021-04-19 20:51:19')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (56, N'manager', N'yobdcs', N'商品外殼有可見傷痕。。。想退貨
', N'2021-04-19 20:51:42')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (57, N'yobdcs', N'manager', N'好，我知道了
', N'2021-04-19 20:52:01')
INSERT [dbo].[chatroom] ([chat_id], [acceptor], [mailer], [chat_message], [time]) VALUES (58, N'manager', N'yobdcs', N'好，我知道了
', N'2021-04-19 20:52:13')
SET IDENTITY_INSERT [dbo].[chatroom] OFF
GO
