
CREATE TABLE [dbo].[Ed_Izm](
	[Ed_Izm_ID] [int] NOT NULL,
	[E_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Ed_Izm] PRIMARY KEY CLUSTERED 
(
	[Ed_Izm_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Postavchik]    Script Date: 16.02.2023 18:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Postavchik](
	[P_Name] [nvarchar](50) NOT NULL,
	[Postavchik_ID] [int] NOT NULL,
 CONSTRAINT [PK_Postavchik] PRIMARY KEY CLUSTERED 
(
	[Postavchik_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proizvod]    Script Date: 16.02.2023 18:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proizvod](
	[P_Name] [nvarchar](50) NOT NULL,
	[Proizvod_ID] [int] NOT NULL,
 CONSTRAINT [PK_Proizvod] PRIMARY KEY CLUSTERED 
(
	[Proizvod_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pynkt_vid]    Script Date: 16.02.2023 18:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pynkt_vid](
	[Pynkt_vid_ID] [int] IDENTITY(1,1) NOT NULL,
	[P_Index] [int] NOT NULL,
	[P_Gorod] [nvarchar](max) NOT NULL,
	[P_Ylica] [nvarchar](max) NOT NULL,
	[P_Dom] [float] NOT NULL,
 CONSTRAINT [PK_Pynkt_vid] PRIMARY KEY CLUSTERED 
(
	[Pynkt_vid_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 16.02.2023 18:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[R_Name] [nvarchar](50) NOT NULL,
	[Role_ID] [int] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 16.02.2023 18:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[S_Name] [nvarchar](50) NOT NULL,
	[Status_ID] [int] NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tovar]    Script Date: 16.02.2023 18:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tovar](
	[T_Artikyl_ID] [nvarchar](50) NOT NULL,
	[T_Spisok_ID] [nvarchar](50) NOT NULL,
	[T_Ed_Izm_ID] [int] NOT NULL,
	[T_Stoimost] [float] NOT NULL,
	[T_Razmer_Max_Skidki] [float] NOT NULL,
	[T_Proizvod_ID] [int] NOT NULL,
	[T_Postavshik_ID] [int] NOT NULL,
	[T_Type_Tovar_ID] [int] NOT NULL,
	[T_Destv_Skidka] [float] NULL,
	[T_Kolich] [int] NOT NULL,
	[T_Opis] [nvarchar](max) NULL,
	[T_Photo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tovar_1] PRIMARY KEY CLUSTERED 
(
	[T_Artikyl_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type_Tovara]    Script Date: 16.02.2023 18:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type_Tovara](
	[T_Name] [nvarchar](50) NOT NULL,
	[Type_Tovara_ID] [int] NOT NULL,
 CONSTRAINT [PK_Type_Tovara] PRIMARY KEY CLUSTERED 
(
	[Type_Tovara_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 16.02.2023 18:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[U_Familya] [nvarchar](50) NOT NULL,
	[U_Imya] [nvarchar](50) NOT NULL,
	[U_Otchestvo] [nvarchar](50) NOT NULL,
	[U_Login] [nvarchar](50) NOT NULL,
	[U_Pass] [nvarchar](50) NOT NULL,
	[U_Role_ID] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zakaz]    Script Date: 16.02.2023 18:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zakaz](
	[Zakaz_ID] [int] IDENTITY(1,1) NOT NULL,
	[Z_Sostav] [nvarchar](50) NOT NULL,
	[Z_Kolich] [int] NOT NULL,
	[Z_Data_Zakaza] [date] NOT NULL,
	[Z_Data_Dostav] [date] NOT NULL,
	[Z_Pynkt_vid_ID] [int] NOT NULL,
	[Z_Famil] [nvarchar](50) NULL,
	[Z_Imya] [nvarchar](50) NULL,
	[Z_Otchestvo] [nvarchar](50) NULL,
	[Z_Kod_Polych] [int] NOT NULL,
	[Z_Status_ID] [int] NOT NULL,
 CONSTRAINT [PK_Zakaz] PRIMARY KEY CLUSTERED 
(
	[Zakaz_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Ed_Izm] ([Ed_Izm_ID], [E_Name]) VALUES (1, N'Штука')
GO
INSERT [dbo].[Postavchik] ([P_Name], [Postavchik_ID]) VALUES (N'Спортмастер', 1)
INSERT [dbo].[Postavchik] ([P_Name], [Postavchik_ID]) VALUES (N'Декатлон', 2)
GO
INSERT [dbo].[Proizvod] ([P_Name], [Proizvod_ID]) VALUES (N'X-Match', 1)
INSERT [dbo].[Proizvod] ([P_Name], [Proizvod_ID]) VALUES (N'Perfetto Sport', 2)
INSERT [dbo].[Proizvod] ([P_Name], [Proizvod_ID]) VALUES (N'ROMANA Next', 3)
INSERT [dbo].[Proizvod] ([P_Name], [Proizvod_ID]) VALUES (N'Moby Kids', 4)
INSERT [dbo].[Proizvod] ([P_Name], [Proizvod_ID]) VALUES (N'playToday', 5)
INSERT [dbo].[Proizvod] ([P_Name], [Proizvod_ID]) VALUES (N'Совтехстром', 6)
INSERT [dbo].[Proizvod] ([P_Name], [Proizvod_ID]) VALUES (N'Abtoys', 7)
INSERT [dbo].[Proizvod] ([P_Name], [Proizvod_ID]) VALUES (N'DFC', 8)
INSERT [dbo].[Proizvod] ([P_Name], [Proizvod_ID]) VALUES (N'Nordway', 9)
INSERT [dbo].[Proizvod] ([P_Name], [Proizvod_ID]) VALUES (N'Ridex', 10)
INSERT [dbo].[Proizvod] ([P_Name], [Proizvod_ID]) VALUES (N'Salomon', 11)
INSERT [dbo].[Proizvod] ([P_Name], [Proizvod_ID]) VALUES (N'Mikasa', 12)
INSERT [dbo].[Proizvod] ([P_Name], [Proizvod_ID]) VALUES (N'Molten', 13)
INSERT [dbo].[Proizvod] ([P_Name], [Proizvod_ID]) VALUES (N'Colton', 14)
INSERT [dbo].[Proizvod] ([P_Name], [Proizvod_ID]) VALUES (N'Atemi', 15)
INSERT [dbo].[Proizvod] ([P_Name], [Proizvod_ID]) VALUES (N'Green Hill', 16)
INSERT [dbo].[Proizvod] ([P_Name], [Proizvod_ID]) VALUES (N'SKIF', 17)
INSERT [dbo].[Proizvod] ([P_Name], [Proizvod_ID]) VALUES (N'Starfit', 18)
INSERT [dbo].[Proizvod] ([P_Name], [Proizvod_ID]) VALUES (N'Bradex', 19)
INSERT [dbo].[Proizvod] ([P_Name], [Proizvod_ID]) VALUES (N'Demix', 20)
GO
SET IDENTITY_INSERT [dbo].[Pynkt_vid] ON 

INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (1, 344288, N'Дубна', N'Чехова', 1)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (2, 614164, N'Дубна', N'  Степная', 30)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (3, 394242, N'Дубна', N'Коммунистическая', 43)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (4, 660540, N'Дубна', N'Солнечная', 25)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (5, 125837, N'Дубна', N'Шоссейная', 40)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (6, 125703, N'Дубна', N'Партизанская', 49)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (7, 625283, N'Дубна', N'Победы', 46)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (8, 614611, N'Дубна', N'Молодежная', 50)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (9, 454311, N'Дубна', N'Новая', 19)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (10, 660007, N'Дубна', N'Октябрьская', 19)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (11, 603036, N'Дубна', N'Садовая', 4)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (12, 450983, N'Дубна', N'Комсомольская', 26)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (13, 394782, N'Дубна', N'Чехова', 3)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (14, 603002, N'Дубна', N'Дзержинского', 28)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (15, 450558, N'Дубна', N'Набережная', 30)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (16, 394060, N'Дубна', N'Фрунзе', 43)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (17, 410661, N'Дубна', N'Школьная', 50)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (18, 625590, N'Дубна', N'Коммунистическая', 20)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (19, 625683, N'Дубна', N'8 Марта', 23)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (20, 400562, N'Дубна', N'Зеленая', 32)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (21, 614510, N'Дубна', N'Маяковского', 47)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (22, 410542, N'Дубна', N'Светлая', 46)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (23, 620839, N'Дубна', N'Цветочная', 8)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (24, 443890, N'Дубна', N'Коммунистическая', 1)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (25, 603379, N'Дубна', N'Спортивная', 46)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (26, 603721, N'Дубна', N'Гоголя', 41)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (27, 410172, N'Дубна', N'Северная', 13)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (28, 420151, N'Дубна', N'Вишневая', 32)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (29, 125061, N'Дубна', N'Подгорная', 8)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (30, 630370, N'Дубна', N'Шоссейная', 24)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (31, 614753, N'Дубна', N'Полевая', 35)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (32, 426030, N'Дубна', N'Маяковского', 44)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (33, 450375, N'Дубна', N'Клубная', 44)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (34, 625560, N'Дубна', N'Некрасова', 12)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (35, 630201, N'Дубна', N'Комсомольская', 17)
INSERT [dbo].[Pynkt_vid] ([Pynkt_vid_ID], [P_Index], [P_Gorod], [P_Ylica], [P_Dom]) VALUES (36, 190949, N'Дубна', N'Мичурина', 26)
SET IDENTITY_INSERT [dbo].[Pynkt_vid] OFF
GO
INSERT [dbo].[Role] ([R_Name], [Role_ID]) VALUES (N'Клиент', 1)
INSERT [dbo].[Role] ([R_Name], [Role_ID]) VALUES (N'Администратор', 2)
INSERT [dbo].[Role] ([R_Name], [Role_ID]) VALUES (N'Менеджер', 3)
GO
INSERT [dbo].[Status] ([S_Name], [Status_ID]) VALUES (N'Новый', 1)
INSERT [dbo].[Status] ([S_Name], [Status_ID]) VALUES (N'Завершен', 2)
GO
INSERT [dbo].[Tovar] ([T_Artikyl_ID], [T_Spisok_ID], [T_Ed_Izm_ID], [T_Stoimost], [T_Razmer_Max_Skidki], [T_Proizvod_ID], [T_Postavshik_ID], [T_Type_Tovar_ID], [T_Destv_Skidka], [T_Kolich], [T_Opis], [T_Photo]) VALUES (N'C324S5', N'Шлем', 1, 4000, 10, 11, 2, 1, 5, 16, N'Шлем г.л./сноуб. Salomon Grom р.:KS черный (L40836800)', N'C324S5.jpg')
INSERT [dbo].[Tovar] ([T_Artikyl_ID], [T_Spisok_ID], [T_Ed_Izm_ID], [T_Stoimost], [T_Razmer_Max_Skidki], [T_Proizvod_ID], [T_Postavshik_ID], [T_Type_Tovar_ID], [T_Destv_Skidka], [T_Kolich], [T_Opis], [T_Photo]) VALUES (N'D038G6', N'Лыжный комплект', 1, 3000, 30, 9, 2, 1, 4, 23, N'Лыжный комплект беговые NORDWAY XC Classic, 45-45-45мм, 160см', N'D038G6.jpg')
INSERT [dbo].[Tovar] ([T_Artikyl_ID], [T_Spisok_ID], [T_Ed_Izm_ID], [T_Stoimost], [T_Razmer_Max_Skidki], [T_Proizvod_ID], [T_Postavshik_ID], [T_Type_Tovar_ID], [T_Destv_Skidka], [T_Kolich], [T_Opis], [T_Photo]) VALUES (N'D648N7', N'Набор для хоккея', 1, 350, 10, 6, 2, 1, 4, 7, N'Набор для хоккея Совтехстром', N'D648N7.jpg')
INSERT [dbo].[Tovar] ([T_Artikyl_ID], [T_Spisok_ID], [T_Ed_Izm_ID], [T_Stoimost], [T_Razmer_Max_Skidki], [T_Proizvod_ID], [T_Postavshik_ID], [T_Type_Tovar_ID], [T_Destv_Skidka], [T_Kolich], [T_Opis], [T_Photo]) VALUES (N'D830R5', N'Тренажер прыжков', 1, 1120, 15, 4, 1, 1, 4, 8, N'Тренажер для прыжков Moby Kids Moby-Jumper со счетчиком', N'D830R5.jpg')
INSERT [dbo].[Tovar] ([T_Artikyl_ID], [T_Spisok_ID], [T_Ed_Izm_ID], [T_Stoimost], [T_Razmer_Max_Skidki], [T_Proizvod_ID], [T_Postavshik_ID], [T_Type_Tovar_ID], [T_Destv_Skidka], [T_Kolich], [T_Opis], [T_Photo]) VALUES (N'D927K3', N'Перчатки', 1, 660, 15, 18, 2, 1, 4, 3, N'Перчатки Starfit SU-125 атлетические S черный', N'D927K3.jpg')
INSERT [dbo].[Tovar] ([T_Artikyl_ID], [T_Spisok_ID], [T_Ed_Izm_ID], [T_Stoimost], [T_Razmer_Max_Skidki], [T_Proizvod_ID], [T_Postavshik_ID], [T_Type_Tovar_ID], [T_Destv_Skidka], [T_Kolich], [T_Opis], [T_Photo]) VALUES (N'E324U7', N'Велотренажер', 1, 6480, 25, 8, 1, 1, 5, 5, N'Велотренажер двойной DFC B804 dual bike', N'E324U7.jpg')
INSERT [dbo].[Tovar] ([T_Artikyl_ID], [T_Spisok_ID], [T_Ed_Izm_ID], [T_Stoimost], [T_Razmer_Max_Skidki], [T_Proizvod_ID], [T_Postavshik_ID], [T_Type_Tovar_ID], [T_Destv_Skidka], [T_Kolich], [T_Opis], [T_Photo]) VALUES (N'F047J7', N'Коврик', 1, 720, 15, 19, 1, 1, 5, 11, N'Коврик Bradex для мягкой йоги дл.:1730мм ш.:610мм т.:3мм серый', N'F047J7.jpg')
INSERT [dbo].[Tovar] ([T_Artikyl_ID], [T_Spisok_ID], [T_Ed_Izm_ID], [T_Stoimost], [T_Razmer_Max_Skidki], [T_Proizvod_ID], [T_Postavshik_ID], [T_Type_Tovar_ID], [T_Destv_Skidka], [T_Kolich], [T_Opis], [T_Photo]) VALUES (N'F735B6', N'Игровой набор', 1, 320, 15, 6, 2, 1, 2, 9, N'Игровой набор Совтехстром Кегли и шары', N'F735B6.jpg')
INSERT [dbo].[Tovar] ([T_Artikyl_ID], [T_Spisok_ID], [T_Ed_Izm_ID], [T_Stoimost], [T_Razmer_Max_Skidki], [T_Proizvod_ID], [T_Postavshik_ID], [T_Type_Tovar_ID], [T_Destv_Skidka], [T_Kolich], [T_Opis], [T_Photo]) VALUES (N'F746E6', N'Шведская стенка', 1, 9900, 10, 3, 2, 1, 3, 5, N'Шведская стенка ROMANA Next, pastel', N'F746E6.jpg')
INSERT [dbo].[Tovar] ([T_Artikyl_ID], [T_Spisok_ID], [T_Ed_Izm_ID], [T_Stoimost], [T_Razmer_Max_Skidki], [T_Proizvod_ID], [T_Postavshik_ID], [T_Type_Tovar_ID], [T_Destv_Skidka], [T_Kolich], [T_Opis], [T_Photo]) VALUES (N'F937G4', N'Игровой набор', 1, 480, 10, 7, 1, 1, 4, 12, N'Набор Abtoys Бадминтон и теннис ', N'F937G4.jpg')
INSERT [dbo].[Tovar] ([T_Artikyl_ID], [T_Spisok_ID], [T_Ed_Izm_ID], [T_Stoimost], [T_Razmer_Max_Skidki], [T_Proizvod_ID], [T_Postavshik_ID], [T_Type_Tovar_ID], [T_Destv_Skidka], [T_Kolich], [T_Opis], [T_Photo]) VALUES (N'G480F5', N'Ролики', 1, 1600, 15, 10, 1, 1, 4, 7, N'Коньки роликовые Ridex Cricket жен. ABEC 3 кол.:72мм р.:39-42 синий', N'G480F5.jpg')
INSERT [dbo].[Tovar] ([T_Artikyl_ID], [T_Spisok_ID], [T_Ed_Izm_ID], [T_Stoimost], [T_Razmer_Max_Skidki], [T_Proizvod_ID], [T_Postavshik_ID], [T_Type_Tovar_ID], [T_Destv_Skidka], [T_Kolich], [T_Opis], [T_Photo]) VALUES (N'G522B5', N'Ласты', 1, 1980, 15, 14, 2, 1, 3, 6, N'Ласты Colton CF-02 для плавания р.:33-34 серый/голубой', N'G522B5.jpg')
INSERT [dbo].[Tovar] ([T_Artikyl_ID], [T_Spisok_ID], [T_Ed_Izm_ID], [T_Stoimost], [T_Razmer_Max_Skidki], [T_Proizvod_ID], [T_Postavshik_ID], [T_Type_Tovar_ID], [T_Destv_Skidka], [T_Kolich], [T_Opis], [T_Photo]) VALUES (N'G598Y6', N'Спортивный мат', 1, 2390, 15, 2, 2, 1, 2, 16, N'Спортивный мат 100x100x10 см Perfetto Sport № 3 бежевый', N'G598Y6.jpg')
INSERT [dbo].[Tovar] ([T_Artikyl_ID], [T_Spisok_ID], [T_Ed_Izm_ID], [T_Stoimost], [T_Razmer_Max_Skidki], [T_Proizvod_ID], [T_Postavshik_ID], [T_Type_Tovar_ID], [T_Destv_Skidka], [T_Kolich], [T_Opis], [T_Photo]) VALUES (N'J4DF5E', N'Насос', 1, 300, 5, 13, 1, 1, 4, 12, N'Насос Molten HP-18-B для мячей мультиколор', N'J4DF5E.jpg')
INSERT [dbo].[Tovar] ([T_Artikyl_ID], [T_Spisok_ID], [T_Ed_Izm_ID], [T_Stoimost], [T_Razmer_Max_Skidki], [T_Proizvod_ID], [T_Postavshik_ID], [T_Type_Tovar_ID], [T_Destv_Skidka], [T_Kolich], [T_Opis], [T_Photo]) VALUES (N'K432G6', N'Шапочка для плавания', 1, 440, 25, 15, 2, 1, 5, 17, N'Шапочка для плавания Atemi PU 140 ткань с покрытием желтый', N'K432G6.jpg')
INSERT [dbo].[Tovar] ([T_Artikyl_ID], [T_Spisok_ID], [T_Ed_Izm_ID], [T_Stoimost], [T_Razmer_Max_Skidki], [T_Proizvod_ID], [T_Postavshik_ID], [T_Type_Tovar_ID], [T_Destv_Skidka], [T_Kolich], [T_Opis], [T_Photo]) VALUES (N'N483G5', N'Клюшка', 1, 1299, 10, 9, 2, 1, 3, 4, N'Клюшка Nordway NDW300 (2019/2020) SR лев. 19 150см', N'N483G5.jpg')
INSERT [dbo].[Tovar] ([T_Artikyl_ID], [T_Spisok_ID], [T_Ed_Izm_ID], [T_Stoimost], [T_Razmer_Max_Skidki], [T_Proizvod_ID], [T_Postavshik_ID], [T_Type_Tovar_ID], [T_Destv_Skidka], [T_Kolich], [T_Opis], [T_Photo]) VALUES (N'N836R5', N'Коньки', 1, 2000, 10, 15, 2, 1, 3, 16, N'Коньки ATEMI AKSK01DXS, раздвижные, прогулочные, унисекс, 27-30, черный/зеленый', N'N836R5.jpg')
INSERT [dbo].[Tovar] ([T_Artikyl_ID], [T_Spisok_ID], [T_Ed_Izm_ID], [T_Stoimost], [T_Razmer_Max_Skidki], [T_Proizvod_ID], [T_Postavshik_ID], [T_Type_Tovar_ID], [T_Destv_Skidka], [T_Kolich], [T_Opis], [T_Photo]) VALUES (N'S374B5', N'Ролик для йоги', 1, 700, 10, 19, 1, 1, 3, 12, N'Ролик для йоги Bradex Туба d=14см ш.:33см оранжевый', N'S374B5.jpg')
INSERT [dbo].[Tovar] ([T_Artikyl_ID], [T_Spisok_ID], [T_Ed_Izm_ID], [T_Stoimost], [T_Razmer_Max_Skidki], [T_Proizvod_ID], [T_Postavshik_ID], [T_Type_Tovar_ID], [T_Destv_Skidka], [T_Kolich], [T_Opis], [T_Photo]) VALUES (N'V312R4', N'Мяч', 1, 4150, 20, 12, 2, 1, 2, 5, N'Мяч волейбольный MIKASA VT370W, для зала, 5-й размер, желтый/синий', N'V312R4.jpg')
INSERT [dbo].[Tovar] ([T_Artikyl_ID], [T_Spisok_ID], [T_Ed_Izm_ID], [T_Stoimost], [T_Razmer_Max_Skidki], [T_Proizvod_ID], [T_Postavshik_ID], [T_Type_Tovar_ID], [T_Destv_Skidka], [T_Kolich], [T_Opis], [T_Photo]) VALUES (N'А112Т4', N'Боксерская груша', 1, 778, 30, 1, 1, 1, 5, 6, N'Боксерская груша X-Match черная', N'А112Т4.jpg')
GO
INSERT [dbo].[Type_Tovara] ([T_Name], [Type_Tovara_ID]) VALUES (N'Спортивный инвентарь', 1)
INSERT [dbo].[Type_Tovara] ([T_Name], [Type_Tovara_ID]) VALUES (N'Одежда', 2)
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (51, N'Никифоров', N'Всеволод', N'Иванович', N'loginDEjrm2018', N'Cpb+Im', 1)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (52, N'Воронов', N'Донат', N'Никитевич', N'loginDEpxl2018', N'P6h4Jq', 2)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (53, N'Игнатьева', N'Евгения', N'Валентиновна', N'loginDEwgk2018', N'&mfI9l', 1)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (54, N'Буров', N'Федот', N'Егорович', N'loginDEpou2018', N'gX3f5Z', 2)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (55, N'Денисов', N'Иван', N'Семёновна', N'loginDEjwl2018', N'D4ZYHt', 3)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (56, N'Денисов', N'Дамир', N'Филатович', N'loginDEabf2018', N'*Tasm+', 1)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (57, N'Ершов', N'Максим', N'Геласьевич', N'loginDEwjm2018', N'k}DJKo', 1)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (58, N'Копылов', N'Куприян', N'Пётрович', N'loginDEjvz2018', N'&|bGTy', 3)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (59, N'Носов', N'Валерьян', N'Дмитрьевич', N'loginDEuyv2018', N'8hhrZ}', 3)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (60, N'Силин', N'Игорь', N'Авдеевич', N'loginDExdm2018', N'DH68L9', 2)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (61, N'Дроздова', N'Александра', N'Мартыновна', N'loginDEeiv2018', N'H*BxlS', 3)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (62, N'Дроздов', N'Аркадий', N'Геласьевич', N'loginDEfuc2018', N'VuM+QT', 1)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (63, N'Боброва', N'Варвара', N'Евсеевна', N'loginDEoot2018', N'usi{aT', 3)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (64, N'Чернова', N'Агата', N'Данииловна', N'loginDElhk2018', N'Okk0jY', 3)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (65, N'Лыткина', N'Ульяна', N'Станиславовна', N'loginDEazg2018', N's3bb|V', 1)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (66, N'Лаврентьев', N'Леонид', N'Игнатьевич', N'loginDEaba2018', N'#ИМЯ?', 2)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (67, N'Кулаков', N'Юрий', N'Владленович', N'loginDEtco2018', N'tTKDJB', 1)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (68, N'Соловьёв', N'Андрей', N'Александрович', N'loginDEsyq2018', N'2QbpBN', 3)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (69, N'Корнилова', N'Марфа', N'Макаровна', N'loginDEpxi2018', N'+5X&hy', 1)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (70, N'Белоусова', N'Любовь', N'Георгьевна', N'loginDEicr2018', N'3+|Sn{', 1)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (71, N'Анисимов', N'Никита', N'Гордеевич', N'loginDEcui2018', N'Zi1Tth', 3)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (72, N'Стрелкова', N'Фаина', N'Федосеевна', N'loginDEpxc2018', N'G+nFsv', 1)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (73, N'Осипов', N'Евгений', N'Иванович', N'loginDEqrd2018', N'sApUbt', 2)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (74, N'Владимирова', N'Иванна', N'Павловна', N'loginDEsso2018', N'#ИМЯ?', 3)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (75, N'Кудрявцева', N'Жанна', N'Демьяновна', N'loginDErsy2018', N'{Aa6nS', 3)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (76, N'Матвиенко', N'Яков', N'Брониславович', N'loginDEvpz2018', N'mS0UxK', 3)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (77, N'Селезнёв', N'Егор', N'Артёмович', N'loginDEfog2018', N'glICay', 1)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (78, N'Брагин', N'Куприян', N'Митрофанович', N'loginDEpii2018', N'Ob}RZB', 1)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (79, N'Гордеев', N'Виктор', N'Эдуардович', N'loginDEhyk2018', N'*gN}Tc', 2)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (80, N'Мартынов', N'Онисим', N'Брониславович', N'loginDEdxi2018', N'ywLUbA', 3)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (81, N'Никонова', N'Евгения', N'Павловна', N'loginDEzro2018', N'B24s6o', 3)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (82, N'Полякова', N'Анна', N'Денисовна', N'loginDEuxg2018', N'K8jui7', 1)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (83, N'Макарова', N'Пелагея', N'Антониновна', N'loginDEllw2018', N'jNtNUr', 1)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (84, N'Андреева', N'Анна', N'Вячеславовна', N'loginDEddg2018', N'gGGhvD', 2)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (85, N'Кудрявцева', N'Кира', N'Ефимовна', N'loginDEpdz2018', N'#ИМЯ?', 1)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (86, N'Шилова', N'Кира', N'Егоровна', N'loginDEyiw2018', N'cnj3QR', 3)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (87, N'Ситников', N'Игорь', N'Борисович', N'loginDEqup2018', N'95AU|R', 2)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (88, N'Русаков', N'Борис', N'Христофорович', N'loginDExil2018', N'w+++Ht', 2)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (89, N'Капустина', N'Ульяна', N'Игоревна', N'loginDEkuv2018', N'Ade++|', 3)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (90, N'Беляков', N'Семён', N'Германнович', N'loginDEmox2018', N'Je}9e7', 3)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (91, N'Гурьев', N'Ириней', N'Игнатьевич', N'loginDEvug2018', N'lEa{Cn', 1)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (92, N'Мишин', N'Христофор', N'Леонидович', N'loginDEzre2018', N'N*VX+G', 1)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (93, N'Лазарева', N'Антонина', N'Христофоровна', N'loginDEbes2018', N'NaVtyH', 3)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (94, N'Маркова', N'Ираида', N'Сергеевна', N'loginDEkfg2018', N'r1060q', 1)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (95, N'Носкова', N'Пелагея', N'Валерьевна', N'loginDEyek2018', N'KY2BL4', 1)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (96, N'Баранов', N'Станислав', N'Дмитрьевич', N'loginDEloq2018', N'NZV5WR', 2)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (97, N'Ефремов', N'Демьян', N'Артёмович', N'loginDEjfb2018', N'TNT+}h', 3)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (98, N'Константинов', N'Всеволод', N'Мэлсович', N'loginDEueq2018', N'GqAUZ6', 3)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (99, N'Ситникова', N'Ираида', N'Андреевна', N'loginDEpqz2018', N'F0Bp7F', 3)
INSERT [dbo].[User] ([User_ID], [U_Familya], [U_Imya], [U_Otchestvo], [U_Login], [U_Pass], [U_Role_ID]) VALUES (100, N'Матвеев', N'Кондрат', N'Иванович', N'loginDEovk2018', N'JyJM{A', 2)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[Zakaz] ON 

INSERT [dbo].[Zakaz] ([Zakaz_ID], [Z_Sostav], [Z_Kolich], [Z_Data_Zakaza], [Z_Data_Dostav], [Z_Pynkt_vid_ID], [Z_Famil], [Z_Imya], [Z_Otchestvo], [Z_Kod_Polych], [Z_Status_ID]) VALUES (1, N'А112Т4', 2, CAST(N'2022-05-15' AS Date), CAST(N'2022-05-21' AS Date), 18, N'Поляков', N'Степан', N'Егорович', 401, 1)
INSERT [dbo].[Zakaz] ([Zakaz_ID], [Z_Sostav], [Z_Kolich], [Z_Data_Zakaza], [Z_Data_Dostav], [Z_Pynkt_vid_ID], [Z_Famil], [Z_Imya], [Z_Otchestvo], [Z_Kod_Polych], [Z_Status_ID]) VALUES (2, N'F746E6', 3, CAST(N'2022-05-16' AS Date), CAST(N'2022-05-22' AS Date), 20, N'Леонова', N'Алиса', N'Кирилловна', 402, 1)
INSERT [dbo].[Zakaz] ([Zakaz_ID], [Z_Sostav], [Z_Kolich], [Z_Data_Zakaza], [Z_Data_Dostav], [Z_Pynkt_vid_ID], [Z_Famil], [Z_Imya], [Z_Otchestvo], [Z_Kod_Polych], [Z_Status_ID]) VALUES (3, N'D648N7', 10, CAST(N'2022-05-17' AS Date), CAST(N'2022-05-23' AS Date), 20, N'Яковлев', N'Платон', N'Константинович', 403, 2)
INSERT [dbo].[Zakaz] ([Zakaz_ID], [Z_Sostav], [Z_Kolich], [Z_Data_Zakaza], [Z_Data_Dostav], [Z_Pynkt_vid_ID], [Z_Famil], [Z_Imya], [Z_Otchestvo], [Z_Kod_Polych], [Z_Status_ID]) VALUES (4, N'E324U7', 1, CAST(N'2022-05-18' AS Date), CAST(N'2022-05-24' AS Date), 22, N'Ковалева', N'Ева1', N'Яковлевна', 404, 1)
INSERT [dbo].[Zakaz] ([Zakaz_ID], [Z_Sostav], [Z_Kolich], [Z_Data_Zakaza], [Z_Data_Dostav], [Z_Pynkt_vid_ID], [Z_Famil], [Z_Imya], [Z_Otchestvo], [Z_Kod_Polych], [Z_Status_ID]) VALUES (5, N'N483G5', 10, CAST(N'2022-05-19' AS Date), CAST(N'2022-05-25' AS Date), 22, N'', N'', N'', 405, 1)
INSERT [dbo].[Zakaz] ([Zakaz_ID], [Z_Sostav], [Z_Kolich], [Z_Data_Zakaza], [Z_Data_Dostav], [Z_Pynkt_vid_ID], [Z_Famil], [Z_Imya], [Z_Otchestvo], [Z_Kod_Polych], [Z_Status_ID]) VALUES (6, N'G480F5', 2, CAST(N'2022-05-19' AS Date), CAST(N'2022-05-25' AS Date), 16, N'', N'', N'', 406, 1)
INSERT [dbo].[Zakaz] ([Zakaz_ID], [Z_Sostav], [Z_Kolich], [Z_Data_Zakaza], [Z_Data_Dostav], [Z_Pynkt_vid_ID], [Z_Famil], [Z_Imya], [Z_Otchestvo], [Z_Kod_Polych], [Z_Status_ID]) VALUES (7, N'V312R4', 1, CAST(N'2022-05-21' AS Date), CAST(N'2022-05-27' AS Date), 16, N'', N'', N'', 407, 2)
INSERT [dbo].[Zakaz] ([Zakaz_ID], [Z_Sostav], [Z_Kolich], [Z_Data_Zakaza], [Z_Data_Dostav], [Z_Pynkt_vid_ID], [Z_Famil], [Z_Imya], [Z_Otchestvo], [Z_Kod_Polych], [Z_Status_ID]) VALUES (8, N'G522B5', 3, CAST(N'2022-05-22' AS Date), CAST(N'2022-05-28' AS Date), 18, N'', N'', N'', 408, 2)
INSERT [dbo].[Zakaz] ([Zakaz_ID], [Z_Sostav], [Z_Kolich], [Z_Data_Zakaza], [Z_Data_Dostav], [Z_Pynkt_vid_ID], [Z_Famil], [Z_Imya], [Z_Otchestvo], [Z_Kod_Polych], [Z_Status_ID]) VALUES (9, N'F047J7', 1, CAST(N'2022-05-23' AS Date), CAST(N'2022-05-29' AS Date), 24, N'', N'', N'', 409, 1)
INSERT [dbo].[Zakaz] ([Zakaz_ID], [Z_Sostav], [Z_Kolich], [Z_Data_Zakaza], [Z_Data_Dostav], [Z_Pynkt_vid_ID], [Z_Famil], [Z_Imya], [Z_Otchestvo], [Z_Kod_Polych], [Z_Status_ID]) VALUES (10, N'N836R5', 5, CAST(N'2022-05-24' AS Date), CAST(N'2022-05-30' AS Date), 24, N'', N'', N'', 410, 2)
INSERT [dbo].[Zakaz] ([Zakaz_ID], [Z_Sostav], [Z_Kolich], [Z_Data_Zakaza], [Z_Data_Dostav], [Z_Pynkt_vid_ID], [Z_Famil], [Z_Imya], [Z_Otchestvo], [Z_Kod_Polych], [Z_Status_ID]) VALUES (11, N'G598Y6', 2, CAST(N'2022-05-15' AS Date), CAST(N'2022-05-21' AS Date), 18, N'Поляков', N'Степан', N'Егорович', 401, 1)
INSERT [dbo].[Zakaz] ([Zakaz_ID], [Z_Sostav], [Z_Kolich], [Z_Data_Zakaza], [Z_Data_Dostav], [Z_Pynkt_vid_ID], [Z_Famil], [Z_Imya], [Z_Otchestvo], [Z_Kod_Polych], [Z_Status_ID]) VALUES (12, N'D830R5', 3, CAST(N'2022-05-16' AS Date), CAST(N'2022-05-22' AS Date), 20, N'Леонова', N'Алиса', N'Кирилловна', 402, 1)
INSERT [dbo].[Zakaz] ([Zakaz_ID], [Z_Sostav], [Z_Kolich], [Z_Data_Zakaza], [Z_Data_Dostav], [Z_Pynkt_vid_ID], [Z_Famil], [Z_Imya], [Z_Otchestvo], [Z_Kod_Polych], [Z_Status_ID]) VALUES (13, N'F735B6', 10, CAST(N'2022-05-17' AS Date), CAST(N'2022-05-23' AS Date), 20, N'Яковлев', N'Платон', N'Константинович', 403, 2)
INSERT [dbo].[Zakaz] ([Zakaz_ID], [Z_Sostav], [Z_Kolich], [Z_Data_Zakaza], [Z_Data_Dostav], [Z_Pynkt_vid_ID], [Z_Famil], [Z_Imya], [Z_Otchestvo], [Z_Kod_Polych], [Z_Status_ID]) VALUES (14, N'E324U7', 1, CAST(N'2022-05-18' AS Date), CAST(N'2022-05-24' AS Date), 22, N'Ковалева', N'Ева', N'Яковлевна', 404, 1)
INSERT [dbo].[Zakaz] ([Zakaz_ID], [Z_Sostav], [Z_Kolich], [Z_Data_Zakaza], [Z_Data_Dostav], [Z_Pynkt_vid_ID], [Z_Famil], [Z_Imya], [Z_Otchestvo], [Z_Kod_Polych], [Z_Status_ID]) VALUES (15, N'D038G6', 10, CAST(N'2022-05-19' AS Date), CAST(N'2022-05-25' AS Date), 22, N'', N'', N'', 405, 1)
INSERT [dbo].[Zakaz] ([Zakaz_ID], [Z_Sostav], [Z_Kolich], [Z_Data_Zakaza], [Z_Data_Dostav], [Z_Pynkt_vid_ID], [Z_Famil], [Z_Imya], [Z_Otchestvo], [Z_Kod_Polych], [Z_Status_ID]) VALUES (16, N'C324S5', 2, CAST(N'2022-05-19' AS Date), CAST(N'2022-05-25' AS Date), 16, N'', N'', N'', 406, 1)
INSERT [dbo].[Zakaz] ([Zakaz_ID], [Z_Sostav], [Z_Kolich], [Z_Data_Zakaza], [Z_Data_Dostav], [Z_Pynkt_vid_ID], [Z_Famil], [Z_Imya], [Z_Otchestvo], [Z_Kod_Polych], [Z_Status_ID]) VALUES (17, N'J4DF5E', 1, CAST(N'2022-05-21' AS Date), CAST(N'2022-05-27' AS Date), 16, N'', N'', N'', 407, 2)
INSERT [dbo].[Zakaz] ([Zakaz_ID], [Z_Sostav], [Z_Kolich], [Z_Data_Zakaza], [Z_Data_Dostav], [Z_Pynkt_vid_ID], [Z_Famil], [Z_Imya], [Z_Otchestvo], [Z_Kod_Polych], [Z_Status_ID]) VALUES (18, N'K432G6', 3, CAST(N'2022-05-22' AS Date), CAST(N'2022-05-28' AS Date), 18, N'', N'', N'', 408, 2)
INSERT [dbo].[Zakaz] ([Zakaz_ID], [Z_Sostav], [Z_Kolich], [Z_Data_Zakaza], [Z_Data_Dostav], [Z_Pynkt_vid_ID], [Z_Famil], [Z_Imya], [Z_Otchestvo], [Z_Kod_Polych], [Z_Status_ID]) VALUES (19, N'S374B5', 1, CAST(N'2022-05-23' AS Date), CAST(N'2022-05-29' AS Date), 24, N'', N'', N'', 409, 1)
INSERT [dbo].[Zakaz] ([Zakaz_ID], [Z_Sostav], [Z_Kolich], [Z_Data_Zakaza], [Z_Data_Dostav], [Z_Pynkt_vid_ID], [Z_Famil], [Z_Imya], [Z_Otchestvo], [Z_Kod_Polych], [Z_Status_ID]) VALUES (20, N'D927K3', 5, CAST(N'2022-05-24' AS Date), CAST(N'2022-05-30' AS Date), 24, N'', N'', N'', 410, 2)
INSERT [dbo].[Zakaz] ([Zakaz_ID], [Z_Sostav], [Z_Kolich], [Z_Data_Zakaza], [Z_Data_Dostav], [Z_Pynkt_vid_ID], [Z_Famil], [Z_Imya], [Z_Otchestvo], [Z_Kod_Polych], [Z_Status_ID]) VALUES (22, N'D648N7', 312, CAST(N'2023-02-16' AS Date), CAST(N'2023-02-17' AS Date), 3, N'312', N'145345634', N'6758678', 1, 1)
SET IDENTITY_INSERT [dbo].[Zakaz] OFF
GO
ALTER TABLE [dbo].[Tovar]  WITH CHECK ADD  CONSTRAINT [FK_Tovar_Ed_Izm] FOREIGN KEY([T_Ed_Izm_ID])
REFERENCES [dbo].[Ed_Izm] ([Ed_Izm_ID])
GO
ALTER TABLE [dbo].[Tovar] CHECK CONSTRAINT [FK_Tovar_Ed_Izm]
GO
ALTER TABLE [dbo].[Tovar]  WITH CHECK ADD  CONSTRAINT [FK_Tovar_Postavchik] FOREIGN KEY([T_Postavshik_ID])
REFERENCES [dbo].[Postavchik] ([Postavchik_ID])
GO
ALTER TABLE [dbo].[Tovar] CHECK CONSTRAINT [FK_Tovar_Postavchik]
GO
ALTER TABLE [dbo].[Tovar]  WITH CHECK ADD  CONSTRAINT [FK_Tovar_Proizvod] FOREIGN KEY([T_Proizvod_ID])
REFERENCES [dbo].[Proizvod] ([Proizvod_ID])
GO
ALTER TABLE [dbo].[Tovar] CHECK CONSTRAINT [FK_Tovar_Proizvod]
GO
ALTER TABLE [dbo].[Tovar]  WITH CHECK ADD  CONSTRAINT [FK_Tovar_Type_Tovara] FOREIGN KEY([T_Type_Tovar_ID])
REFERENCES [dbo].[Type_Tovara] ([Type_Tovara_ID])
GO
ALTER TABLE [dbo].[Tovar] CHECK CONSTRAINT [FK_Tovar_Type_Tovara]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([U_Role_ID])
REFERENCES [dbo].[Role] ([Role_ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[Zakaz]  WITH CHECK ADD  CONSTRAINT [FK_Zakaz_Pynkt_vid] FOREIGN KEY([Z_Pynkt_vid_ID])
REFERENCES [dbo].[Pynkt_vid] ([Pynkt_vid_ID])
GO
ALTER TABLE [dbo].[Zakaz] CHECK CONSTRAINT [FK_Zakaz_Pynkt_vid]
GO
ALTER TABLE [dbo].[Zakaz]  WITH CHECK ADD  CONSTRAINT [FK_Zakaz_Status] FOREIGN KEY([Z_Status_ID])
REFERENCES [dbo].[Status] ([Status_ID])
GO
ALTER TABLE [dbo].[Zakaz] CHECK CONSTRAINT [FK_Zakaz_Status]
GO
ALTER TABLE [dbo].[Zakaz]  WITH CHECK ADD  CONSTRAINT [FK_Zakaz_Tovar] FOREIGN KEY([Z_Sostav])
REFERENCES [dbo].[Tovar] ([T_Artikyl_ID])
GO
ALTER TABLE [dbo].[Zakaz] CHECK CONSTRAINT [FK_Zakaz_Tovar]
GO
USE [master]
GO
ALTER DATABASE [Trade] SET  READ_WRITE 
GO
