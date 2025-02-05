USE [master]
GO
/****** Object:  Database [E_commerceDB]    Script Date: 3/29/2024 10:28:52 AM ******/
CREATE DATABASE [E_commerceDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'E_commerceDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\E_commerceDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'E_commerceDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\E_commerceDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [E_commerceDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [E_commerceDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [E_commerceDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [E_commerceDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [E_commerceDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [E_commerceDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [E_commerceDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [E_commerceDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [E_commerceDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [E_commerceDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [E_commerceDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [E_commerceDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [E_commerceDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [E_commerceDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [E_commerceDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [E_commerceDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [E_commerceDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [E_commerceDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [E_commerceDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [E_commerceDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [E_commerceDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [E_commerceDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [E_commerceDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [E_commerceDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [E_commerceDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [E_commerceDB] SET  MULTI_USER 
GO
ALTER DATABASE [E_commerceDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [E_commerceDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [E_commerceDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [E_commerceDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [E_commerceDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [E_commerceDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [E_commerceDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [E_commerceDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [E_commerceDB]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 3/29/2024 10:28:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[CartItemID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NULL,
	[ProductID] [uniqueidentifier] NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CartItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/29/2024 10:28:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](255) NULL,
	[Description] [text] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderedItems]    Script Date: 3/29/2024 10:28:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderedItems](
	[OrderItemID] [uniqueidentifier] NOT NULL,
	[OrderID] [uniqueidentifier] NULL,
	[ProductID] [uniqueidentifier] NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/29/2024 10:28:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NULL,
	[OrderDate] [datetime] NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[Status] [varchar](16) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[PaymentID] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 3/29/2024 10:28:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[paymentID] [uniqueidentifier] NOT NULL,
	[paymentMethod] [varchar](256) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[transactionID] [varchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[paymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/29/2024 10:28:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](256) NOT NULL,
	[Description] [text] NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[QuantityAvailable] [int] NOT NULL,
	[CategoryID] [uniqueidentifier] NULL,
	[IsAvailable] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 3/29/2024 10:28:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [uniqueidentifier] NOT NULL,
	[RoleName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/29/2024 10:28:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [uniqueidentifier] NOT NULL,
	[UserName] [varchar](256) NOT NULL,
	[Password] [varchar](128) NOT NULL,
	[Email] [varchar](128) NOT NULL,
	[Address] [varchar](256) NULL,
	[PhoneNumber] [varchar](16) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[createdBy] [uniqueidentifier] NULL,
	[RoleID] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[OrderedItems]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderedItems]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([PaymentID])
REFERENCES [dbo].[Payments] ([paymentID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
USE [master]
GO
ALTER DATABASE [E_commerceDB] SET  READ_WRITE 
GO
