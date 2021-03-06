USE [master]
GO
/****** Object:  Database [CourtRentalSystem]    Script Date: 6.01.2021 03:57:55 ******/
CREATE DATABASE [CourtRentalSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CourtRentalSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CourtRentalSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CourtRentalSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CourtRentalSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CourtRentalSystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CourtRentalSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CourtRentalSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CourtRentalSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CourtRentalSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CourtRentalSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CourtRentalSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [CourtRentalSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CourtRentalSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CourtRentalSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CourtRentalSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CourtRentalSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CourtRentalSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CourtRentalSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CourtRentalSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CourtRentalSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CourtRentalSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CourtRentalSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CourtRentalSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CourtRentalSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CourtRentalSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CourtRentalSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CourtRentalSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CourtRentalSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CourtRentalSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [CourtRentalSystem] SET  MULTI_USER 
GO
ALTER DATABASE [CourtRentalSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CourtRentalSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CourtRentalSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CourtRentalSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CourtRentalSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CourtRentalSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CourtRentalSystem', N'ON'
GO
ALTER DATABASE [CourtRentalSystem] SET QUERY_STORE = OFF
GO
USE [CourtRentalSystem]
GO
/****** Object:  User [Kaya]    Script Date: 6.01.2021 03:57:55 ******/
CREATE USER [Kaya] FOR LOGIN [LoginFurkan] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [Scchema]    Script Date: 6.01.2021 03:57:55 ******/
CREATE SCHEMA [Scchema]
GO
/****** Object:  UserDefinedFunction [dbo].[getAvgSalary]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getAvgSalary]()
RETURNS INT
AS
BEGIN
DECLARE @avgSalary INT
SET @avgSalary = (SELECT AVG (Employee_Salary) FROM Employee)
RETURN @avgSalary
END
GO
/****** Object:  UserDefinedFunction [dbo].[getName]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getName](@TrainerNum INT)
RETURNS VARCHAR(30)
AS
BEGIN
  DECLARE @TrainerName VARCHAR(30)
  SET @TrainerName = (SELECT Trainer_Name FROM dbo.Trainer where Trainer_ID = @TrainerNum)
  RETURN @TrainerName
  END 
GO
/****** Object:  UserDefinedFunction [dbo].[getOwner]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getOwner](@CourtNum INT)
  RETURNS VARCHAR(40)
  AS
  BEGIN
  DECLARE @Owner_Name VARCHAR(40)
  SET @Owner_Name = (SELECT Owner_Company_Name FROM dbo.Court where Court_ID = @CourtNum)
  RETURN @Owner_Name
  END
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_Name] [nchar](20) NOT NULL,
	[Customer_Surname] [nchar](20) NOT NULL,
	[Customer_Phone_Num] [nchar](20) NOT NULL,
	[Customer_Email] [nchar](50) NOT NULL,
	[Customer_Password] [nchar](15) NOT NULL,
	[Customer_Birth_Date] [nchar](15) NOT NULL,
	[Customer_Address] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Customer_List]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Customer_List]
AS
SELECT        dbo.Customer.*
FROM            dbo.Customer
GO
/****** Object:  Table [dbo].[Owner_Company]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owner_Company](
	[Owner_Company_Name] [nchar](30) NOT NULL,
	[Owner_Company_Address] [nchar](30) NOT NULL,
	[Owner_Company_Email] [nchar](20) NOT NULL,
	[Owner_Company_Phone_Num] [nchar](20) NOT NULL,
	[Owner_Company_ID] [int] NOT NULL,
 CONSTRAINT [PK_Owner_Company] PRIMARY KEY CLUSTERED 
(
	[Owner_Company_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Company_Phone_Numbers]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Company_Phone_Numbers]
AS
SELECT        Owner_Company_Name, Owner_Company_Phone_Num
FROM            dbo.Owner_Company
GO
/****** Object:  Table [dbo].[Trainer]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainer](
	[Trainer_ID] [int] IDENTITY(1,1) NOT NULL,
	[Trainer_Name] [nchar](20) NULL,
	[Trainer_Surname] [nchar](20) NOT NULL,
	[Trainer_Degree] [nchar](20) NOT NULL,
	[Trainer_Age] [int] NOT NULL,
	[Owner_Company_Name] [nchar](30) NOT NULL,
 CONSTRAINT [PK_Trainer] PRIMARY KEY CLUSTERED 
(
	[Trainer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Trainer_Master_Degree]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Trainer_Master_Degree]
AS
SELECT        Trainer_ID, Trainer_Name, Trainer_Surname, Trainer_Degree
FROM            dbo.Trainer
WHERE        (Trainer_Degree = N'Master')
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Employee_ID] [int] IDENTITY(1,1) NOT NULL,
	[Employee_Name] [nchar](20) NOT NULL,
	[Employee_Surname] [nchar](20) NOT NULL,
	[Employee_Job] [nchar](20) NOT NULL,
	[Employee_Phone_Num] [nchar](20) NOT NULL,
	[Employee_Salary] [int] NOT NULL,
	[Owner_Company_Name] [nchar](30) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Employee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Employee_Works_TennisA]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Employee_Works_TennisA]
AS
SELECT        Employee_ID, Employee_Name, Owner_Company_Name, Employee_Surname, Employee_Job
FROM            dbo.Employee
WHERE        (Owner_Company_Name = N'TennisA')
GO
/****** Object:  Table [dbo].[Court]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Court](
	[Court_ID] [int] IDENTITY(1,1) NOT NULL,
	[Court_Type] [nchar](30) NOT NULL,
	[Court_Services] [nchar](30) NOT NULL,
	[Court_Price] [int] NOT NULL,
	[Court_Address] [nchar](30) NOT NULL,
	[Court_City] [nchar](30) NOT NULL,
	[Owner_Company_Name] [nchar](30) NOT NULL,
 CONSTRAINT [PK_Court] PRIMARY KEY CLUSTERED 
(
	[Court_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Courts_in_Bebek_with_Grass]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Courts_in_Bebek_with_Grass]
AS
SELECT        Court_ID, Court_Type, Court_Services, Court_Price, Court_Address, Owner_Company_Name
FROM            dbo.Court
WHERE        (Court_Address = N'Bebek') AND (Court_Type = N'Grass')
GO
/****** Object:  Table [dbo].[Review]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[Review_ID] [int] IDENTITY(1,1) NOT NULL,
	[Review_Score] [int] NOT NULL,
	[Review_Comment] [nchar](10) NOT NULL,
	[Review_Creation_Date] [datetime] NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[Court_ID] [int] NOT NULL,
	[Owner_Company_Name] [nchar](30) NOT NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[Review_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Review_More_Than_7_Score]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Review_More_Than_7_Score]
AS
SELECT        Review_Score, Review_Comment, Review_Creation_Date, Court_ID, Owner_Company_Name
FROM            dbo.Review
WHERE        (Review_Score > 7)
GO
/****** Object:  Table [dbo].[Subscription]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscription](
	[Subscription_Type] [nchar](20) NOT NULL,
	[Subscription_Price] [int] NOT NULL,
	[Customer_ID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Subscription_Gold]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Subscription_Gold]
AS
SELECT        Subscription_Type, Subscription_Price, Customer_ID
FROM            dbo.Subscription
WHERE        (Subscription_Type = N'Gold')
GO
/****** Object:  View [dbo].[Trainers_Start_A_Letter]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Trainers_Start_A_Letter]
WITH  VIEW_METADATA
AS
SELECT        Trainer_Name, Trainer_Surname, Trainer_Degree, Trainer_Age, Owner_Company_Name
FROM            dbo.Trainer
WHERE        (Trainer_Name LIKE 'a%')
WITH CHECK OPTION
GO
/****** Object:  Table [dbo].[Lesson]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson](
	[Lesson_ID] [int] IDENTITY(1,1) NOT NULL,
	[Lesson_Duration] [int] NOT NULL,
	[Lesson_Date] [datetime] NOT NULL,
	[Lesson_Price] [int] NOT NULL,
	[Trainer_ID] [int] NOT NULL,
	[Customer_ID] [int] NOT NULL,
 CONSTRAINT [PK_Lesson] PRIMARY KEY CLUSTERED 
(
	[Lesson_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Lessons_for_Trainer1_In_2021]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Lessons_for_Trainer1_In_2021]
AS
SELECT        Lesson_ID, Lesson_Duration, Lesson_Date, Lesson_Price, Trainer_ID, Customer_ID
FROM            dbo.Lesson
WHERE        (Lesson_Duration < 100) AND (Trainer_ID = 1)
GO
/****** Object:  UserDefinedFunction [dbo].[listDegree]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[listDegree](@Trainer_Degree NCHAR(20))
  RETURNS TABLE
  AS
  RETURN
  SELECT
  Trainer_ID,
  Trainer_Name,
  Trainer_Degree
  FROM Trainer
  WHERE 
  Trainer_Degree = @Trainer_Degree
GO
/****** Object:  View [dbo].[Employee_Salary_More_2500]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Employee_Salary_More_2500]
AS
SELECT        Employee_ID, Employee_Name, Employee_Salary, Owner_Company_Name
FROM            dbo.Employee
WHERE        (Employee_Salary > 2500)
GO
/****** Object:  Table [dbo].[Admin_Info]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin_Info](
	[Admin_ID] [int] IDENTITY(1,1) NOT NULL,
	[Admin_Name] [nchar](20) NOT NULL,
	[Admin_Surname] [nchar](20) NOT NULL,
	[Admin_Nickname] [nchar](20) NOT NULL,
	[Admin_Password] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Admin_Info] PRIMARY KEY CLUSTERED 
(
	[Admin_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company_Amenities]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company_Amenities](
	[Internet_Info] [nchar](100) NOT NULL,
	[Parking_Lot_Info] [nchar](100) NOT NULL,
	[Cafe_Info] [nchar](100) NOT NULL,
	[Locker_Room_Info] [nchar](100) NOT NULL,
	[Record_Info] [nchar](100) NOT NULL,
	[Owner_Company_Name] [nchar](30) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CreditCard]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditCard](
	[Card_number] [int] IDENTITY(1,1) NOT NULL,
	[Card_exp_date] [date] NOT NULL,
	[Card_cvv] [int] NOT NULL,
	[Customer_ID] [int] NOT NULL,
 CONSTRAINT [PK_CreditCard] PRIMARY KEY CLUSTERED 
(
	[Card_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[Payment_ID] [int] IDENTITY(1,1) NOT NULL,
	[Payment_Currency] [nchar](30) NOT NULL,
	[Payment_Amount] [int] NOT NULL,
	[Payment_Type] [nchar](15) NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[Owner_Company_Name] [nchar](30) NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[Payment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[Reservation_ID] [int] IDENTITY(1,1) NOT NULL,
	[Reservation_Date] [datetime] NOT NULL,
	[Reservation_Duration] [int] NOT NULL,
	[Reservation_Player_Num] [int] NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[Court_ID] [int] NOT NULL,
 CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED 
(
	[Reservation_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Scchema].[Group_Lesson]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Scchema].[Group_Lesson](
	[Number_of_participants] [int] NULL,
	[Lesson_ID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Scchema].[Private_Lesson]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Scchema].[Private_Lesson](
	[Special_Lesson_request] [nchar](20) NOT NULL,
	[Lesson_ID] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin_Info] ON 

INSERT [dbo].[Admin_Info] ([Admin_ID], [Admin_Name], [Admin_Surname], [Admin_Nickname], [Admin_Password]) VALUES (1, N'Tommy               ', N'Vercetti            ', N'TV                  ', N'123                 ')
INSERT [dbo].[Admin_Info] ([Admin_ID], [Admin_Name], [Admin_Surname], [Admin_Nickname], [Admin_Password]) VALUES (2, N'Salieri             ', N'Mister              ', N'SM                  ', N'12                  ')
SET IDENTITY_INSERT [dbo].[Admin_Info] OFF
GO
INSERT [dbo].[Company_Amenities] ([Internet_Info], [Parking_Lot_Info], [Cafe_Info], [Locker_Room_Info], [Record_Info], [Owner_Company_Name]) VALUES (N'Yes                                                                                                 ', N'Closed Lot                                                                                          ', N'Only one cafe                                                                                       ', N'20 different lockers in room.                                                                       ', N'2 cameras recording the match                                                                       ', N'TennisA                       ')
INSERT [dbo].[Company_Amenities] ([Internet_Info], [Parking_Lot_Info], [Cafe_Info], [Locker_Room_Info], [Record_Info], [Owner_Company_Name]) VALUES (N'no                                                                                                  ', N'Open lot. Supports 40 cars.                                                                         ', N'2 cafes                                                                                             ', N'30 different locker and 2 cabinet.                                                                  ', N'3 cameras for record matches                                                                        ', N'TennisB                       ')
GO
SET IDENTITY_INSERT [dbo].[Court] ON 

INSERT [dbo].[Court] ([Court_ID], [Court_Type], [Court_Services], [Court_Price], [Court_Address], [Court_City], [Owner_Company_Name]) VALUES (2, N'Grass                         ', N'without ball boy              ', 500, N'Bebek                         ', N'Istanbul                      ', N'TennisA                       ')
INSERT [dbo].[Court] ([Court_ID], [Court_Type], [Court_Services], [Court_Price], [Court_Address], [Court_City], [Owner_Company_Name]) VALUES (6, N'Clay                          ', N'with ball boy                 ', 550, N'Ortaköy                       ', N'Istanbul                      ', N'TennisB                       ')
INSERT [dbo].[Court] ([Court_ID], [Court_Type], [Court_Services], [Court_Price], [Court_Address], [Court_City], [Owner_Company_Name]) VALUES (7, N'Hard                          ', N'without ball boy              ', 400, N'Keçiören                      ', N'Ankara                        ', N'TennisC                       ')
INSERT [dbo].[Court] ([Court_ID], [Court_Type], [Court_Services], [Court_Price], [Court_Address], [Court_City], [Owner_Company_Name]) VALUES (8, N'Grass                         ', N'without ball boy              ', 500, N'Keçiören                      ', N'Ankara                        ', N'TennisC                       ')
INSERT [dbo].[Court] ([Court_ID], [Court_Type], [Court_Services], [Court_Price], [Court_Address], [Court_City], [Owner_Company_Name]) VALUES (9, N'Artificial Grass              ', N'with ball boy                 ', 800, N'Beşiktaş                      ', N'Istanbul                      ', N'TennisA                       ')
INSERT [dbo].[Court] ([Court_ID], [Court_Type], [Court_Services], [Court_Price], [Court_Address], [Court_City], [Owner_Company_Name]) VALUES (12, N'Artificial Grass              ', N'with ball boy                 ', 750, N'Bebek                         ', N'Istanbul                      ', N'TennisB                       ')
INSERT [dbo].[Court] ([Court_ID], [Court_Type], [Court_Services], [Court_Price], [Court_Address], [Court_City], [Owner_Company_Name]) VALUES (13, N'Artificial Grass              ', N'ballboy and refree            ', 500, N'bjk                           ', N'istanbul                      ', N'TennisZ                       ')
SET IDENTITY_INSERT [dbo].[Court] OFF
GO
SET IDENTITY_INSERT [dbo].[CreditCard] ON 

INSERT [dbo].[CreditCard] ([Card_number], [Card_exp_date], [Card_cvv], [Customer_ID]) VALUES (3, CAST(N'2020-12-12' AS Date), 312, 3)
INSERT [dbo].[CreditCard] ([Card_number], [Card_exp_date], [Card_cvv], [Customer_ID]) VALUES (4, CAST(N'2023-01-01' AS Date), 523, 6)
INSERT [dbo].[CreditCard] ([Card_number], [Card_exp_date], [Card_cvv], [Customer_ID]) VALUES (5, CAST(N'2023-02-02' AS Date), 423, 8)
INSERT [dbo].[CreditCard] ([Card_number], [Card_exp_date], [Card_cvv], [Customer_ID]) VALUES (7, CAST(N'2024-05-05' AS Date), 586, 10)
INSERT [dbo].[CreditCard] ([Card_number], [Card_exp_date], [Card_cvv], [Customer_ID]) VALUES (8, CAST(N'2022-07-07' AS Date), 978, 12)
SET IDENTITY_INSERT [dbo].[CreditCard] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Surname], [Customer_Phone_Num], [Customer_Email], [Customer_Password], [Customer_Birth_Date], [Customer_Address]) VALUES (3, N'Furkan              ', N'Mete                ', N'05555555555         ', N'metefurkan@gmail.com                              ', N'1234           ', N'07.05.2000     ', N'Beşiktaş  ')
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Surname], [Customer_Phone_Num], [Customer_Email], [Customer_Password], [Customer_Birth_Date], [Customer_Address]) VALUES (6, N'Kayacan             ', N'Yıldız              ', N'05444444444         ', N'kayacanyldz@gmail.com                             ', N'123            ', N'01.01.1997     ', N'Bebek     ')
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Surname], [Customer_Phone_Num], [Customer_Email], [Customer_Password], [Customer_Birth_Date], [Customer_Address]) VALUES (8, N'Connor              ', N'Kone                ', N'05121212121         ', N'akhan@gmail.com                                   ', N'321            ', N'13.01.1990     ', N'Nişantaşı ')
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Surname], [Customer_Phone_Num], [Customer_Email], [Customer_Password], [Customer_Birth_Date], [Customer_Address]) VALUES (10, N'Markus              ', N'Fose                ', N'01233124124         ', N'mrks@gmail.com                                    ', N'4321           ', N'2.2.1970       ', N'Fatih     ')
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Surname], [Customer_Phone_Num], [Customer_Email], [Customer_Password], [Customer_Birth_Date], [Customer_Address]) VALUES (12, N'Kara                ', N'Kursh               ', N'06712356213         ', N'karakrdh@gmail.com                                ', N'1111           ', N'02.03.1975     ', N'Beylikdüzü')
INSERT [dbo].[Customer] ([Customer_ID], [Customer_Name], [Customer_Surname], [Customer_Phone_Num], [Customer_Email], [Customer_Password], [Customer_Birth_Date], [Customer_Address]) VALUES (29, N'bahbah              ', N'bahbah              ', N'bahbah              ', N'bahbah                                            ', N'bahbah         ', N'bahbah         ', N'bahbah    ')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Employee_ID], [Employee_Name], [Employee_Surname], [Employee_Job], [Employee_Phone_Num], [Employee_Salary], [Owner_Company_Name]) VALUES (6, N'Dutch               ', N'Linde               ', N'Organizator         ', N'05122222222         ', 6000, N'TennisA                       ')
INSERT [dbo].[Employee] ([Employee_ID], [Employee_Name], [Employee_Surname], [Employee_Job], [Employee_Phone_Num], [Employee_Salary], [Owner_Company_Name]) VALUES (15, N'Arthur              ', N'Morgan              ', N'Co-organizator      ', N'05133333333         ', 5000, N'TennisA                       ')
INSERT [dbo].[Employee] ([Employee_ID], [Employee_Name], [Employee_Surname], [Employee_Job], [Employee_Phone_Num], [Employee_Salary], [Owner_Company_Name]) VALUES (16, N'John                ', N'Marston             ', N'Janitor             ', N'05144444444         ', 2500, N'TennisA                       ')
INSERT [dbo].[Employee] ([Employee_ID], [Employee_Name], [Employee_Surname], [Employee_Job], [Employee_Phone_Num], [Employee_Salary], [Owner_Company_Name]) VALUES (18, N'Colm                ', N'Driscoll            ', N'Organizator         ', N'05155555555         ', 5900, N'TennisB                       ')
INSERT [dbo].[Employee] ([Employee_ID], [Employee_Name], [Employee_Surname], [Employee_Job], [Employee_Phone_Num], [Employee_Salary], [Owner_Company_Name]) VALUES (19, N'Kieran              ', N'Driscoll            ', N'Human_Resources     ', N'05166666666         ', 4000, N'TennisB                       ')
INSERT [dbo].[Employee] ([Employee_ID], [Employee_Name], [Employee_Surname], [Employee_Job], [Employee_Phone_Num], [Employee_Salary], [Owner_Company_Name]) VALUES (21, N'Milton              ', N'Agent               ', N'Manager             ', N'05177777777         ', 10000, N'TennisC                       ')
INSERT [dbo].[Employee] ([Employee_ID], [Employee_Name], [Employee_Surname], [Employee_Job], [Employee_Phone_Num], [Employee_Salary], [Owner_Company_Name]) VALUES (22, N'Micah               ', N'Bell                ', N'Janitor             ', N'05188888888         ', 2000, N'TennisC                       ')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Lesson] ON 

INSERT [dbo].[Lesson] ([Lesson_ID], [Lesson_Duration], [Lesson_Date], [Lesson_Price], [Trainer_ID], [Customer_ID]) VALUES (1, 60, CAST(N'2020-12-12T12:00:00.000' AS DateTime), 50, 1, 3)
INSERT [dbo].[Lesson] ([Lesson_ID], [Lesson_Duration], [Lesson_Date], [Lesson_Price], [Trainer_ID], [Customer_ID]) VALUES (2, 30, CAST(N'2020-01-01T15:00:00.000' AS DateTime), 30, 2, 6)
INSERT [dbo].[Lesson] ([Lesson_ID], [Lesson_Duration], [Lesson_Date], [Lesson_Price], [Trainer_ID], [Customer_ID]) VALUES (3, 90, CAST(N'2021-02-01T18:00:00.000' AS DateTime), 60, 3, 8)
INSERT [dbo].[Lesson] ([Lesson_ID], [Lesson_Duration], [Lesson_Date], [Lesson_Price], [Trainer_ID], [Customer_ID]) VALUES (4, 120, CAST(N'2021-03-01T11:00:00.000' AS DateTime), 70, 1, 10)
INSERT [dbo].[Lesson] ([Lesson_ID], [Lesson_Duration], [Lesson_Date], [Lesson_Price], [Trainer_ID], [Customer_ID]) VALUES (5, 30, CAST(N'2021-05-01T14:00:00.000' AS DateTime), 30, 1, 12)
SET IDENTITY_INSERT [dbo].[Lesson] OFF
GO
INSERT [dbo].[Owner_Company] ([Owner_Company_Name], [Owner_Company_Address], [Owner_Company_Email], [Owner_Company_Phone_Num], [Owner_Company_ID]) VALUES (N'sdfsfddfs                     ', N'USA NYC                       ', N'fsdfdfsdfds         ', N'fdsfsdfsd           ', 1)
INSERT [dbo].[Owner_Company] ([Owner_Company_Name], [Owner_Company_Address], [Owner_Company_Email], [Owner_Company_Phone_Num], [Owner_Company_ID]) VALUES (N'TennisA                       ', N'Bebek                         ', N'TenniScene@gmail.com', N'05666666666         ', 2)
INSERT [dbo].[Owner_Company] ([Owner_Company_Name], [Owner_Company_Address], [Owner_Company_Email], [Owner_Company_Phone_Num], [Owner_Company_ID]) VALUES (N'TennisB                       ', N'Beşiktaş                      ', N'RacketDash@gmail.com', N'05777777777         ', 3)
INSERT [dbo].[Owner_Company] ([Owner_Company_Name], [Owner_Company_Address], [Owner_Company_Email], [Owner_Company_Phone_Num], [Owner_Company_ID]) VALUES (N'TennisC                       ', N'Beylikdüzü                    ', N'Silveraket@gmail.com', N'05888888888         ', 4)
INSERT [dbo].[Owner_Company] ([Owner_Company_Name], [Owner_Company_Address], [Owner_Company_Email], [Owner_Company_Phone_Num], [Owner_Company_ID]) VALUES (N'TennisD                       ', N'Nişantaşı                     ', N'strtns@gmail.com    ', N'05999999999         ', 5)
INSERT [dbo].[Owner_Company] ([Owner_Company_Name], [Owner_Company_Address], [Owner_Company_Email], [Owner_Company_Phone_Num], [Owner_Company_ID]) VALUES (N'TennisZ                       ', N'USA NJ                        ', N'tenz@gmail.com      ', N'08967127741         ', 6)
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([Payment_ID], [Payment_Currency], [Payment_Amount], [Payment_Type], [Customer_ID], [Owner_Company_Name]) VALUES (1, N'USD                           ', 250, N'Cash           ', 3, N'TennisA                       ')
INSERT [dbo].[Payment] ([Payment_ID], [Payment_Currency], [Payment_Amount], [Payment_Type], [Customer_ID], [Owner_Company_Name]) VALUES (2, N'EUR                           ', 200, N'Cash           ', 6, N'TennisB                       ')
INSERT [dbo].[Payment] ([Payment_ID], [Payment_Currency], [Payment_Amount], [Payment_Type], [Customer_ID], [Owner_Company_Name]) VALUES (3, N'EUR                           ', 250, N'CreditCard     ', 8, N'TennisC                       ')
INSERT [dbo].[Payment] ([Payment_ID], [Payment_Currency], [Payment_Amount], [Payment_Type], [Customer_ID], [Owner_Company_Name]) VALUES (4, N'USD                           ', 300, N'CreditCard     ', 10, N'TennisA                       ')
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([Review_ID], [Review_Score], [Review_Comment], [Review_Creation_Date], [Customer_ID], [Court_ID], [Owner_Company_Name]) VALUES (1, 10, N'Perfect   ', CAST(N'2020-11-11T12:40:30.000' AS DateTime), 3, 12, N'TennisB                       ')
INSERT [dbo].[Review] ([Review_ID], [Review_Score], [Review_Comment], [Review_Creation_Date], [Customer_ID], [Court_ID], [Owner_Company_Name]) VALUES (5, 6, N'Fair      ', CAST(N'2020-11-12T13:10:10.000' AS DateTime), 6, 7, N'TennisC                       ')
INSERT [dbo].[Review] ([Review_ID], [Review_Score], [Review_Comment], [Review_Creation_Date], [Customer_ID], [Court_ID], [Owner_Company_Name]) VALUES (8, 3, N'bad       ', CAST(N'2019-03-20T15:15:15.000' AS DateTime), 8, 7, N'TennisC                       ')
INSERT [dbo].[Review] ([Review_ID], [Review_Score], [Review_Comment], [Review_Creation_Date], [Customer_ID], [Court_ID], [Owner_Company_Name]) VALUES (9, 9, N'Amazing   ', CAST(N'2018-05-29T00:00:00.000' AS DateTime), 10, 9, N'TennisB                       ')
INSERT [dbo].[Review] ([Review_ID], [Review_Score], [Review_Comment], [Review_Creation_Date], [Customer_ID], [Court_ID], [Owner_Company_Name]) VALUES (11, 8, N'good      ', CAST(N'2019-04-04T00:00:00.000' AS DateTime), 12, 6, N'TennisA                       ')
SET IDENTITY_INSERT [dbo].[Review] OFF
GO
INSERT [dbo].[Subscription] ([Subscription_Type], [Subscription_Price], [Customer_ID]) VALUES (N'Gold                ', 400, 3)
INSERT [dbo].[Subscription] ([Subscription_Type], [Subscription_Price], [Customer_ID]) VALUES (N'Diamond             ', 600, 6)
INSERT [dbo].[Subscription] ([Subscription_Type], [Subscription_Price], [Customer_ID]) VALUES (N'Diamond             ', 600, 8)
INSERT [dbo].[Subscription] ([Subscription_Type], [Subscription_Price], [Customer_ID]) VALUES (N'Gold                ', 400, 10)
INSERT [dbo].[Subscription] ([Subscription_Type], [Subscription_Price], [Customer_ID]) VALUES (N'Bronze              ', 200, 12)
GO
SET IDENTITY_INSERT [dbo].[Trainer] ON 

INSERT [dbo].[Trainer] ([Trainer_ID], [Trainer_Name], [Trainer_Surname], [Trainer_Degree], [Trainer_Age], [Owner_Company_Name]) VALUES (1, N'Kratos              ', N'Greek               ', N'Master              ', 35, N'TennisA                       ')
INSERT [dbo].[Trainer] ([Trainer_ID], [Trainer_Name], [Trainer_Surname], [Trainer_Degree], [Trainer_Age], [Owner_Company_Name]) VALUES (2, N'Atreus              ', N'Greek               ', N'Assistant           ', 20, N'TennisA                       ')
INSERT [dbo].[Trainer] ([Trainer_ID], [Trainer_Name], [Trainer_Surname], [Trainer_Degree], [Trainer_Age], [Owner_Company_Name]) VALUES (3, N'Zeus                ', N'Greek               ', N'Master              ', 40, N'TennisB                       ')
INSERT [dbo].[Trainer] ([Trainer_ID], [Trainer_Name], [Trainer_Surname], [Trainer_Degree], [Trainer_Age], [Owner_Company_Name]) VALUES (5, N'Ares                ', N'Canope              ', N'Senior              ', 36, N'TennisB                       ')
INSERT [dbo].[Trainer] ([Trainer_ID], [Trainer_Name], [Trainer_Surname], [Trainer_Degree], [Trainer_Age], [Owner_Company_Name]) VALUES (7, N'Odin                ', N'Mole                ', N'Master              ', 40, N'TennisC                       ')
INSERT [dbo].[Trainer] ([Trainer_ID], [Trainer_Name], [Trainer_Surname], [Trainer_Degree], [Trainer_Age], [Owner_Company_Name]) VALUES (22, N'Ekrem               ', N'Mete                ', N'Master              ', 13, N'TennisA                       ')
INSERT [dbo].[Trainer] ([Trainer_ID], [Trainer_Name], [Trainer_Surname], [Trainer_Degree], [Trainer_Age], [Owner_Company_Name]) VALUES (24, N'Furkan              ', N'Mete                ', N'Assistant           ', 25, N'TennisB                       ')
SET IDENTITY_INSERT [dbo].[Trainer] OFF
GO
INSERT [Scchema].[Group_Lesson] ([Number_of_participants], [Lesson_ID]) VALUES (4, 1)
INSERT [Scchema].[Group_Lesson] ([Number_of_participants], [Lesson_ID]) VALUES (2, 2)
INSERT [Scchema].[Group_Lesson] ([Number_of_participants], [Lesson_ID]) VALUES (3, 3)
GO
ALTER TABLE [dbo].[Company_Amenities]  WITH CHECK ADD  CONSTRAINT [FK_Court_Amenities_Owner_Company] FOREIGN KEY([Owner_Company_Name])
REFERENCES [dbo].[Owner_Company] ([Owner_Company_Name])
GO
ALTER TABLE [dbo].[Company_Amenities] CHECK CONSTRAINT [FK_Court_Amenities_Owner_Company]
GO
ALTER TABLE [dbo].[Court]  WITH CHECK ADD  CONSTRAINT [FK_Court_Owner_Company] FOREIGN KEY([Owner_Company_Name])
REFERENCES [dbo].[Owner_Company] ([Owner_Company_Name])
GO
ALTER TABLE [dbo].[Court] CHECK CONSTRAINT [FK_Court_Owner_Company]
GO
ALTER TABLE [dbo].[CreditCard]  WITH CHECK ADD  CONSTRAINT [FK_CreditCard_Customer] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[CreditCard] CHECK CONSTRAINT [FK_CreditCard_Customer]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Owner_Company] FOREIGN KEY([Owner_Company_Name])
REFERENCES [dbo].[Owner_Company] ([Owner_Company_Name])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Owner_Company]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_Customer] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_Customer]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_Trainer] FOREIGN KEY([Trainer_ID])
REFERENCES [dbo].[Trainer] ([Trainer_ID])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_Trainer]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Customer] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Customer]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Owner_Company] FOREIGN KEY([Owner_Company_Name])
REFERENCES [dbo].[Owner_Company] ([Owner_Company_Name])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Owner_Company]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Court] FOREIGN KEY([Court_ID])
REFERENCES [dbo].[Court] ([Court_ID])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Court]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Customer] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Customer]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Court] FOREIGN KEY([Court_ID])
REFERENCES [dbo].[Court] ([Court_ID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Court]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Customer] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Customer]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Owner_Company] FOREIGN KEY([Owner_Company_Name])
REFERENCES [dbo].[Owner_Company] ([Owner_Company_Name])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Owner_Company]
GO
ALTER TABLE [dbo].[Subscription]  WITH CHECK ADD  CONSTRAINT [FK_Subscription_Customer] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[Subscription] CHECK CONSTRAINT [FK_Subscription_Customer]
GO
ALTER TABLE [dbo].[Trainer]  WITH CHECK ADD  CONSTRAINT [FK_Trainer_Owner_Company] FOREIGN KEY([Owner_Company_Name])
REFERENCES [dbo].[Owner_Company] ([Owner_Company_Name])
GO
ALTER TABLE [dbo].[Trainer] CHECK CONSTRAINT [FK_Trainer_Owner_Company]
GO
ALTER TABLE [Scchema].[Group_Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Group_Lesson_Lesson] FOREIGN KEY([Lesson_ID])
REFERENCES [dbo].[Lesson] ([Lesson_ID])
GO
ALTER TABLE [Scchema].[Group_Lesson] CHECK CONSTRAINT [FK_Group_Lesson_Lesson]
GO
ALTER TABLE [Scchema].[Private_Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Private_Lesson_Lesson] FOREIGN KEY([Lesson_ID])
REFERENCES [dbo].[Lesson] ([Lesson_ID])
GO
ALTER TABLE [Scchema].[Private_Lesson] CHECK CONSTRAINT [FK_Private_Lesson_Lesson]
GO
/****** Object:  StoredProcedure [dbo].[Add_Customer]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_Customer]
@name nchar(20),
@sname nchar(20),
@phonenum nchar(20),
@custEmail nchar(50),
@pass nchar(15),
@birthdate nchar(15),
@address nchar(10)
AS
INSERT INTO Customer(Customer_Name,Customer_Surname,Customer_Phone_Num,Customer_Email,Customer_Password,Customer_Birth_Date,Customer_Address)
values(@name,@sname,@phonenum,@custEmail, @pass,@birthdate,@address)
GO
/****** Object:  StoredProcedure [dbo].[Add_Employee]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_Employee]
@name nchar(20),
@sname nchar(20),
@job nchar(20),
@phonenum nchar(20),
@salary int,
@compname nchar(30)
AS
INSERT INTO Employee(Employee_Name,Employee_Surname,Employee_Job,Employee_Phone_Num,Employee_Salary,Owner_Company_Name)
values(@name,@sname,@job,@phonenum,@salary, @compname)
GO
/****** Object:  StoredProcedure [dbo].[DEL_Customer]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DEL_Customer]
@id int
AS
DELETE FROM Customer WHERE Customer_ID=@id
GO
/****** Object:  StoredProcedure [dbo].[DEL_Employee]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DEL_Employee]
@id int
AS
DELETE FROM Employee WHERE Employee_ID=@id
GO
/****** Object:  StoredProcedure [dbo].[Empolyee_Salary_more_than]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Empolyee_Salary_more_than](@salary int)
AS
SELECT * FROM Employee
WHERE Employee_Salary>@salary
GO
/****** Object:  StoredProcedure [dbo].[Find_employee]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Find_employee] (@job nchar(20)='Organizator')
AS
SELECT * FROM Employee
WHERE Employee_Job=@job
GO
/****** Object:  StoredProcedure [dbo].[Find_employee_job_in_a_company]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[Find_employee_job_in_a_company] (@job nchar(20)='Organizator', @comp nchar(20)='TennisA')
AS
SELECT * FROM Employee
WHERE Employee_Job=@job and Owner_Company_Name=@comp
GO
/****** Object:  StoredProcedure [dbo].[find_payment_for_currency_and_price]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[find_payment_for_currency_and_price] (@amount int=200, @curr nchar(20)='USD')
AS
SELECT * FROM Payment
WHERE Payment_Amount>@amount and Payment_Currency=@curr
GO
/****** Object:  StoredProcedure [dbo].[Review_score_more_than_or_default_6]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[Review_score_more_than_or_default_6] (@point int=6)
AS
BEGIN
SET NOCOUNT ON
 
SELECT * FROM Review
WHERE Review_Score>@point
 
END
GO
/****** Object:  StoredProcedure [dbo].[Search_Trainer_Name]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Search_Trainer_Name]
@name nchar(20)
AS
SELECT * FROM Trainer  WHERE Trainer_Name LIKE '%'+@name+'%'
GO
/****** Object:  StoredProcedure [dbo].[SelectAllCustomers]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllCustomers]
AS
SELECT * FROM Customer
GO
/****** Object:  StoredProcedure [dbo].[Sub_types_default_diamond]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sub_types_default_diamond]
(@PID nchar(20)='Diamond')
AS
BEGIN
SET NOCOUNT ON
 
SELECT Subscription_Type,Subscription_Price,Customer_ID  FROM 
Subscription
WHERE Subscription_Type=@PID
 
END
GO
/****** Object:  StoredProcedure [dbo].[UPD_Customer]    Script Date: 6.01.2021 03:57:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPD_Customer]
@name nchar(20),
@sname nchar(20),
@phonenum nchar(20),
@custEmail nchar(50),
@pass nchar(15),
@birthdate nchar(15),
@address nchar(10),
@id int
AS
UPDATE Customer SET Customer_Name=@name, Customer_Surname=@sname, Customer_Phone_Num=@phonenum, Customer_Email=@custEmail, Customer_Password=@pass, Customer_Birth_Date=@birthdate, Customer_Address=@address
WHERE Customer_ID=@id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Owner_Company"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 290
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Company_Phone_Numbers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Company_Phone_Numbers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Court"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Courts_in_Bebek_with_Grass'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Courts_in_Bebek_with_Grass'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Customer"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 250
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Customer_List'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Customer_List'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Employee"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Employee_Salary_More_2500'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Employee_Salary_More_2500'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Employee"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Employee_Works_TennisA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Employee_Works_TennisA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Lesson"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Lessons_for_Trainer1_In_2021'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Lessons_for_Trainer1_In_2021'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Review"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Review_More_Than_7_Score'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Review_More_Than_7_Score'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Subscription"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Subscription_Gold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Subscription_Gold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Trainer"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Trainer_Master_Degree'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Trainer_Master_Degree'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Trainer"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Trainers_Start_A_Letter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Trainers_Start_A_Letter'
GO
USE [master]
GO
ALTER DATABASE [CourtRentalSystem] SET  READ_WRITE 
GO
