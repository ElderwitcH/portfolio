USE [master]
GO
/****** Object:  Database [TeaShop]    Script Date: 19.06.2023 16:25:31 ******/
CREATE DATABASE [TeaShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TeaShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\TeaShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TeaShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\TeaShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TeaShop] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TeaShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TeaShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TeaShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TeaShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TeaShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TeaShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [TeaShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TeaShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TeaShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TeaShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TeaShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TeaShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TeaShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TeaShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TeaShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TeaShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TeaShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TeaShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TeaShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TeaShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TeaShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TeaShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TeaShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TeaShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TeaShop] SET  MULTI_USER 
GO
ALTER DATABASE [TeaShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TeaShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TeaShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TeaShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TeaShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TeaShop] SET QUERY_STORE = OFF
GO
USE [TeaShop]
GO
/****** Object:  Table [dbo].[bag]    Script Date: 19.06.2023 16:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bag](
	[order_ID] [int] NOT NULL,
	[tea_ID] [int] NOT NULL,
	[count] [int] NULL,
	[bag_ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_bag] PRIMARY KEY CLUSTERED 
(
	[bag_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 19.06.2023 16:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[customer_ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[surname] [nvarchar](50) NOT NULL,
	[secondname] [nvarchar](50) NULL,
	[birth] [date] NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delivery]    Script Date: 19.06.2023 16:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delivery](
	[delivery_ID] [int] IDENTITY(1,1) NOT NULL,
	[delivery_type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_delivery] PRIMARY KEY CLUSTERED 
(
	[delivery_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 19.06.2023 16:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[employee_ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[surname] [nvarchar](50) NOT NULL,
	[secondname] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NOT NULL,
	[post_ID] [int] NOT NULL,
	[image] [nvarchar](50) NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[employee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 19.06.2023 16:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[order_ID] [int] IDENTITY(1,1) NOT NULL,
	[customer_ID] [int] NOT NULL,
	[delivery_ID] [int] NULL,
	[customer_address] [nvarchar](50) NULL,
	[date_order] [date] NULL,
	[price_order] [float] NULL,
	[employee_ID] [int] NOT NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post]    Script Date: 19.06.2023 16:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post](
	[post_ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[salary] [float] NOT NULL,
 CONSTRAINT [PK_post] PRIMARY KEY CLUSTERED 
(
	[post_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provider]    Script Date: 19.06.2023 16:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provider](
	[provider_ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[country] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_provider] PRIMARY KEY CLUSTERED 
(
	[provider_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tea]    Script Date: 19.06.2023 16:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tea](
	[tea_ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[type_ID] [int] NOT NULL,
	[price] [float] NOT NULL,
	[image] [nvarchar](50) NULL,
	[description] [nvarchar](500) NULL,
	[provider_ID] [int] NOT NULL,
	[count] [int] NULL,
 CONSTRAINT [PK_tea] PRIMARY KEY CLUSTERED 
(
	[tea_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type]    Script Date: 19.06.2023 16:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type](
	[type_ID] [int] IDENTITY(1,1) NOT NULL,
	[category] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_type] PRIMARY KEY CLUSTERED 
(
	[type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 19.06.2023 16:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[customer] ON 

INSERT [dbo].[customer] ([customer_ID], [name], [surname], [secondname], [birth], [email], [phone]) VALUES (1, N'Антон', N'Борисенко', NULL, CAST(N'2000-11-12' AS Date), N'tokyoghoul@mail.ru', N'+73456736459')
INSERT [dbo].[customer] ([customer_ID], [name], [surname], [secondname], [birth], [email], [phone]) VALUES (2, N'Дмитрий', N'Ржевский', N'Алексеевич', CAST(N'1987-03-10' AS Date), N'rzhakalol@mail.ru', N'+78346574822')
INSERT [dbo].[customer] ([customer_ID], [name], [surname], [secondname], [birth], [email], [phone]) VALUES (3, N'Валентина', N'Мирная', NULL, CAST(N'1999-09-09' AS Date), N'whyitshappening@gmail.com', N'+78465783977')
INSERT [dbo].[customer] ([customer_ID], [name], [surname], [secondname], [birth], [email], [phone]) VALUES (4, N'Аркадий', N'Паровозов', N'Дмитриевич', CAST(N'2003-12-12' AS Date), N'todoomhealer@gmail.com', N'+74788383757')
INSERT [dbo].[customer] ([customer_ID], [name], [surname], [secondname], [birth], [email], [phone]) VALUES (5, N'Алиса', N'Улыбахина', N'Александровна', CAST(N'2002-02-02' AS Date), N'murulebehappy@gmail.com', N'+78547748399')
INSERT [dbo].[customer] ([customer_ID], [name], [surname], [secondname], [birth], [email], [phone]) VALUES (6, N'Варвара', N'Лаптева', N'Ивановна', CAST(N'2003-03-03' AS Date), N'murderedsoul@mail.ru', N'+77478537888')
SET IDENTITY_INSERT [dbo].[customer] OFF
SET IDENTITY_INSERT [dbo].[delivery] ON 

INSERT [dbo].[delivery] ([delivery_ID], [delivery_type]) VALUES (1, N'Почта России')
INSERT [dbo].[delivery] ([delivery_ID], [delivery_type]) VALUES (2, N'Сдэк')
INSERT [dbo].[delivery] ([delivery_ID], [delivery_type]) VALUES (3, N'До двери')
SET IDENTITY_INSERT [dbo].[delivery] OFF
SET IDENTITY_INSERT [dbo].[employee] ON 

INSERT [dbo].[employee] ([employee_ID], [name], [surname], [secondname], [email], [phone], [post_ID], [image]) VALUES (1, N'Крис', N'Редфилд', NULL, NULL, N'+64875674352', 1, N'14a8d8864593288bf6cf9e7df4042618f.jpg')
INSERT [dbo].[employee] ([employee_ID], [name], [surname], [secondname], [email], [phone], [post_ID], [image]) VALUES (2, N'Джилл', N'Валентайн', NULL, NULL, N'+77733949928', 1, N'1Sq4ZtgHvA0G578O0jK9LrA.jpeg')
INSERT [dbo].[employee] ([employee_ID], [name], [surname], [secondname], [email], [phone], [post_ID], [image]) VALUES (3, N'Леон', N'Кеннеди', N'Скотт', NULL, N'+65748886663', 2, N'1211897.jpg')
INSERT [dbo].[employee] ([employee_ID], [name], [surname], [secondname], [email], [phone], [post_ID], [image]) VALUES (4, N'Клэр', N'Редфилд', NULL, NULL, N'+74784857865', 5, N'1image.jpg')
INSERT [dbo].[employee] ([employee_ID], [name], [surname], [secondname], [email], [phone], [post_ID], [image]) VALUES (5, N'Адааааааааааа', N'Вонг', NULL, N'64ret3grt', N'+94475783920', 1, N'1980831.jpg')
INSERT [dbo].[employee] ([employee_ID], [name], [surname], [secondname], [email], [phone], [post_ID], [image]) VALUES (6, N'Итан', N'Уинтерс', N'Умер', NULL, N'+65748839587', 4, N'1e0ff508c-5ec1-484d-8253-6238b9378ea5.jpg')
INSERT [dbo].[employee] ([employee_ID], [name], [surname], [secondname], [email], [phone], [post_ID], [image]) VALUES (7, N'Эшли', N'Грэээээм', NULL, N'olkek@gmail.com', N'+57746384859', 5, N'11maxresdefault.jpg')
INSERT [dbo].[employee] ([employee_ID], [name], [surname], [secondname], [email], [phone], [post_ID], [image]) VALUES (8, N'Кассандра', N'Димитреску', NULL, NULL, N'+64788565677', 5, N'1zkTAFsBazVax8EPSF0-PGw.png')
INSERT [dbo].[employee] ([employee_ID], [name], [surname], [secondname], [email], [phone], [post_ID], [image]) VALUES (9, N'Бэла', N'Димитреску', NULL, NULL, N'+94578383899', 1, N'14ea5781b-fac3-4515-b510-b11f99005d49.jpg')
INSERT [dbo].[employee] ([employee_ID], [name], [surname], [secondname], [email], [phone], [post_ID], [image]) VALUES (10, N'Даниэла', N'Димитреску', NULL, NULL, N'+65737838599', 4, N'1579c4dfa-d32d-4b4a-a755-333509406f94.jpg')
INSERT [dbo].[employee] ([employee_ID], [name], [surname], [secondname], [email], [phone], [post_ID], [image]) VALUES (11, N'Донна', N'Беневиенто', NULL, NULL, N'+56677348857', 4, N'1629ff1aa-1d1c-4d13-9a09-72980200d177.jpg')
SET IDENTITY_INSERT [dbo].[employee] OFF
SET IDENTITY_INSERT [dbo].[post] ON 

INSERT [dbo].[post] ([post_ID], [name], [salary]) VALUES (1, N'Кассир', 14000)
INSERT [dbo].[post] ([post_ID], [name], [salary]) VALUES (2, N'Директор', 95384)
INSERT [dbo].[post] ([post_ID], [name], [salary]) VALUES (3, N'Администратор', 48900)
INSERT [dbo].[post] ([post_ID], [name], [salary]) VALUES (4, N'Уборщик', 20647)
INSERT [dbo].[post] ([post_ID], [name], [salary]) VALUES (5, N'Консультант', 12560)
SET IDENTITY_INSERT [dbo].[post] OFF
SET IDENTITY_INSERT [dbo].[provider] ON 

INSERT [dbo].[provider] ([provider_ID], [name], [email], [phone], [country]) VALUES (1, N'"Sollar"', N'sollarcityty@gmail.com', N'+79178354672', N'Россия')
INSERT [dbo].[provider] ([provider_ID], [name], [email], [phone], [country]) VALUES (3, N'"Kuznetsky"', N'kuznetstea@gmail.com', N'+79165748576', N'Китай')
INSERT [dbo].[provider] ([provider_ID], [name], [email], [phone], [country]) VALUES (4, N'"FindExit"', N'naityvihod@mail.ru', N'+74658234561', N'Китай')
INSERT [dbo].[provider] ([provider_ID], [name], [email], [phone], [country]) VALUES (5, N'"Woee33"', N'byebyetea@mail.ru', N'+78346574837', N'Латвия')
INSERT [dbo].[provider] ([provider_ID], [name], [email], [phone], [country]) VALUES (6, N'"PyrokinesisTeaShop"', N'goddespyro@mail.ru', N'+79184537456', N'Польша')
INSERT [dbo].[provider] ([provider_ID], [name], [email], [phone], [country]) VALUES (7, N'"Umbrella"', N'residenttea9@mail.ru', N'+76663928450', N'Япония')
INSERT [dbo].[provider] ([provider_ID], [name], [email], [phone], [country]) VALUES (8, N'"Traxxxmania"', N'gone.flutea@mail.ru', N'+73546536895', N'Китай')
SET IDENTITY_INSERT [dbo].[provider] OFF
SET IDENTITY_INSERT [dbo].[tea] ON 

INSERT [dbo].[tea] ([tea_ID], [name], [type_ID], [price], [image], [description], [provider_ID], [count]) VALUES (1, N'Badamtam', 11, 123.56, N'211.jpg', N'Первоклассный сорт Badamtam произрастает в восточной равнине Дарджилинга на высоте 2100 метров, в предгорьях Гималаев. Чайные листики чая бережно скатанные матового серебристо-зелёного цвета, с белоснежными краплениями. Отвар чая получается золотистого цвета, приобретающий аромат с миндальным привкусом и оставляет необычайно продолжительное ощущение. Мощный и достаточно непростой запах чая Бадамтам навевает многоцветные и приятнейшие эмоции.', 1, 13)
INSERT [dbo].[tea] ([tea_ID], [name], [type_ID], [price], [image], [description], [provider_ID], [count]) VALUES (7, N'Dark Gold', 6, 200.99, N'4.jpg', N'Черное золото выращивается в северной провинции Китая Фуцзянь. Собирается вручную на элитных чайных плантациях. Причем для напитка берут самые молодые листики. Подсушенные в тени чайные листья избавляются от лишней влаги и в дальнейшем опытные фермеры по специальной технологии обрабатывают их для получения неповторимого вкуса.
', 6, 35)
INSERT [dbo].[tea] ([tea_ID], [name], [type_ID], [price], [image], [description], [provider_ID], [count]) VALUES (9, N'Puff Sword', 6, 120000.99, N'11319.jpg', N'Цзинь Хао Дянь Хун – несомненно королевский подвид красного чая всецело ручной выделки. Для его изготовления употребляются лишь первоклассные молодые почки (типсы), покрытые тончайшими коричневыми чешуйками, которые по окончании переработки обретают мягчайший ярко-жёлтый цвет. Темно-ореховый настой завоёвывает своим терпким привкусом с цветочно — фруктовыми нотками и богатейшим запахом с карамельными и пряными колоритами.', 1, 12)
INSERT [dbo].[tea] ([tea_ID], [name], [type_ID], [price], [image], [description], [provider_ID], [count]) VALUES (10, N'Golden Snail', 6, 267.89, N'6.jpg', N'Красный чай из Юннани, Цзинь Ло значит " Золотые Спирали ". Другой название аналогичного вида " Хун Би Ло ", " Красные Спирали ". Для этого чая собирают только верхнюю почку и два нижних листка, которые в процессе переработки закручивают в маленькие спирали — шары. Чай чрезвычайно пахучий, с окрасами сухофруктов, табака и карамельным бархатистым вкусом.', 7, 9)
INSERT [dbo].[tea] ([tea_ID], [name], [type_ID], [price], [image], [description], [provider_ID], [count]) VALUES (11, N'Cat-D', 5, 90.99, N'7.jpg', N'Чай из душицы полезный напиток. Эта лекарственная трава способна предупредить развитие многих заболеваний и помочь улучшить состояние при различных заболеваниях. Растет душица, которая относится к семейству яснотковых (к нему также относятся мята, чабер, тимьян и розмарин), на лугах и склонах холмов по всей России. В Европе она известна под названием орегано и используется преимущественно в качестве приправы к блюдам средиземноморской кухни.', 8, 10)
INSERT [dbo].[tea] ([tea_ID], [name], [type_ID], [price], [image], [description], [provider_ID], [count]) VALUES (13, N'Bai Mu Dan', 7, 330.44, N'1317.jpg', N'Листовой китайский чай Бай Му Дань переводиться как " Белый пион ". Чай именуют из-за крупных и объёмных форм своих листочков, естественно скрученных. Методика сбора исключительная, свежайшие почки срывают с двумя рядом произрастающими, до неполного размера чайными листами. Природную форму и цвет обеспечивает наименьшая обработка листков. ', 1, 24)
INSERT [dbo].[tea] ([tea_ID], [name], [type_ID], [price], [image], [description], [provider_ID], [count]) VALUES (14, N'Margarets', 11, 97576880.99, N'29.jpg', N'Первосортный Дарджилинг весеннего сбора собирается высоко в горах, в маленьких фазендах. Для такого сорта чая применяют тёмные листки мелкого габарита, типсы и полуферментированные зеленые листки. Неслучайно оптовая продажа чаем Маргаретс Хоуп давно приобретает всемирной масштаб. Чайный отвар, обладает цветочно-медовым привкусом с мускатными оттенками и нежнейшим, свежайшим запахом.', 1, 7)
INSERT [dbo].[tea] ([tea_ID], [name], [type_ID], [price], [image], [description], [provider_ID], [count]) VALUES (16, N'Rishihat', 11, 679.99, N'10.jpg', N'Ришихат в переводе символизирует " Дом Святых ". Данный сорт произрастает на высоте 2500 метров над побережьем на индийской фазенде. Чайные кустарники вобрали в себя чудный и целительный свеженький высокогорный воздух, это наделяет отвар неповторимыми веществами и неповторимыми обонятельными свойствами. При приготовлении такой настой дает тончайший цветочный запах и прекраснейший плодотворный вкус со сладковатыми нотами. ', 1, 4)
INSERT [dbo].[tea] ([tea_ID], [name], [type_ID], [price], [image], [description], [provider_ID], [count]) VALUES (17, N'Mango Matcha', 9, 299.99, N'15.jpg', N'Напиток Манговая Матча подойдет для любителей трендов здорового питания. Чаи Матча минимально калорийны, такой напиток можно добавлять к смузи, различным вегетарианским блюдам и коктейлям.', 5, 15)
INSERT [dbo].[tea] ([tea_ID], [name], [type_ID], [price], [image], [description], [provider_ID], [count]) VALUES (18, N'Pumpkin Matcha', 9, 229.99, N'16.jpg', N'Тыквенная Матча приобретает сладостный вкус и ярко-жёлтый цвет. Поэтому умелые кулинары применяют его в качестве настоящего пигмента при изготовлении самых различных кушаний, коктейлей и выпечки. От классического чая матча Тыквенная Матча отличается отсутствием в составе растертых в пыль чайных листков. ', 5, 10)
INSERT [dbo].[tea] ([tea_ID], [name], [type_ID], [price], [image], [description], [provider_ID], [count]) VALUES (22, N'Lyu Ya Bao', 7, 172.3, N'1319.jpg', N'Белый чай Люй Я Бао с китайского означает «Весенние почки Юннаня». Для этого сорта чая собирают с плантаций Юннань только что раскрывшиеся белые ворсистые почки с пуэрных чайных деревьев. Чайный напиток взбудоражит даже самых прихотливых знатоков китайского чая. Превосходный запах свежести и нежный фруктовый вкус со светло-оранжевым настоем, расслабит и предаст душевного равновесия.', 7, 12)
INSERT [dbo].[tea] ([tea_ID], [name], [type_ID], [price], [image], [description], [provider_ID], [count]) VALUES (23, N'I Sin Hun Cha', 6, 239.99, N'1218.jpg', N'Красный чай выращивается на плантациях китайской провинции Цзянсу. После заваривания напиток приобретает глубокий янтарный цвет. По вкусовым качествам чай напоминает терпкий настой с едва заметной кислинкой. Ценитель чайных коллекций также сможет распознать нотки груши и шоколада. Каждый листик чайного куста пропитывается ароматом цветущих деревьев, который можно ощутить во время заваривания напитка.', 5, 23)
SET IDENTITY_INSERT [dbo].[tea] OFF
SET IDENTITY_INSERT [dbo].[type] ON 

INSERT [dbo].[type] ([type_ID], [category]) VALUES (1, N'Черный')
INSERT [dbo].[type] ([type_ID], [category]) VALUES (2, N'Зеленый')
INSERT [dbo].[type] ([type_ID], [category]) VALUES (3, N'Пуэр')
INSERT [dbo].[type] ([type_ID], [category]) VALUES (4, N'Улун')
INSERT [dbo].[type] ([type_ID], [category]) VALUES (5, N'Травяной')
INSERT [dbo].[type] ([type_ID], [category]) VALUES (6, N'Красный')
INSERT [dbo].[type] ([type_ID], [category]) VALUES (7, N'Белый')
INSERT [dbo].[type] ([type_ID], [category]) VALUES (8, N'Желтый')
INSERT [dbo].[type] ([type_ID], [category]) VALUES (9, N'Матча')
INSERT [dbo].[type] ([type_ID], [category]) VALUES (10, N'Габа')
INSERT [dbo].[type] ([type_ID], [category]) VALUES (11, N'Дарджилинг')
SET IDENTITY_INSERT [dbo].[type] OFF
INSERT [dbo].[user] ([id], [login], [password]) VALUES (1, N'admin', N'1111')
INSERT [dbo].[user] ([id], [login], [password]) VALUES (2, N'user', N'0000')
ALTER TABLE [dbo].[bag]  WITH CHECK ADD  CONSTRAINT [FK_bag_order] FOREIGN KEY([order_ID])
REFERENCES [dbo].[order] ([order_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[bag] CHECK CONSTRAINT [FK_bag_order]
GO
ALTER TABLE [dbo].[bag]  WITH CHECK ADD  CONSTRAINT [FK_bag_tea] FOREIGN KEY([tea_ID])
REFERENCES [dbo].[tea] ([tea_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[bag] CHECK CONSTRAINT [FK_bag_tea]
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [FK_employee_post] FOREIGN KEY([post_ID])
REFERENCES [dbo].[post] ([post_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [FK_employee_post]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_customer] FOREIGN KEY([customer_ID])
REFERENCES [dbo].[customer] ([customer_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_customer]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_delivery] FOREIGN KEY([delivery_ID])
REFERENCES [dbo].[delivery] ([delivery_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_delivery]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_employee] FOREIGN KEY([employee_ID])
REFERENCES [dbo].[employee] ([employee_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_employee]
GO
ALTER TABLE [dbo].[tea]  WITH CHECK ADD  CONSTRAINT [FK_tea_provider] FOREIGN KEY([provider_ID])
REFERENCES [dbo].[provider] ([provider_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tea] CHECK CONSTRAINT [FK_tea_provider]
GO
ALTER TABLE [dbo].[tea]  WITH CHECK ADD  CONSTRAINT [FK_tea_type] FOREIGN KEY([type_ID])
REFERENCES [dbo].[type] ([type_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tea] CHECK CONSTRAINT [FK_tea_type]
GO
USE [master]
GO
ALTER DATABASE [TeaShop] SET  READ_WRITE 
GO
