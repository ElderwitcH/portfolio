USE [master]
GO
/****** Object:  Database [ModelFirm]    Script Date: 17.05.2023 14:19:11 ******/
CREATE DATABASE [ModelFirm]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ModelFirm', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ModelFirm.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ModelFirm_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ModelFirm_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ModelFirm] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ModelFirm].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ModelFirm] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ModelFirm] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ModelFirm] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ModelFirm] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ModelFirm] SET ARITHABORT OFF 
GO
ALTER DATABASE [ModelFirm] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ModelFirm] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ModelFirm] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ModelFirm] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ModelFirm] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ModelFirm] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ModelFirm] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ModelFirm] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ModelFirm] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ModelFirm] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ModelFirm] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ModelFirm] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ModelFirm] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ModelFirm] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ModelFirm] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ModelFirm] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ModelFirm] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ModelFirm] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ModelFirm] SET  MULTI_USER 
GO
ALTER DATABASE [ModelFirm] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ModelFirm] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ModelFirm] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ModelFirm] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ModelFirm] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ModelFirm] SET QUERY_STORE = OFF
GO
USE [ModelFirm]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 17.05.2023 14:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Category_ID] [int] IDENTITY(1,1) NOT NULL,
	[Categoty_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 17.05.2023 14:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Client_ID] [int] IDENTITY(1,1) NOT NULL,
	[Status_ID] [int] NOT NULL,
	[Birth] [date] NULL,
	[Mail] [nvarchar](50) NOT NULL,
	[Number] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Second_Name] [nvarchar](50) NULL,
	[Image] [nvarchar](50) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Client_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 17.05.2023 14:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Employee_ID] [int] IDENTITY(1,1) NOT NULL,
	[Post_ID] [int] NOT NULL,
	[Birth] [nvarchar](50) NOT NULL,
	[Mail] [nvarchar](50) NOT NULL,
	[Number] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Second_Name] [nvarchar](50) NOT NULL,
	[Pass_Ser] [int] NOT NULL,
	[Pass_Num] [int] NOT NULL,
	[Image] [nvarchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Employee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 17.05.2023 14:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Order_ID] [int] IDENTITY(1,1) NOT NULL,
	[Client_ID] [int] NOT NULL,
	[Date_order] [date] NOT NULL,
	[Price] [float] NOT NULL,
	[Employee_ID] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Product]    Script Date: 17.05.2023 14:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Product](
	[Order_Product_ID] [int] IDENTITY(1,1) NOT NULL,
	[Order_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
 CONSTRAINT [PK_Order_Product] PRIMARY KEY CLUSTERED 
(
	[Order_Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 17.05.2023 14:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[Post_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Salary] [float] NOT NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[Post_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 17.05.2023 14:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Product_ID] [int] IDENTITY(1,1) NOT NULL,
	[Category_ID] [int] NOT NULL,
	[Purpose_ID] [int] NOT NULL,
	[Image] [nvarchar](50) NULL,
	[Product_name] [nvarchar](50) NOT NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purpose]    Script Date: 17.05.2023 14:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purpose](
	[Purpose_ID] [int] IDENTITY(1,1) NOT NULL,
	[Purpose_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Purpose] PRIMARY KEY CLUSTERED 
(
	[Purpose_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 17.05.2023 14:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Role_ID] [int] NOT NULL,
	[Name_role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 17.05.2023 14:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[Sale_ID] [int] IDENTITY(1,1) NOT NULL,
	[Percent_sale] [nvarchar](50) NULL,
	[Status_ID] [int] NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[Sale_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 17.05.2023 14:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Status_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Sale_ID] [int] NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 17.05.2023 14:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Auth_ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Role_ID] [int] NOT NULL,
	[Client_ID] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Auth_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Category_ID], [Categoty_name]) VALUES (1, N'Багеты')
INSERT [dbo].[Category] ([Category_ID], [Categoty_name]) VALUES (2, N'Бюсты')
INSERT [dbo].[Category] ([Category_ID], [Categoty_name]) VALUES (3, N'Двери')
INSERT [dbo].[Category] ([Category_ID], [Categoty_name]) VALUES (4, N'Лестницы')
INSERT [dbo].[Category] ([Category_ID], [Categoty_name]) VALUES (5, N'Мебель')
INSERT [dbo].[Category] ([Category_ID], [Categoty_name]) VALUES (6, N'Накладки')
INSERT [dbo].[Category] ([Category_ID], [Categoty_name]) VALUES (7, N'Панели')
INSERT [dbo].[Category] ([Category_ID], [Categoty_name]) VALUES (8, N'Панно')
INSERT [dbo].[Category] ([Category_ID], [Categoty_name]) VALUES (9, N'Рамы')
INSERT [dbo].[Category] ([Category_ID], [Categoty_name]) VALUES (10, N'Религиозное')
INSERT [dbo].[Category] ([Category_ID], [Categoty_name]) VALUES (11, N'Статуэтки')
INSERT [dbo].[Category] ([Category_ID], [Categoty_name]) VALUES (12, N'Транспорт')
INSERT [dbo].[Category] ([Category_ID], [Categoty_name]) VALUES (13, N'Оружие')
INSERT [dbo].[Category] ([Category_ID], [Categoty_name]) VALUES (14, N'Персонажи')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (1, 1, CAST(N'1998-10-30' AS Date), N'nina8947@rambler.ru', N'+7 (908) 975-84-17', N'Курочкина', N'Ева', N'Егоровна', NULL)
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (2, 2, CAST(N'1985-12-05' AS Date), N'valeriya26061993@gmail.com', N'+7 (977) 659-86-70', N'Шевцов', N'Артём', N'Алексеевич', NULL)
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (3, 3, CAST(N'1998-08-20' AS Date), N'tamara28071968@gmail.com', N'+7 (967) 109-24-64', N'Колосов', N'Фёдор', N'Артёмович', NULL)
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (4, 4, CAST(N'1980-09-19' AS Date), N'lana.nikanorova@ya.ru', N'+7 (949) 461-41-44', N'Трошин', N'Илья', N'Русланович', NULL)
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (5, 1, CAST(N'1988-04-01' AS Date), N'galina31@ya.ru', N'+7 (959) 669-84-67', N'Авдеев', N'Никита', N'Даниилович', NULL)
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (6, 2, CAST(N'2003-05-02' AS Date), N'alina.jitkova@hotmail.com', N'+7 (909) 750-40-73', N'Новиков', N'Максим', N'Артемьевич', NULL)
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (7, 3, CAST(N'1997-08-10' AS Date), N'lyudmila2623@ya.ru', N'+7 (959) 687-36-17', N'Кузнецова', N'Мадина', N'Романовна', NULL)
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (8, 4, CAST(N'1995-11-09' AS Date), N'maryamn@outlook.com', N'+7 (948) 100-44-74', N'Горелов', N'Роман', N'Андреевич', NULL)
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (9, 1, CAST(N'1982-09-20' AS Date), N'mila.kompanec@ya.ru', N'+7 (953) 585-93-11', N'Тихонова', N'София', N'Петровна', NULL)
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (10, 2, CAST(N'1988-10-14' AS Date), N'nadejda2604@ya.ru', N'+7 (973) 473-20-22', N'Жданова', N'Надежда', N'Арсентьевна', NULL)
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (11, 3, CAST(N'2003-03-11' AS Date), N'antonina.rjevskaya@mail.ru', N'+7 (946) 601-30-62', N'Мартынов', N'Максим', N'Петрович', NULL)
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (12, 4, CAST(N'2001-10-21' AS Date), N'kseniya1973@ya.ru', N'+7 (942) 695-47-90', N'Аксенов', N'Сергей', N'Александрович', NULL)
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (13, 1, CAST(N'1995-05-15' AS Date), N'nadejda.mishurinskaya@ya.ru', N'+7 (918) 431-40-72', N'Кузнецова', N'Алиса', N'Станиславовна', NULL)
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (14, 2, CAST(N'1997-04-15' AS Date), N'milana21061962@mail.ru', N'+7 (950) 799-17-35', N'Степанов', N'Егор', N'Андреевич', NULL)
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (15, 3, CAST(N'1990-05-28' AS Date), N'nika.myasnikova@outlook.com', N'+7 (918) 988-42-78', N'Ершова', N'Ксения', N'Тимуровна', NULL)
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (16, 4, CAST(N'1997-12-21' AS Date), N'polina80@rambler.ru', N'+7 (983) 787-51-87', N'Кузьмина', N'Полина', N'Львовна', NULL)
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (17, 1, CAST(N'1989-01-22' AS Date), N'klavdiya1964@hotmail.com', N'+7 (921) 518-37-86', N'Попов', N'Михаил', N'Кириллович', NULL)
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (18, 2, CAST(N'1995-05-08' AS Date), N'zinaida1746@hotmail.com', N'+7 (968) 872-75-65', N'Туманов', N'Константин', N'Олегович', NULL)
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (19, 3, CAST(N'2001-09-15' AS Date), N'mila24071988@hotmail.com', N'+7 (966) 913-46-11', N'Гущин', N'Михаил', N'Дмитриевич', NULL)
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (20, 4, CAST(N'1981-12-31' AS Date), N'lidiya.archibasova@gmail.com', N'+7 (910) 744-75-53', N'Мартынова', N'Алиса', N'Романовна', NULL)
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (21, 1, CAST(N'2002-06-22' AS Date), N'olga9100@hotmail.com', N'+7 (986) 224-84-28', N'Кириллов', N'Иван', N'Глебович', NULL)
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (22, 2, CAST(N'1999-06-18' AS Date), N'nonna19071968@ya.ru', N'+7 (952) 987-43-77', N'Прокофьева', N'Алина', N'Данииловна', NULL)
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (23, 3, CAST(N'1982-10-18' AS Date), N'mariya59@outlook.com', N'+7 (992) 945-32-43', N'Евдокимов', N'Андрей', N'Алексеевич', NULL)
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (24, 4, CAST(N'1999-09-18' AS Date), N'oksana17011996@outlook.com', N'+7 (919) 869-56-84', N'Туманов', N'Михаил', N'Михайлович', NULL)
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (25, 1, CAST(N'1990-10-26' AS Date), N'yuliana41@mail.ru', N'+7 (973) 237-53-51', N'Афанасьев', N'Глеб', N'Дмитриевич', NULL)
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (26, 1, CAST(N'1111-01-01' AS Date), N'1', N'1', N'1', N'1', N'1', N'605ee4cee91ba6223f5d3abdcbce3ed1f.jpg')
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (27, 1, CAST(N'1111-02-01' AS Date), N'2', N'2', N'2', N'2', N'2', N'308b2fa30bbd8dc497f3d3004ac4c23dd.jpg')
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (28, 1, CAST(N'1111-03-03' AS Date), N'3', N'3', N'3', N'3', N'3', N'20289ba0889177f1a9c4343d7d11e3d0d.jpg')
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (29, 1, CAST(N'2011-11-11' AS Date), N'sanguis.sanguis.sanguis@gmail.com', N'89172342536', N'Плеснева', N'Илюза', N'Рашидовна', N'40289ba0889177f1a9c4343d7d11e3d0d.jpg')
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (30, 1, CAST(N'1111-11-11' AS Date), N'eaferg', N'sdgag', N'aga', N'argae', N'aerg', N'3LoverWatch Card Hanzo 2.png')
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (31, 1, CAST(N'1111-11-11' AS Date), N'aefe', N'aergae', N'aerga', N'rgaga', N'agg', N'83a78dada32605d7fe2809e60939f6dc5.jpg')
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (32, 1, CAST(N'2001-01-01' AS Date), N'ыпыукп', N'уцпцп', N'кпыацу', N'пццвацвац', N'цпцыпуп', N'32c721c667020c0e9b7d79864d17f33f0.jpg')
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (33, 1, CAST(N'1944-04-04' AS Date), N'4', N'4', N'4', N'4', N'4', N'135fae19e94397be6d7a822c257812ea2.jpg')
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (34, 1, CAST(N'1995-05-05' AS Date), N'5', N'5', N'5', N'5', N'5', N'1acf2195c992b7ef76cb6b104e862fad7.jpg')
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (35, 1, CAST(N'2000-11-11' AS Date), N'sanguis.sanguis.sanguis@gmail.com', N'89178918912', N'Коноплянник', N'Виталий', N'Астафьевич', N'60289ba0889177f1a9c4343d7d11e3d0d.jpg')
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (36, 1, CAST(N'2000-11-11' AS Date), N'sanguis.sanguis.sanguis2gmail.com', N'88003425364', N'Винник', N'Наталья', N'Константиновна', N'25b7ff7583f72de70807262fc91b0e481.jpg')
INSERT [dbo].[Client] ([Client_ID], [Status_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Image]) VALUES (37, 1, CAST(N'2001-01-01' AS Date), N'sanguis.sanguis.sanguis@gmail.com', N'81923546758', N'Пивозоров', N'Дмитрий', N'Аркадьевич', N'80289ba0889177f1a9c4343d7d11e3d0d.jpg')
SET IDENTITY_INSERT [dbo].[Client] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Employee_ID], [Post_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Pass_Ser], [Pass_Num], [Image]) VALUES (11, 6, N'10.04.1977', N'tiy51@outlook.com', N'+7 (941) 210-93-21', N'Мартынов', N'Виктор', N'Иванович', 4717, 977333, N'111112020.jpg')
INSERT [dbo].[Employee] ([Employee_ID], [Post_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Pass_Ser], [Pass_Num], [Image]) VALUES (12, 2, N'02.08.1968', N'da1962@rambler.ru', N'+7 (975) 755-66-86', N'Воронина', N'Василиса', N'Александровна', 4521, 482318, N'1190190.jpg')
INSERT [dbo].[Employee] ([Employee_ID], [Post_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Pass_Ser], [Pass_Num], [Image]) VALUES (13, 3, N'01.06.1980', N'kiri90@rambler.ru', N'+7 (934) 594-20-53', N'Смирнова', N'Ирина', N'Артёмовна', 4148, 586758, N'15050.jpg')
INSERT [dbo].[Employee] ([Employee_ID], [Post_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Pass_Ser], [Pass_Num], [Image]) VALUES (14, 7, N'15.02.1989', N'vatin1965@gmail.com', N'+7 (990) 875-54-79', N'Савельев', N'Астафий', N'Артёмович', 4575, 943490, N'11100100.jpg')
INSERT [dbo].[Employee] ([Employee_ID], [Post_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Pass_Ser], [Pass_Num], [Image]) VALUES (15, 5, N'22.06.1971', N'akov@rambler.ru', N'+7 (948) 335-22-55', N'Мельникова', N'Ксения', N'Данииловна', 4915, 402743, N'16060.jpg')
INSERT [dbo].[Employee] ([Employee_ID], [Post_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Pass_Ser], [Pass_Num], [Image]) VALUES (16, 6, N'01.12.1963', N'or6163@yandex.ru', N'+7 (998) 948-78-18', N'Харитонова', N'Дарья', N'Данииловна', 4540, 381267, N'14040.jpg')
INSERT [dbo].[Employee] ([Employee_ID], [Post_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Pass_Ser], [Pass_Num], [Image]) VALUES (17, 7, N'10.01.1981', N'trofi32@gmail.com', N'+7 (984) 762-27-48', N'Дорохова', N'Ульяна', N'Андреевна', 4569, 535536, N'11010.jpg')
INSERT [dbo].[Employee] ([Employee_ID], [Post_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Pass_Ser], [Pass_Num], [Image]) VALUES (18, 1, N'05.12.1971', N'kons06071964@yandex.ru', N'+7 (939) 764-47-92', N'Краснопресненский', N'Виталий', N'Егорович', 4141, 484522, N'111.jpg')
INSERT [dbo].[Employee] ([Employee_ID], [Post_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Pass_Ser], [Pass_Num], [Image]) VALUES (19, 2, N'12.09.1983', N'bonch-bruevich@outlook.com', N'+7 (993) 263-94-21', N'Соловьев', N'Святослав', N'Андреевич', 4730, 346971, N'11212121.jpg')
INSERT [dbo].[Employee] ([Employee_ID], [Post_ID], [Birth], [Mail], [Number], [Surname], [Name], [Second_Name], [Pass_Ser], [Pass_Num], [Image]) VALUES (20, 3, N'08.10.1974', N'dav7952@yandex.ru', N'+7 (963) 775-94-49', N'Ковалев', N'Николай', N'Евгеньевич', 4373, 467363, N'11313131.jpg')
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (1, 1, CAST(N'2022-07-05' AS Date), 25449, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (2, 2, CAST(N'2022-11-28' AS Date), 18278, 14)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (3, 3, CAST(N'2021-12-12' AS Date), 9959, 15)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (4, 4, CAST(N'2021-06-12' AS Date), 7087, 18)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (5, 5, CAST(N'2022-01-05' AS Date), 16181, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (6, 6, CAST(N'2022-01-05' AS Date), 23629, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (7, 7, CAST(N'2021-03-21' AS Date), 13080, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (8, 8, CAST(N'2022-05-25' AS Date), 15318, 14)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (9, 9, CAST(N'2022-12-07' AS Date), 9788, 18)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (10, 10, CAST(N'2021-09-14' AS Date), 20170, 18)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (11, 11, CAST(N'2021-01-21' AS Date), 25637, 15)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (12, 12, CAST(N'2022-08-15' AS Date), 19201, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (13, 13, CAST(N'2021-09-12' AS Date), 5495, 18)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (14, 14, CAST(N'2021-12-09' AS Date), 27878, 18)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (15, 15, CAST(N'2021-07-14' AS Date), 29045, 18)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (16, 16, CAST(N'2021-06-17' AS Date), 16899, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (17, 17, CAST(N'2022-05-30' AS Date), 3122, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (18, 18, CAST(N'2022-05-28' AS Date), 15298, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (19, 19, CAST(N'2021-04-16' AS Date), 27404, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (20, 20, CAST(N'2022-09-10' AS Date), 4020, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (21, 21, CAST(N'2022-09-16' AS Date), 11954, 14)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (22, 22, CAST(N'2022-01-10' AS Date), 27975, 15)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (23, 23, CAST(N'2021-03-09' AS Date), 8925, 18)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (24, 24, CAST(N'2021-06-08' AS Date), 2138, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (25, 25, CAST(N'2022-07-23' AS Date), 24786, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (26, 1, CAST(N'2023-05-10' AS Date), 3120, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (27, 1, CAST(N'2023-05-10' AS Date), 16246, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (28, 1, CAST(N'2023-05-10' AS Date), 73677, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (29, 1, CAST(N'2023-05-10' AS Date), 71126, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (30, 1, CAST(N'2023-05-12' AS Date), 54369, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (31, 1, CAST(N'2023-05-12' AS Date), 83528, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (32, 1, CAST(N'2023-05-12' AS Date), 3120, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (33, 1, CAST(N'2023-05-12' AS Date), 28774, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (34, 1, CAST(N'2023-05-12' AS Date), 16246, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (35, 3, CAST(N'2023-05-12' AS Date), 55941, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (36, 1, CAST(N'2023-05-12' AS Date), 28774, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (37, 3, CAST(N'2023-05-12' AS Date), 3120, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (38, 3, CAST(N'2023-05-12' AS Date), 28774, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (39, 3, CAST(N'2023-05-12' AS Date), 16246, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (40, 27, CAST(N'2023-05-12' AS Date), 16246, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (41, 27, CAST(N'2023-05-12' AS Date), 16246, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (42, 1, CAST(N'2023-05-13' AS Date), 55213, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (43, 1, CAST(N'2023-05-13' AS Date), 19033, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (44, 1, CAST(N'2023-05-13' AS Date), 23319, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (45, 27, CAST(N'2023-05-13' AS Date), 23319, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (46, 27, CAST(N'2023-05-13' AS Date), 3120, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (47, 27, CAST(N'2023-05-13' AS Date), 27668, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (48, 27, CAST(N'2023-05-13' AS Date), 23319, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (49, 27, CAST(N'2023-05-13' AS Date), 28774, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (50, 27, CAST(N'2023-05-13' AS Date), 16246, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (51, 27, CAST(N'2023-05-13' AS Date), 28774, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (52, 1, CAST(N'2023-05-13' AS Date), 3120, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (53, 27, CAST(N'2023-05-13' AS Date), 3120, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (54, 36, CAST(N'2023-05-14' AS Date), 37354, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (55, 36, CAST(N'2023-05-14' AS Date), 27668, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (56, 36, CAST(N'2023-05-14' AS Date), 27668, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (57, 36, CAST(N'2023-05-14' AS Date), 27668, 11)
INSERT [dbo].[Order] ([Order_ID], [Client_ID], [Date_order], [Price], [Employee_ID]) VALUES (58, 37, CAST(N'2023-05-14' AS Date), 27668, 11)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[Order_Product] ON 

INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (1, 34, 29)
INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (2, 35, 64)
INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (3, 35, 11)
INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (4, 35, 18)
INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (5, 35, 37)
INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (6, 36, 1)
INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (7, 37, 64)
INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (8, 38, 1)
INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (9, 39, 29)
INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (10, 40, 29)
INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (11, 41, 29)
INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (12, 42, 1)
INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (13, 42, 11)
INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (14, 42, 64)
INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (15, 43, 17)
INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (16, 44, 11)
INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (17, 45, 11)
INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (18, 46, 64)
INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (19, 47, 5)
INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (20, 48, 11)
INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (21, 49, 1)
INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (22, 50, 29)
INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (23, 51, 1)
INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (24, 52, 64)
INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (25, 53, 64)
INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (26, 54, 6)
INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (27, 54, 37)
INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (28, 55, 5)
INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (29, 56, 5)
INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (30, 57, 5)
INSERT [dbo].[Order_Product] ([Order_Product_ID], [Order_ID], [Product_ID]) VALUES (31, 58, 5)
SET IDENTITY_INSERT [dbo].[Order_Product] OFF
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([Post_ID], [Name], [Salary]) VALUES (1, N'Менеджер', 95760)
INSERT [dbo].[Post] ([Post_ID], [Name], [Salary]) VALUES (2, N'IT специалист', 124871)
INSERT [dbo].[Post] ([Post_ID], [Name], [Salary]) VALUES (3, N'Бухгалтер', 110123)
INSERT [dbo].[Post] ([Post_ID], [Name], [Salary]) VALUES (4, N'Консультант', 90221)
INSERT [dbo].[Post] ([Post_ID], [Name], [Salary]) VALUES (5, N'Разработчик 3D моделей', 116526)
INSERT [dbo].[Post] ([Post_ID], [Name], [Salary]) VALUES (6, N'Администратор', 68011)
INSERT [dbo].[Post] ([Post_ID], [Name], [Salary]) VALUES (7, N'Директор', 133294)
SET IDENTITY_INSERT [dbo].[Post] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (1, 1, 1, N'0.jpg', N'Багет профильный', 28774)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (2, 1, 1, N'1.jpg', N'Карниз', 28300)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (3, 1, 1, N'2.jpg', N'Фриз', 28120)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (4, 2, 1, N'3.jpg', N'Барельеф', 27930)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (5, 2, 1, N'4.jpg', N'Бюст', 27668)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (6, 2, 1, N'1175.jpg', N'Бюст жуткого монстра', 25931)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (7, 3, 1, N'6.jpg', N'Дверь резная', 25468)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (8, 3, 1, N'7.jpg', N'Дверная накладка', 25252)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (9, 3, 1, N'8.jpg', N'Корона', 24251)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (10, 3, 1, N'9.jpg', N'Обрамление двери', 23460)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (11, 4, 1, N'10.jpg', N'Балясина', 23319)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (12, 4, 1, N'11.jpg', N'Перила', 21581)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (13, 4, 1, N'12.jpg', N'Подлокотник', 21561)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (14, 4, 1, N'13.jpg', N'Столб', 20979)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (15, 4, 1, N'14.jpg', N'Столб заходный', 20535)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (16, 4, 1, N'15.jpg', N'Навершие', 19759)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (17, 5, 1, N'16.jpg', N'Банкетка', 19033)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (18, 5, 1, N'17.jpg', N'Бра', 18079)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (19, 5, 1, N'18.jpg', N'Ваза', 17894)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (20, 5, 1, N'19.jpg', N'Диван', 17829)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (21, 5, 1, N'20.jpg', N'Комод', 17534)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (22, 5, 1, N'21.jpg', N'Комплект мебели', 17498)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (23, 5, 1, N'22.jpg', N'Консольный столб', 17256)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (24, 5, 1, N'23.jpg', N'Кресло', 17088)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (25, 5, 1, N'24.jpg', N'Ниша', 17014)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (26, 5, 1, N'25.jpg', N'Стол', 16938)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (27, 5, 1, N'26.jpg', N'Стул', 16839)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (28, 5, 1, N'27.jpg', N'Сундук', 16704)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (29, 6, 2, N'128.jpg', N'Акант лиственный', 16246)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (30, 6, 2, N'29.jpg', N'Гирлянда', 14837)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (31, 6, 2, N'30.jpg', N'Розетка', 14636)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (32, 6, 2, N'31.jpg', N'Угловой элемент', 14177)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (33, 7, 2, N'32.jpg', N'Плитка', 13352)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (34, 7, 2, N'33.jpg', N'Решетка', 12399)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (35, 7, 2, N'34.jpg', N'Фигурный', 12165)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (36, 7, 2, N'35.jpg', N'Растительный', 11868)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (37, 7, 2, N'36.jpg', N'Геометрический', 11423)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (38, 8, 2, N'37.jpg', N'Герб', 10769)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (39, 8, 2, N'38.jpg', N'Зодиак', 10750)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (40, 8, 2, N'39.jpg', N'Маска', 9975)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (41, 8, 2, N'40.jpg', N'Медаль', 8021)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (42, 8, 2, N'41.jpg', N'Орден', 7964)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (43, 8, 2, N'42.jpg', N'Портрет', 7701)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (44, 9, 2, N'43.jpg', N'Рама напольная', 7691)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (45, 9, 2, N'44.jpg', N'Рама ТВ-зоны', 7634)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (46, 9, 2, N'45.jpg', N'Рама фигурная', 7566)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (47, 9, 2, N'46.jpg', N'Рама багетная', 7156)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (48, 10, 2, N'47.jpg', N'Иконостас', 7123)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (49, 10, 2, N'48.jpg', N'Икона', 6508)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (50, 10, 2, N'49.jpg', N'Крест распятие', 5645)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (51, 10, 2, N'50.jpg', N'Молитва', 5291)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (52, 11, 2, N'51.jpg', N'Статуя религиозная', 5289)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (53, 11, 2, N'52.jpg', N'Статуя античная', 5205)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (54, 11, 2, N'53.jpg', N'Статуэтка животного', 5143)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (55, 12, 2, N'54.jpg', N'Легковой автомобиль', 4899)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (56, 12, 2, N'55.jpg', N'Грузовой автомобиль', 4751)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (57, 12, 2, N'56.jpg', N'Мотоцикл', 4675)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (58, 12, 2, N'57.jpg', N'Танк', 4371)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (59, 13, 3, N'58.jpg', N'Огнестрельное оружие', 4079)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (60, 13, 3, N'159.jpg', N'Ножик', 3990)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (61, 13, 3, N'60.jpg', N'Фентези оружие', 3730)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (62, 14, 3, N'61.jpg', N'Известная личность', 3662)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (63, 14, 3, N'62.jpg', N'Персонаж для НРИ', 3429)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (64, 14, 3, N'163.jpg', N'Наруто', 3120)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (65, 14, 3, N'64.jpg', N'Монстр', 2228)
INSERT [dbo].[Product] ([Product_ID], [Category_ID], [Purpose_ID], [Image], [Product_name], [Price]) VALUES (66, 14, 3, N'65.jpg', N'Персонаж из игры', 2051)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Purpose] ON 

INSERT [dbo].[Purpose] ([Purpose_ID], [Purpose_name]) VALUES (1, N'ЧПУ')
INSERT [dbo].[Purpose] ([Purpose_ID], [Purpose_name]) VALUES (2, N'3D принтер')
INSERT [dbo].[Purpose] ([Purpose_ID], [Purpose_name]) VALUES (3, N'3D MAX')
SET IDENTITY_INSERT [dbo].[Purpose] OFF
INSERT [dbo].[Role] ([Role_ID], [Name_role]) VALUES (1, N'Клиент')
INSERT [dbo].[Role] ([Role_ID], [Name_role]) VALUES (2, N'Администратор')
SET IDENTITY_INSERT [dbo].[Sale] ON 

INSERT [dbo].[Sale] ([Sale_ID], [Percent_sale], [Status_ID]) VALUES (1, N'0', 1)
INSERT [dbo].[Sale] ([Sale_ID], [Percent_sale], [Status_ID]) VALUES (2, N'5', 2)
INSERT [dbo].[Sale] ([Sale_ID], [Percent_sale], [Status_ID]) VALUES (3, N'10', 3)
INSERT [dbo].[Sale] ([Sale_ID], [Percent_sale], [Status_ID]) VALUES (4, N'25', 4)
SET IDENTITY_INSERT [dbo].[Sale] OFF
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Status_ID], [Name], [Sale_ID]) VALUES (1, N'Новичок', 1)
INSERT [dbo].[Status] ([Status_ID], [Name], [Sale_ID]) VALUES (2, N'Любитель', 2)
INSERT [dbo].[Status] ([Status_ID], [Name], [Sale_ID]) VALUES (3, N'Постоянный покупатель', 3)
INSERT [dbo].[Status] ([Status_ID], [Name], [Sale_ID]) VALUES (4, N'Ценитель качества', 4)
SET IDENTITY_INSERT [dbo].[Status] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Auth_ID], [Login], [Password], [Role_ID], [Client_ID]) VALUES (1, N'1111', N'1111', 1, 1)
INSERT [dbo].[User] ([Auth_ID], [Login], [Password], [Role_ID], [Client_ID]) VALUES (2, N'2222', N'2222', 2, 2)
INSERT [dbo].[User] ([Auth_ID], [Login], [Password], [Role_ID], [Client_ID]) VALUES (3, N'3333', N'3333', 1, 3)
INSERT [dbo].[User] ([Auth_ID], [Login], [Password], [Role_ID], [Client_ID]) VALUES (4, N'4444', N'4444', 1, 4)
INSERT [dbo].[User] ([Auth_ID], [Login], [Password], [Role_ID], [Client_ID]) VALUES (5, N'5555', N'5555', 2, 5)
INSERT [dbo].[User] ([Auth_ID], [Login], [Password], [Role_ID], [Client_ID]) VALUES (6, N'6666', N'6666', 1, 6)
INSERT [dbo].[User] ([Auth_ID], [Login], [Password], [Role_ID], [Client_ID]) VALUES (7, N'7777', N'7777', 1, 7)
INSERT [dbo].[User] ([Auth_ID], [Login], [Password], [Role_ID], [Client_ID]) VALUES (8, N'2', N'2', 1, 27)
INSERT [dbo].[User] ([Auth_ID], [Login], [Password], [Role_ID], [Client_ID]) VALUES (9, N'3', N'3', 1, 28)
INSERT [dbo].[User] ([Auth_ID], [Login], [Password], [Role_ID], [Client_ID]) VALUES (10, N'anime', N'anime', 1, 29)
INSERT [dbo].[User] ([Auth_ID], [Login], [Password], [Role_ID], [Client_ID]) VALUES (11, N'aaa', N'aaa', 1, 30)
INSERT [dbo].[User] ([Auth_ID], [Login], [Password], [Role_ID], [Client_ID]) VALUES (12, N'q', N'q', 1, 31)
INSERT [dbo].[User] ([Auth_ID], [Login], [Password], [Role_ID], [Client_ID]) VALUES (13, N'32', N'32', 1, 32)
INSERT [dbo].[User] ([Auth_ID], [Login], [Password], [Role_ID], [Client_ID]) VALUES (14, N'4', N'4', 1, 33)
INSERT [dbo].[User] ([Auth_ID], [Login], [Password], [Role_ID], [Client_ID]) VALUES (15, N'5', N'5', 1, 34)
INSERT [dbo].[User] ([Auth_ID], [Login], [Password], [Role_ID], [Client_ID]) VALUES (16, N'qwerty', N'qwerty', 1, 35)
INSERT [dbo].[User] ([Auth_ID], [Login], [Password], [Role_ID], [Client_ID]) VALUES (17, N'qrqr', N'qrqr', 1, 36)
INSERT [dbo].[User] ([Auth_ID], [Login], [Password], [Role_ID], [Client_ID]) VALUES (18, N'778', N'778', 1, 37)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Status] FOREIGN KEY([Status_ID])
REFERENCES [dbo].[Status] ([Status_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Status]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Post] FOREIGN KEY([Post_ID])
REFERENCES [dbo].[Post] ([Post_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Post]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Client] FOREIGN KEY([Client_ID])
REFERENCES [dbo].[Client] ([Client_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Client]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Employee] FOREIGN KEY([Employee_ID])
REFERENCES [dbo].[Employee] ([Employee_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Employee]
GO
ALTER TABLE [dbo].[Order_Product]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product_Order] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Order] ([Order_ID])
GO
ALTER TABLE [dbo].[Order_Product] CHECK CONSTRAINT [FK_Order_Product_Order]
GO
ALTER TABLE [dbo].[Order_Product]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product_Product] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[Order_Product] CHECK CONSTRAINT [FK_Order_Product_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Category] ([Category_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Purpose] FOREIGN KEY([Purpose_ID])
REFERENCES [dbo].[Purpose] ([Purpose_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Purpose]
GO
ALTER TABLE [dbo].[Status]  WITH CHECK ADD  CONSTRAINT [FK_Status_Sale] FOREIGN KEY([Sale_ID])
REFERENCES [dbo].[Sale] ([Sale_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Status] CHECK CONSTRAINT [FK_Status_Sale]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Client] FOREIGN KEY([Client_ID])
REFERENCES [dbo].[Client] ([Client_ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Client]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([Role_ID])
REFERENCES [dbo].[Role] ([Role_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [ModelFirm] SET  READ_WRITE 
GO
