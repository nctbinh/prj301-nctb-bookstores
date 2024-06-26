USE [master]
GO
/****** Object:  Database [NCTB_BOOKSTORE]    Script Date: 22/04/2024 11:09:43 SA ******/
CREATE DATABASE [NCTB_BOOKSTORE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NCTB_BOOKSTORE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.NCTB\MSSQL\DATA\NCTB_BOOKSTORE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NCTB_BOOKSTORE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.NCTB\MSSQL\DATA\NCTB_BOOKSTORE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NCTB_BOOKSTORE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET ARITHABORT OFF 
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET  MULTI_USER 
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET QUERY_STORE = ON
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [NCTB_BOOKSTORE]
GO
/****** Object:  Table [dbo].[tblBook]    Script Date: 22/04/2024 11:09:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBook](
	[bookID] [nvarchar](255) NOT NULL,
	[name] [nvarchar](max) NULL,
	[author] [nvarchar](max) NULL,
	[publishDate] [date] NULL,
	[image] [varchar](max) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[bookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 22/04/2024 11:09:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [nvarchar](255) NULL,
	[useraddress] [nvarchar](max) NULL,
	[userphone] [nvarchar](20) NULL,
	[date] [date] NULL,
	[total] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 22/04/2024 11:09:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[orderID] [int] NOT NULL,
	[bookID] [nvarchar](255) NOT NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC,
	[bookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 22/04/2024 11:09:44 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[userID] [nvarchar](255) NOT NULL,
	[password] [varchar](255) NULL,
	[fullName] [nvarchar](max) NULL,
	[role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[tblBook] ([bookID], [name], [author], [publishDate], [image], [price], [quantity], [status]) VALUES (N'bookID001', N'Anna Karenina', N'Leo Tolstoy', CAST(N'2024-01-01' AS Date), N'https://m.media-amazon.com/images/I/4102dci2VZL._SY445_SX342_.jpg', 100000, 10, 1)
INSERT [dbo].[tblBook] ([bookID], [name], [author], [publishDate], [image], [price], [quantity], [status]) VALUES (N'bookID002', N'War and Peace', N'Leo Tolstoy', CAST(N'2024-02-01' AS Date), N'https://m.media-amazon.com/images/I/41VkXErPyDL._SY445_SX342_.jpg', 100000, 15, 1)
INSERT [dbo].[tblBook] ([bookID], [name], [author], [publishDate], [image], [price], [quantity], [status]) VALUES (N'bookID003', N'To Kill a Mockingbird', N'Harper Lee', CAST(N'2024-03-01' AS Date), N'https://m.media-amazon.com/images/I/71FxgtFKcQL._AC_UF1000,1000_QL80_.jpg', 100000, 23, 1)
INSERT [dbo].[tblBook] ([bookID], [name], [author], [publishDate], [image], [price], [quantity], [status]) VALUES (N'bookID004', N'The Great Gatsby', N'F. Scott Fitzgerald', CAST(N'2024-04-01' AS Date), N'https://m.media-amazon.com/images/I/41NssxNlPlS._SY445_SX342_.jpg', 100010, 8, 0)
INSERT [dbo].[tblBook] ([bookID], [name], [author], [publishDate], [image], [price], [quantity], [status]) VALUES (N'bookID006', N'Atomic Habits', N'James Clear', CAST(N'2018-10-16' AS Date), N'https://m.media-amazon.com/images/I/81YkqyaFVEL._AC_UF1000,1000_QL80_.jpg', 100000, 12, 1)
INSERT [dbo].[tblBook] ([bookID], [name], [author], [publishDate], [image], [price], [quantity], [status]) VALUES (N'bookID008', N'The Richest Man in Babylon', N'George Samuel Clason', CAST(N'2024-05-01' AS Date), N'https://m.media-amazon.com/images/I/41n8gEp9FnL._SY445_SX342_.jpg', 100000, 12, 1)
INSERT [dbo].[tblBook] ([bookID], [name], [author], [publishDate], [image], [price], [quantity], [status]) VALUES (N'bookID009', N'Think and Grow Rich', N'Napoleon Hill', CAST(N'2024-05-01' AS Date), N'https://m.media-amazon.com/images/I/61CIKpN5QjL._AC_UF1000,1000_QL80_.jpg', 100000, 12, 1)
INSERT [dbo].[tblBook] ([bookID], [name], [author], [publishDate], [image], [price], [quantity], [status]) VALUES (N'bookID123', N'NCTB', N'Thanh Binh', CAST(N'2023-12-12' AS Date), N'https://m.media-amazon.com/images/I/61z0MrB6qOS._SL1500_.jpg', 250, 12, 0)
GO
SET IDENTITY_INSERT [dbo].[tblOrder] ON 

INSERT [dbo].[tblOrder] ([orderID], [userID], [useraddress], [userphone], [date], [total]) VALUES (1, N'binh', N'22/31/16 ÄÆ°á»ng sá» 21 PhÆ°á»ng 8 Quáº­n GÃ² Váº¥p TP. Há» ChÃ­ Minh', N'+84388111669', CAST(N'2024-04-17' AS Date), 100000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [useraddress], [userphone], [date], [total]) VALUES (2, N'binh', N'22/31/16 ÄÆ°á»ng sá» 21 PhÆ°á»ng 8 Quáº­n GÃ² Váº¥p TP. Há» ChÃ­ Minh', N'+84388111669', CAST(N'2024-04-17' AS Date), 100000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [useraddress], [userphone], [date], [total]) VALUES (3, N'binh', N'22/31/16', N'+84388111669', CAST(N'2024-04-17' AS Date), 200000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [useraddress], [userphone], [date], [total]) VALUES (4, N'binh', N'22/31/16', N'+84388111669', CAST(N'2024-04-17' AS Date), 200000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [useraddress], [userphone], [date], [total]) VALUES (5, N'binh', N'22/31/16', N'+84388111669', CAST(N'2024-04-17' AS Date), 100000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [useraddress], [userphone], [date], [total]) VALUES (6, N'binh', N'22/31/16', N'+84388111669', CAST(N'2024-04-17' AS Date), 100000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [useraddress], [userphone], [date], [total]) VALUES (7, N'binh', N'22/31/16', N'+84388111669', CAST(N'2024-04-17' AS Date), 200000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [useraddress], [userphone], [date], [total]) VALUES (8, N'binh', N'22/31/16', N'+84388111669', CAST(N'2024-04-17' AS Date), 200000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [useraddress], [userphone], [date], [total]) VALUES (9, N'binh', N'22/31/16', N'+84388111669', CAST(N'2024-04-17' AS Date), 200000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [useraddress], [userphone], [date], [total]) VALUES (10, N'binh', N'123', N'+84388111669', CAST(N'2024-04-17' AS Date), 100000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [useraddress], [userphone], [date], [total]) VALUES (11, N'binh', N'123', N'+84388111669', CAST(N'2024-04-17' AS Date), 100000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [useraddress], [userphone], [date], [total]) VALUES (12, N'binh', N'123', N'+84388111669', CAST(N'2024-04-17' AS Date), 1200000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [useraddress], [userphone], [date], [total]) VALUES (13, N'binh', N'22/31/16 ÄÆ°á»ng sá» 21 PhÆ°á»ng 8 Quáº­n GÃ² Váº¥p TP. Há» ChÃ­ Minh', N'3881116690', CAST(N'2024-04-17' AS Date), 500000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [useraddress], [userphone], [date], [total]) VALUES (14, N'binh', N'123', N'+84388111669', CAST(N'2024-04-17' AS Date), 100000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [useraddress], [userphone], [date], [total]) VALUES (15, N'binh', N'22/31/16 Harshaw Eve Toronto', N'3881116690', CAST(N'2024-04-19' AS Date), 200000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [useraddress], [userphone], [date], [total]) VALUES (16, N'binh', N'22/31/16 Harshaw Eve Toronto', N'3881116690', CAST(N'2024-04-19' AS Date), 200000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [useraddress], [userphone], [date], [total]) VALUES (17, N'binh', N'123 21 Street Toronto', N'+84388111669', CAST(N'2024-04-19' AS Date), 500000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [useraddress], [userphone], [date], [total]) VALUES (18, N'binh', N'123', N'+84388111669', CAST(N'2024-04-19' AS Date), 100000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [useraddress], [userphone], [date], [total]) VALUES (19, N'binh2', N'22/31/16 Harshaw Eve Toronto', N'3881116690', CAST(N'2024-04-19' AS Date), 400000)
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
GO
INSERT [dbo].[tblOrderDetails] ([orderID], [bookID], [quantity]) VALUES (1, N'bookID003', 1)
INSERT [dbo].[tblOrderDetails] ([orderID], [bookID], [quantity]) VALUES (3, N'bookID003', 2)
INSERT [dbo].[tblOrderDetails] ([orderID], [bookID], [quantity]) VALUES (5, N'bookID002', 8)
INSERT [dbo].[tblOrderDetails] ([orderID], [bookID], [quantity]) VALUES (7, N'bookID002', 15)
INSERT [dbo].[tblOrderDetails] ([orderID], [bookID], [quantity]) VALUES (9, N'bookID002', 2)
INSERT [dbo].[tblOrderDetails] ([orderID], [bookID], [quantity]) VALUES (10, N'bookID003', 1)
INSERT [dbo].[tblOrderDetails] ([orderID], [bookID], [quantity]) VALUES (11, N'bookID003', 1)
INSERT [dbo].[tblOrderDetails] ([orderID], [bookID], [quantity]) VALUES (12, N'bookID001', 4)
INSERT [dbo].[tblOrderDetails] ([orderID], [bookID], [quantity]) VALUES (12, N'bookID002', 1)
INSERT [dbo].[tblOrderDetails] ([orderID], [bookID], [quantity]) VALUES (12, N'bookID004', 6)
INSERT [dbo].[tblOrderDetails] ([orderID], [bookID], [quantity]) VALUES (12, N'bookID009', 1)
INSERT [dbo].[tblOrderDetails] ([orderID], [bookID], [quantity]) VALUES (13, N'bookID003', 3)
INSERT [dbo].[tblOrderDetails] ([orderID], [bookID], [quantity]) VALUES (13, N'bookID004', 2)
INSERT [dbo].[tblOrderDetails] ([orderID], [bookID], [quantity]) VALUES (14, N'bookID003', 1)
INSERT [dbo].[tblOrderDetails] ([orderID], [bookID], [quantity]) VALUES (15, N'bookID003', 1)
INSERT [dbo].[tblOrderDetails] ([orderID], [bookID], [quantity]) VALUES (15, N'bookID006', 1)
INSERT [dbo].[tblOrderDetails] ([orderID], [bookID], [quantity]) VALUES (17, N'bookID003', 2)
INSERT [dbo].[tblOrderDetails] ([orderID], [bookID], [quantity]) VALUES (17, N'bookID006', 2)
INSERT [dbo].[tblOrderDetails] ([orderID], [bookID], [quantity]) VALUES (17, N'bookID008', 1)
INSERT [dbo].[tblOrderDetails] ([orderID], [bookID], [quantity]) VALUES (17, N'bookID009', 1)
INSERT [dbo].[tblOrderDetails] ([orderID], [bookID], [quantity]) VALUES (18, N'bookID003', 1)
INSERT [dbo].[tblOrderDetails] ([orderID], [bookID], [quantity]) VALUES (19, N'bookID001', 1)
INSERT [dbo].[tblOrderDetails] ([orderID], [bookID], [quantity]) VALUES (19, N'bookID002', 3)
GO
INSERT [dbo].[tblUser] ([userID], [password], [fullName], [role]) VALUES (N'admin', N'1', N'I am admin', 2)
INSERT [dbo].[tblUser] ([userID], [password], [fullName], [role]) VALUES (N'admin2', N'1', N'I am admin2', 2)
INSERT [dbo].[tblUser] ([userID], [password], [fullName], [role]) VALUES (N'binh', N'', N'', 1)
INSERT [dbo].[tblUser] ([userID], [password], [fullName], [role]) VALUES (N'binh1', N'1', N'Nguyen Chau Thanh Binh', 1)
INSERT [dbo].[tblUser] ([userID], [password], [fullName], [role]) VALUES (N'binh2', N'1', N'nctb', 1)
INSERT [dbo].[tblUser] ([userID], [password], [fullName], [role]) VALUES (N'randomUserID1', N'randomPassword1', N'Random User 1', 1)
INSERT [dbo].[tblUser] ([userID], [password], [fullName], [role]) VALUES (N'randomUserID2', N'randomPassword2', N'Random User 2', 1)
INSERT [dbo].[tblUser] ([userID], [password], [fullName], [role]) VALUES (N'randomUserID3', N'randomPassword3', N'Random User 3', 1)
INSERT [dbo].[tblUser] ([userID], [password], [fullName], [role]) VALUES (N'randomUserID4', N'randomPassword4', N'Random User 4', 1)
INSERT [dbo].[tblUser] ([userID], [password], [fullName], [role]) VALUES (N'randomUserID5', N'randomPassword5', N'Random User 5', 1)
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD FOREIGN KEY([bookID])
REFERENCES [dbo].[tblBook] ([bookID])
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
USE [master]
GO
ALTER DATABASE [NCTB_BOOKSTORE] SET  READ_WRITE 
GO
