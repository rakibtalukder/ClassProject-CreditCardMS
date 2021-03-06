USE [master]
GO
/****** Object:  Database [CreditCardMS]    Script Date: 4/5/2019 1:40:32 AM ******/
CREATE DATABASE [CreditCardMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CreditCardMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CreditCardMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CreditCardMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CreditCardMS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CreditCardMS] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CreditCardMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CreditCardMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CreditCardMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CreditCardMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CreditCardMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CreditCardMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [CreditCardMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CreditCardMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CreditCardMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CreditCardMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CreditCardMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CreditCardMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CreditCardMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CreditCardMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CreditCardMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CreditCardMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CreditCardMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CreditCardMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CreditCardMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CreditCardMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CreditCardMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CreditCardMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CreditCardMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CreditCardMS] SET RECOVERY FULL 
GO
ALTER DATABASE [CreditCardMS] SET  MULTI_USER 
GO
ALTER DATABASE [CreditCardMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CreditCardMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CreditCardMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CreditCardMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CreditCardMS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CreditCardMS', N'ON'
GO
ALTER DATABASE [CreditCardMS] SET QUERY_STORE = OFF
GO
USE [CreditCardMS]
GO
/****** Object:  Table [dbo].[CardStatus]    Script Date: 4/5/2019 1:40:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardStatus](
	[CardStatusId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[CardNumber] [varchar](50) NOT NULL,
	[CardType] [int] NOT NULL,
	[CardStatus] [varchar](50) NULL,
 CONSTRAINT [PK_CardStatus] PRIMARY KEY CLUSTERED 
(
	[CardStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardType]    Script Date: 4/5/2019 1:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardType](
	[CardId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[LimitAmount] [float] NOT NULL,
	[ServiceCharge] [float] NOT NULL,
 CONSTRAINT [PK_CardType] PRIMARY KEY CLUSTERED 
(
	[CardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 4/5/2019 1:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Present_Address] [varchar](500) NULL,
	[Parmanent_Address] [varchar](500) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[CardNumber] [nchar](10) NULL,
	[CardType] [int] NULL,
	[CustomerStatus] [varchar](50) NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerAssignMoney]    Script Date: 4/5/2019 1:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAssignMoney](
	[ApplyingId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[CardNo] [int] NOT NULL,
	[CardType] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[ApplyingMonth] [int] NOT NULL,
	[ApplyingStatus] [varchar](1000) NULL,
	[Message] [varchar](500) NULL,
 CONSTRAINT [PK_CustomerAssignMoney] PRIMARY KEY CLUSTERED 
(
	[ApplyingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerConsumingMoney]    Script Date: 4/5/2019 1:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerConsumingMoney](
	[ConsumeId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[ConsumeDate] [datetime] NOT NULL,
	[ConsumeMoney] [float] NOT NULL,
	[TotalConsumeMoney] [float] NULL,
	[CashBackMoney] [float] NULL,
 CONSTRAINT [PK_CustomerConsumingMoney] PRIMARY KEY CLUSTERED 
(
	[ConsumeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerMonthlyPaid]    Script Date: 4/5/2019 1:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerMonthlyPaid](
	[MonthlyPaidId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[CardNo] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[ApplyingMoney] [float] NULL,
	[ConsumeMoney] [float] NULL,
	[PaidMoney] [float] NULL,
	[ServiceCharge] [float] NULL,
	[Fine] [float] NULL,
	[CashBack] [float] NULL,
	[TotalBill] [float] NULL,
	[PaidStatus] [varchar](50) NULL,
 CONSTRAINT [PK_CustomerMonthlyPaid] PRIMARY KEY CLUSTERED 
(
	[MonthlyPaidId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerPaidMoney]    Script Date: 4/5/2019 1:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerPaidMoney](
	[PaidId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[PaidDate] [datetime] NOT NULL,
	[PaidMoney] [float] NOT NULL,
 CONSTRAINT [PK_CustomerPaidMoney] PRIMARY KEY CLUSTERED 
(
	[PaidId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonthTbl]    Script Date: 4/5/2019 1:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonthTbl](
	[MonthId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ShortOrder] [int] NULL,
 CONSTRAINT [PK_MonthTbl] PRIMARY KEY CLUSTERED 
(
	[MonthId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reward]    Script Date: 4/5/2019 1:40:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reward](
	[RewardsId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[RewardDate] [datetime] NULL,
	[RewardsPoint] [int] NOT NULL,
	[TotalAmount] [float] NULL,
 CONSTRAINT [PK_Reward] PRIMARY KEY CLUSTERED 
(
	[RewardsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CardStatus] ON 

INSERT [dbo].[CardStatus] ([CardStatusId], [CustomerId], [CardNumber], [CardType], [CardStatus]) VALUES (2, 2, N'123123', 1, N'Active')
INSERT [dbo].[CardStatus] ([CardStatusId], [CustomerId], [CardNumber], [CardType], [CardStatus]) VALUES (4, 4, N'1234567', 1, N'Active')
SET IDENTITY_INSERT [dbo].[CardStatus] OFF
SET IDENTITY_INSERT [dbo].[CardType] ON 

INSERT [dbo].[CardType] ([CardId], [Name], [LimitAmount], [ServiceCharge]) VALUES (1, N'Golden', 100000, 15)
INSERT [dbo].[CardType] ([CardId], [Name], [LimitAmount], [ServiceCharge]) VALUES (2, N'Silver', 80000, 10)
INSERT [dbo].[CardType] ([CardId], [Name], [LimitAmount], [ServiceCharge]) VALUES (3, N'Bronze', 50000, 12)
SET IDENTITY_INSERT [dbo].[CardType] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerId], [Name], [Present_Address], [Parmanent_Address], [Phone], [Email], [CardNumber], [CardType], [CustomerStatus], [Password]) VALUES (2, N'Rakib', N'Uttara', N'Nuwakhali', N'01676661706', N'rakib@gmail.com', N'123123    ', 1, N'Active', N'1234')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Present_Address], [Parmanent_Address], [Phone], [Email], [CardNumber], [CardType], [CustomerStatus], [Password]) VALUES (4, N'najmul', N'Bashundhara', N'Lakshmipur', N'018124242818', N'rakibsumu@gmail.com', N'1234567   ', 1, N'Active', N'1234')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[CustomerAssignMoney] ON 

INSERT [dbo].[CustomerAssignMoney] ([ApplyingId], [CustomerId], [CardNo], [CardType], [Amount], [ApplyingMonth], [ApplyingStatus], [Message]) VALUES (7, 2, 123123, 1, 100000, 1, NULL, N'Enter your Message')
INSERT [dbo].[CustomerAssignMoney] ([ApplyingId], [CustomerId], [CardNo], [CardType], [Amount], [ApplyingMonth], [ApplyingStatus], [Message]) VALUES (8, 2, 123123, 1, 100000, 2, N'Approved', NULL)
INSERT [dbo].[CustomerAssignMoney] ([ApplyingId], [CustomerId], [CardNo], [CardType], [Amount], [ApplyingMonth], [ApplyingStatus], [Message]) VALUES (9, 4, 1234567, 1, 100000, 1, N'Approved', NULL)
SET IDENTITY_INSERT [dbo].[CustomerAssignMoney] OFF
SET IDENTITY_INSERT [dbo].[CustomerConsumingMoney] ON 

INSERT [dbo].[CustomerConsumingMoney] ([ConsumeId], [CustomerId], [Month], [ConsumeDate], [ConsumeMoney], [TotalConsumeMoney], [CashBackMoney]) VALUES (6, 2, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), 30000, NULL, NULL)
INSERT [dbo].[CustomerConsumingMoney] ([ConsumeId], [CustomerId], [Month], [ConsumeDate], [ConsumeMoney], [TotalConsumeMoney], [CashBackMoney]) VALUES (7, 2, 2, CAST(N'2019-04-03T00:00:00.000' AS DateTime), 10000, NULL, NULL)
INSERT [dbo].[CustomerConsumingMoney] ([ConsumeId], [CustomerId], [Month], [ConsumeDate], [ConsumeMoney], [TotalConsumeMoney], [CashBackMoney]) VALUES (8, 2, 2, CAST(N'2019-04-17T00:00:00.000' AS DateTime), 30000, NULL, NULL)
INSERT [dbo].[CustomerConsumingMoney] ([ConsumeId], [CustomerId], [Month], [ConsumeDate], [ConsumeMoney], [TotalConsumeMoney], [CashBackMoney]) VALUES (9, 2, 2, CAST(N'2019-01-29T00:00:00.000' AS DateTime), 30000, NULL, NULL)
INSERT [dbo].[CustomerConsumingMoney] ([ConsumeId], [CustomerId], [Month], [ConsumeDate], [ConsumeMoney], [TotalConsumeMoney], [CashBackMoney]) VALUES (10, 2, 2, CAST(N'2019-04-24T00:00:00.000' AS DateTime), 30000, NULL, NULL)
INSERT [dbo].[CustomerConsumingMoney] ([ConsumeId], [CustomerId], [Month], [ConsumeDate], [ConsumeMoney], [TotalConsumeMoney], [CashBackMoney]) VALUES (11, 4, 1, CAST(N'2019-04-01T00:00:00.000' AS DateTime), 30000, NULL, NULL)
INSERT [dbo].[CustomerConsumingMoney] ([ConsumeId], [CustomerId], [Month], [ConsumeDate], [ConsumeMoney], [TotalConsumeMoney], [CashBackMoney]) VALUES (12, 4, 1, CAST(N'2019-04-01T00:00:00.000' AS DateTime), 70000, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CustomerConsumingMoney] OFF
SET IDENTITY_INSERT [dbo].[CustomerMonthlyPaid] ON 

INSERT [dbo].[CustomerMonthlyPaid] ([MonthlyPaidId], [CustomerId], [CardNo], [Month], [ApplyingMoney], [ConsumeMoney], [PaidMoney], [ServiceCharge], [Fine], [CashBack], [TotalBill], [PaidStatus]) VALUES (3, 2, 123123, 1, 100000, 0, 0, 0, 0, NULL, NULL, N'Running')
INSERT [dbo].[CustomerMonthlyPaid] ([MonthlyPaidId], [CustomerId], [CardNo], [Month], [ApplyingMoney], [ConsumeMoney], [PaidMoney], [ServiceCharge], [Fine], [CashBack], [TotalBill], [PaidStatus]) VALUES (4, 2, 123123, 2, 100000, 60000, 20000, 15, 0, 0, 60000, N'Running')
INSERT [dbo].[CustomerMonthlyPaid] ([MonthlyPaidId], [CustomerId], [CardNo], [Month], [ApplyingMoney], [ConsumeMoney], [PaidMoney], [ServiceCharge], [Fine], [CashBack], [TotalBill], [PaidStatus]) VALUES (5, 4, 1234567, 1, 100000, 100000, 0, 15, 0, 0, 100000, N'Running')
SET IDENTITY_INSERT [dbo].[CustomerMonthlyPaid] OFF
SET IDENTITY_INSERT [dbo].[CustomerPaidMoney] ON 

INSERT [dbo].[CustomerPaidMoney] ([PaidId], [CustomerId], [Month], [PaidDate], [PaidMoney]) VALUES (1, 2, 2, CAST(N'2019-04-09T00:00:00.000' AS DateTime), 20000)
SET IDENTITY_INSERT [dbo].[CustomerPaidMoney] OFF
SET IDENTITY_INSERT [dbo].[MonthTbl] ON 

INSERT [dbo].[MonthTbl] ([MonthId], [Name], [ShortOrder]) VALUES (1, N'January', 1)
INSERT [dbo].[MonthTbl] ([MonthId], [Name], [ShortOrder]) VALUES (2, N'February', 2)
INSERT [dbo].[MonthTbl] ([MonthId], [Name], [ShortOrder]) VALUES (3, N'March', 3)
INSERT [dbo].[MonthTbl] ([MonthId], [Name], [ShortOrder]) VALUES (4, N'April', 4)
INSERT [dbo].[MonthTbl] ([MonthId], [Name], [ShortOrder]) VALUES (5, N'May', 5)
INSERT [dbo].[MonthTbl] ([MonthId], [Name], [ShortOrder]) VALUES (6, N'June', 6)
INSERT [dbo].[MonthTbl] ([MonthId], [Name], [ShortOrder]) VALUES (7, N'July', 7)
INSERT [dbo].[MonthTbl] ([MonthId], [Name], [ShortOrder]) VALUES (8, N'August', 8)
INSERT [dbo].[MonthTbl] ([MonthId], [Name], [ShortOrder]) VALUES (9, N'September', 9)
INSERT [dbo].[MonthTbl] ([MonthId], [Name], [ShortOrder]) VALUES (10, N'October', 10)
INSERT [dbo].[MonthTbl] ([MonthId], [Name], [ShortOrder]) VALUES (11, N'November', 11)
INSERT [dbo].[MonthTbl] ([MonthId], [Name], [ShortOrder]) VALUES (12, N'December', 12)
SET IDENTITY_INSERT [dbo].[MonthTbl] OFF
SET IDENTITY_INSERT [dbo].[Reward] ON 

INSERT [dbo].[Reward] ([RewardsId], [CustomerId], [RewardDate], [RewardsPoint], [TotalAmount]) VALUES (4, 2, CAST(N'2019-04-03T00:00:00.000' AS DateTime), 60, 60000)
INSERT [dbo].[Reward] ([RewardsId], [CustomerId], [RewardDate], [RewardsPoint], [TotalAmount]) VALUES (6, 4, CAST(N'2019-04-04T00:00:00.000' AS DateTime), 100, 100000)
SET IDENTITY_INSERT [dbo].[Reward] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [Uq_CardNo]    Script Date: 4/5/2019 1:40:34 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Uq_CardNo] ON [dbo].[CardStatus]
(
	[CardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Uq_Email]    Script Date: 4/5/2019 1:40:34 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Uq_Email] ON [dbo].[Customer]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CardStatus]  WITH CHECK ADD  CONSTRAINT [FK_CardStatus_CardType] FOREIGN KEY([CardType])
REFERENCES [dbo].[CardType] ([CardId])
GO
ALTER TABLE [dbo].[CardStatus] CHECK CONSTRAINT [FK_CardStatus_CardType]
GO
ALTER TABLE [dbo].[CardStatus]  WITH CHECK ADD  CONSTRAINT [FK_CardStatus_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[CardStatus] CHECK CONSTRAINT [FK_CardStatus_Customer]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_CardType] FOREIGN KEY([CardType])
REFERENCES [dbo].[CardType] ([CardId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_CardType]
GO
ALTER TABLE [dbo].[CustomerAssignMoney]  WITH CHECK ADD  CONSTRAINT [FK_Month] FOREIGN KEY([ApplyingMonth])
REFERENCES [dbo].[MonthTbl] ([MonthId])
GO
ALTER TABLE [dbo].[CustomerAssignMoney] CHECK CONSTRAINT [FK_Month]
GO
ALTER TABLE [dbo].[CustomerConsumingMoney]  WITH CHECK ADD  CONSTRAINT [FK_Month2] FOREIGN KEY([Month])
REFERENCES [dbo].[MonthTbl] ([MonthId])
GO
ALTER TABLE [dbo].[CustomerConsumingMoney] CHECK CONSTRAINT [FK_Month2]
GO
ALTER TABLE [dbo].[CustomerMonthlyPaid]  WITH CHECK ADD  CONSTRAINT [FK_CMonth3] FOREIGN KEY([Month])
REFERENCES [dbo].[MonthTbl] ([MonthId])
GO
ALTER TABLE [dbo].[CustomerMonthlyPaid] CHECK CONSTRAINT [FK_CMonth3]
GO
ALTER TABLE [dbo].[CustomerPaidMoney]  WITH CHECK ADD  CONSTRAINT [FK_Month4] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[MonthTbl] ([MonthId])
GO
ALTER TABLE [dbo].[CustomerPaidMoney] CHECK CONSTRAINT [FK_Month4]
GO
ALTER TABLE [dbo].[Reward]  WITH CHECK ADD  CONSTRAINT [FK_Reward_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Reward] CHECK CONSTRAINT [FK_Reward_Customer]
GO
USE [master]
GO
ALTER DATABASE [CreditCardMS] SET  READ_WRITE 
GO
