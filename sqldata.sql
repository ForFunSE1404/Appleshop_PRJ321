USE [master]
GO
/****** Object:  Database [YourAnswer]    Script Date: 11/15/2020 4:36:09 PM ******/
CREATE DATABASE [YourAnswer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'YourAnswer', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\YourAnswer.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'YourAnswer_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\YourAnswer_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [YourAnswer] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [YourAnswer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [YourAnswer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [YourAnswer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [YourAnswer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [YourAnswer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [YourAnswer] SET ARITHABORT OFF 
GO
ALTER DATABASE [YourAnswer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [YourAnswer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [YourAnswer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [YourAnswer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [YourAnswer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [YourAnswer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [YourAnswer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [YourAnswer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [YourAnswer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [YourAnswer] SET  DISABLE_BROKER 
GO
ALTER DATABASE [YourAnswer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [YourAnswer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [YourAnswer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [YourAnswer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [YourAnswer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [YourAnswer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [YourAnswer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [YourAnswer] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [YourAnswer] SET  MULTI_USER 
GO
ALTER DATABASE [YourAnswer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [YourAnswer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [YourAnswer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [YourAnswer] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [YourAnswer] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [YourAnswer] SET QUERY_STORE = OFF
GO
USE [YourAnswer]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 11/15/2020 4:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cartId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [nvarchar](20) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[totalprice] [float] NOT NULL,
	[status] [bit] NOT NULL,
	[note] [nvarchar](255) NOT NULL,
	[addressId] [int] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[cartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[sellbymonth]    Script Date: 11/15/2020 4:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[sellbymonth] as
SELECT  Months.m AS month, ISNULL(SUM(totalprice), 0) AS total FROM 
(
    SELECT 1 as m 
    UNION SELECT 2 as m 
    UNION SELECT 3 as m 
    UNION SELECT 4 as m 
    UNION SELECT 5 as m 
    UNION SELECT 6 as m 
    UNION SELECT 7 as m 
    UNION SELECT 8 as m 
    UNION SELECT 9 as m 
    UNION SELECT 10 as m 
    UNION SELECT 11 as m 
    UNION SELECT 12 as m
) as Months
LEFT JOIN Cart  on Months.m = MONTH(Cart.createDate)  
GROUP BY
    Months.m
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/15/2020 4:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[userID] [nvarchar](20) NOT NULL,
	[password] [nvarchar](128) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[isActived] [bit] NOT NULL,
	[token] [nvarchar](128) NULL,
	[infoId] [int] NULL,
	[roleId] [int] NOT NULL,
	[avartar] [nvarchar](255) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetail]    Script Date: 11/15/2020 4:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetail](
	[cartDetailId] [int] IDENTITY(1,1) NOT NULL,
	[cartId] [int] NOT NULL,
	[productId] [nvarchar](20) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_CartDetail] PRIMARY KEY CLUSTERED 
(
	[cartDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/15/2020 4:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryId] [nvarchar](20) NOT NULL,
	[categoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 11/15/2020 4:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[imgId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [nvarchar](20) NOT NULL,
	[imgUrl] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[imgId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InfoUser]    Script Date: 11/15/2020 4:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InfoUser](
	[infoId] [int] IDENTITY(1,1) NOT NULL,
	[city] [nvarchar](20) NULL,
	[address] [nvarchar](50) NULL,
	[phone] [nvarchar](10) NULL,
 CONSTRAINT [PK_InfoUser] PRIMARY KEY CLUSTERED 
(
	[infoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/15/2020 4:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productId] [nvarchar](20) NOT NULL,
	[categoryId] [nvarchar](20) NOT NULL,
	[productName] [nvarchar](255) NOT NULL,
	[updateDate] [datetime] NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[thumbnail] [nvarchar](255) NOT NULL,
	[description] [text] NULL,
	[visibility] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 11/15/2020 4:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[ratingId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [nvarchar](20) NOT NULL,
	[userId] [nvarchar](20) NOT NULL,
	[value] [float] NOT NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[ratingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/15/2020 4:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WishList]    Script Date: 11/15/2020 4:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WishList](
	[wishListId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [nvarchar](20) NOT NULL,
	[productId] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_WishList] PRIMARY KEY CLUSTERED 
(
	[wishListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([userID], [password], [email], [fullname], [isActived], [token], [infoId], [roleId], [avartar]) VALUES (N'admin1', N'$2a$10$0Z33098d1lPdo2J1O1AWO.1qqV8x6hAkCk3oNDcD37zwv6anz8aRq', N'nghiepnxde140022@fpt.edu.vn', N'Nguyen Xuan Nghiep', 1, NULL, 17, 1, NULL)
INSERT [dbo].[Account] ([userID], [password], [email], [fullname], [isActived], [token], [infoId], [roleId], [avartar]) VALUES (N'customer1', N'$2a$10$sOkIc.NahdaI.M6HMCY3zeFxUlZLGPxasqFpMv2A/2l6cU1d2i./C', N'nhannde140013@fpt.edu.vn', N'Nguyen Nhan', 1, N'$2a$10$gOSf/b3UIrYcukbslmBm3OdSlm64/vzXFUKehB6RLWbYfeMK.Z8Te', 7, 3, NULL)
INSERT [dbo].[Account] ([userID], [password], [email], [fullname], [isActived], [token], [infoId], [roleId], [avartar]) VALUES (N'customer2', N'$2a$10$sOkIc.NahdaI.M6HMCY3zeFxUlZLGPxasqFpMv2A/2l6cU1d2i./C', N'nguyenanhquan@gmail.com', N'Nguyen Anh Quan', 1, NULL, 12, 1, NULL)
INSERT [dbo].[Account] ([userID], [password], [email], [fullname], [isActived], [token], [infoId], [roleId], [avartar]) VALUES (N'Nghiep22', N'$2a$10$.ZIY2pMJg5GxrMMe4Y7vJeGc1eAzXX.2uGkpww4jWQ2TIW09YK93W', N'nguyenhuytrung1112@gmail.com', N'Nguyen Xuan Nghiep', 1, NULL, 15, 3, NULL)
INSERT [dbo].[Account] ([userID], [password], [email], [fullname], [isActived], [token], [infoId], [roleId], [avartar]) VALUES (N'nghiepnx', N'$2a$10$GcOvm/R5lEuvA4apxVPXvujD0ezyW1MAp2nYvYL/N5puLzVQakL6i', N'nguyenxuannghiep1710@gmail.com', N'Nguyen Xuan Nghiep2', 1, NULL, 13, 3, NULL)
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([cartId], [userId], [createDate], [totalprice], [status], [note], [addressId]) VALUES (20, N'admin1', CAST(N'2020-11-15T16:09:24.417' AS DateTime), 475, 1, N'', 17)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[CartDetail] ON 

INSERT [dbo].[CartDetail] ([cartDetailId], [cartId], [productId], [quantity], [price]) VALUES (36, 20, N'P402', 1, 475)
SET IDENTITY_INSERT [dbo].[CartDetail] OFF
GO
INSERT [dbo].[Category] ([categoryId], [categoryName]) VALUES (N'C0001', N'Iphone')
INSERT [dbo].[Category] ([categoryId], [categoryName]) VALUES (N'C0002', N'iPad')
INSERT [dbo].[Category] ([categoryId], [categoryName]) VALUES (N'C0003', N'MacBook')
INSERT [dbo].[Category] ([categoryId], [categoryName]) VALUES (N'C0004', N'Watch')
INSERT [dbo].[Category] ([categoryId], [categoryName]) VALUES (N'C0005', N'AirPods')
INSERT [dbo].[Category] ([categoryId], [categoryName]) VALUES (N'C0006', N'Accessories')
GO
SET IDENTITY_INSERT [dbo].[Image] ON 

INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (1, N'P101', N'images_Product/P101/Images/P101(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (2, N'P101', N'images_Product/P101/Images/P101(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (3, N'P101', N'images_Product/P101/Images/P101(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (4, N'P102', N'images_Product/P102/Images/P102(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (5, N'P102', N'images_Product/P102/Images/P102(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (6, N'P102', N'images_Product/P102/Images/P102(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (7, N'P102', N'images_Product/P102/Images/P102(4).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (8, N'P103', N'images_Product/P103/Images/P103(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (9, N'P103', N'images_Product/P103/Images/P103(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (10, N'P103', N'images_Product/P103/Images/P103(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (11, N'P104', N'images_Product/P104/Images/P104(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (12, N'P104', N'images_Product/P104/Images/P104(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (13, N'P104', N'images_Product/P104/Images/P104(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (14, N'P105', N'images_Product/P105/Images/P105(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (15, N'P105', N'images_Product/P105/Images/P105(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (16, N'P106', N'images_Product/P106/Images/P106(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (17, N'P106', N'images_Product/P106/Images/P106(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (18, N'P107', N'images_Product/P107/Images/P107(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (19, N'P107', N'images_Product/P107/Images/P107(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (20, N'P108', N'images_Product/P108/Images/P108(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (21, N'P108', N'images_Product/P108/Images/P108(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (22, N'P109', N'images_Product/P109/Images/P109(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (23, N'P109', N'images_Product/P109/Images/P109(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (24, N'P110', N'images_Product/P110/Images/P110(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (25, N'P110', N'images_Product/P110/Images/P110(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (26, N'P111', N'images_Product/P111/Images/P111(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (27, N'P111', N'images_Product/P111/Images/P111(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (28, N'P112', N'images_Product/P112/Images/P112(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (29, N'P112', N'images_Product/P112/Images/P112(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (30, N'P113', N'images_Product/P113/Images/P113(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (31, N'P113', N'images_Product/P113/Images/P113(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (32, N'P114', N'images_Product/P114/Images/P114(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (33, N'P114', N'images_Product/P114/Images/P114(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (34, N'P115', N'images_Product/P115/Images/P115(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (35, N'P115', N'images_Product/P115/Images/P115(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (36, N'P116', N'images_Product/P116/Images/P116(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (37, N'P116', N'images_Product/P116/Images/P116(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (38, N'P401', N'images_Product/P401/Images/P401(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (39, N'P401', N'images_Product/P401/Images/P401(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (40, N'P402', N'images_Product/P402/Images/P402(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (41, N'P402', N'images_Product/P402/Images/P402(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (42, N'P403', N'images_Product/P403/Images/P403(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (43, N'P403', N'images_Product/P403/Images/P403(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (44, N'P404', N'images_Product/P404/Images/P404(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (45, N'P404', N'images_Product/P404/Images/P404(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (46, N'P405', N'images_Product/P405/Images/P405(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (47, N'P405', N'images_Product/P405/Images/P405(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (48, N'P406', N'images_Product/P406/Images/P406(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (49, N'P406', N'images_Product/P406/Images/P406(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (50, N'P407', N'images_Product/P407/Images/P407(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (51, N'P407', N'images_Product/P407/Images/P407(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (52, N'P408', N'images_Product/P408/Images/P408(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (53, N'P408', N'images_Product/P408/Images/P408(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (54, N'P409', N'images_Product/P409/Images/P409(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (55, N'P409', N'images_Product/P409/Images/P409(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (56, N'P410', N'images_Product/P410/Images/P410(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (57, N'P410', N'images_Product/P410/Images/P410(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (58, N'P411', N'images_Product/P411/Images/P411(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (59, N'P411', N'images_Product/P411/Images/P411(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (60, N'P412', N'images_Product/P412/Images/P412(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (61, N'P412', N'images_Product/P412/Images/P412(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (62, N'P505', N'images_Product/P505/Images/P505(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (63, N'P505', N'images_Product/P505/Images/P505(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (64, N'P505', N'images_Product/P505/Images/P505(4).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (65, N'P301', N'images_Product/P301/Images/P301(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (66, N'P301', N'images_Product/P301/Images/P301(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (67, N'P302', N'images_Product/P302/Images/P302(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (68, N'P302', N'images_Product/P302/Images/P302(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (69, N'P302', N'images_Product/P302/Images/P302(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (70, N'P303', N'images_Product/P303/Images/P303(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (71, N'P303', N'images_Product/P303/Images/P303(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (72, N'P303', N'images_Product/P303/Images/P303(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (73, N'P304', N'images_Product/P304/Images/P304(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (74, N'P304', N'images_Product/P304/Images/P304(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (75, N'P304', N'images_Product/P304/Images/P304(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (76, N'P305', N'images_Product/P305/Images/P305(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (77, N'P305', N'images_Product/P305/Images/P305(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (78, N'P305', N'images_Product/P305/Images/P305(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (79, N'P306', N'images_Product/P306/Images/P306(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (80, N'P306', N'images_Product/P306/Images/P306(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (81, N'P306', N'images_Product/P306/Images/P306(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (82, N'P307', N'images_Product/P307/Images/P307(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (83, N'P307', N'images_Product/P307/Images/P307(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (84, N'P307', N'images_Product/P307/Images/P307(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (85, N'P308', N'images_Product/P308/Images/P308(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (86, N'P308', N'images_Product/P308/Images/P308(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (87, N'P308', N'images_Product/P308/Images/P308(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (88, N'P309', N'images_Product/P309/Images/P309(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (89, N'P309', N'images_Product/P309/Images/P309(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (90, N'P309', N'images_Product/P309/Images/P309(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (91, N'P310', N'images_Product/P310/Images/P310(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (92, N'P310', N'images_Product/P310/Images/P310(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (93, N'P310', N'images_Product/P310/Images/P310(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (94, N'P311', N'images_Product/P311/Images/P311(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (95, N'P311', N'images_Product/P311/Images/P311(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (96, N'P311', N'images_Product/P311/Images/P311(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (97, N'P312', N'images_Product/P312/Images/P312(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (98, N'P312', N'images_Product/P312/Images/P312(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (99, N'P312', N'images_Product/P312/Images/P312(3).png')
GO
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (100, N'P313', N'images_Product/P313/Images/P313(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (101, N'P313', N'images_Product/P313/Images/P313(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (102, N'P313', N'images_Product/P313/Images/P313(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (103, N'P314', N'images_Product/P314/Images/P314(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (104, N'P314', N'images_Product/P314/Images/P314(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (105, N'P314', N'images_Product/P314/Images/P314(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (106, N'P315', N'images_Product/P315/Images/P315(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (107, N'P315', N'images_Product/P315/Images/P315(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (108, N'P315', N'images_Product/P315/Images/P315(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (109, N'P316', N'images_Product/P316/Images/P316(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (110, N'P316', N'images_Product/P316/Images/P316(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (111, N'P316', N'images_Product/P316/Images/P316(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (112, N'P501', N'images_Product/P501/Images/P501(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (113, N'P501', N'images_Product/P501/Images/P501(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (114, N'P501', N'images_Product/P501/Images/P501(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (115, N'P502', N'images_Product/P502/Images/P502(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (116, N'P502', N'images_Product/P502/Images/P502(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (117, N'P502', N'images_Product/P502/Images/P502(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (118, N'P502', N'images_Product/P502/Images/P502(4).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (119, N'P503', N'images_Product/P503/Images/P503(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (120, N'P503', N'images_Product/P503/Images/P503(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (121, N'P503', N'images_Product/P503/Images/P503(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (122, N'P504', N'images_Product/P504/Images/P504(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (123, N'P504', N'images_Product/P504/Images/P504(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (124, N'P504', N'images_Product/P504/Images/P504(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (125, N'P505', N'images_Product/P505/Images/P505(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (126, N'P505', N'images_Product/P505/Images/P505(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (127, N'P505', N'images_Product/P505/Images/P505(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (128, N'P505', N'images_Product/P505/Images/P505(4).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (178, N'P201', N'images_Product/P201/Images/P201(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (179, N'P201', N'images_Product/P201/Images/P201(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (180, N'P201', N'images_Product/P201/Images/P201(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (181, N'P202', N'images_Product/P202/Images/P202(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (182, N'P202', N'images_Product/P202/Images/P202(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (183, N'P202', N'images_Product/P202/Images/P202(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (184, N'P203', N'images_Product/P203/Images/P203(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (185, N'P203', N'images_Product/P203/Images/P203(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (186, N'P203', N'images_Product/P203/Images/P203(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (187, N'P204', N'images_Product/P204/Images/P204(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (188, N'P204', N'images_Product/P204/Images/P204(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (189, N'P204', N'images_Product/P204/Images/P204(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (190, N'P206', N'images_Product/P206/Images/P206(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (191, N'P206', N'images_Product/P206/Images/P206(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (192, N'P206', N'images_Product/P206/Images/P206(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (193, N'P205', N'images_Product/P205/Images/P205(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (194, N'P205', N'images_Product/P205/Images/P205(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (195, N'P205', N'images_Product/P205/Images/P205(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (196, N'P207', N'images_Product/P207/Images/P207(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (197, N'P207', N'images_Product/P207/Images/P207(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (198, N'P207', N'images_Product/P207/Images/P207(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (199, N'P208', N'images_Product/P208/Images/P208(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (200, N'P208', N'images_Product/P208/Images/P208(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (201, N'P208', N'images_Product/P208/Images/P208(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (202, N'P209', N'images_Product/P209/Images/P209(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (203, N'P209', N'images_Product/P209/Images/P209(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (204, N'P209', N'images_Product/P209/Images/P209(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (205, N'P210', N'images_Product/P210/Images/P210(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (206, N'P210', N'images_Product/P210/Images/P210(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (207, N'P210', N'images_Product/P210/Images/P210(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (208, N'P211', N'images_Product/P211/Images/P211(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (209, N'P211', N'images_Product/P211/Images/P211(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (210, N'P211', N'images_Product/P211/Images/P211(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (211, N'P211', N'images_Product/P211/Images/P211(4).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (212, N'P601', N'images_Product/P601/Images/P601(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (213, N'P601', N'images_Product/P601/Images/P601(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (214, N'P601', N'images_Product/P601/Images/P601(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (215, N'P602', N'images_Product/P602/Images/P602(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (216, N'P602', N'images_Product/P602/Images/P602(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (217, N'P603', N'images_Product/P603/Images/P603(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (218, N'P603', N'images_Product/P603/Images/P603(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (219, N'P604', N'images_Product/P604/Images/P604(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (220, N'P605', N'images_Product/P605/Images/P605(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (221, N'P605', N'images_Product/P605/Images/P605(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (222, N'P606', N'images_Product/P606/Images/P606(1).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (223, N'P606', N'images_Product/P606/Images/P606(2).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (224, N'P606', N'images_Product/P606/Images/P606(3).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (225, N'P606', N'images_Product/P606/Images/P606(4).png')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (226, N'P607', N'images_Product/P607/Images/P607(1).png')
SET IDENTITY_INSERT [dbo].[Image] OFF
GO
SET IDENTITY_INSERT [dbo].[InfoUser] ON 

INSERT [dbo].[InfoUser] ([infoId], [city], [address], [phone]) VALUES (6, N'Da Nang', N'Da Nang3', N'1234567890')
INSERT [dbo].[InfoUser] ([infoId], [city], [address], [phone]) VALUES (7, N'Hue', N'Da Nang2', N'0978656783')
INSERT [dbo].[InfoUser] ([infoId], [city], [address], [phone]) VALUES (8, N'Da Nang', N'Da Nang3', N'0363659356')
INSERT [dbo].[InfoUser] ([infoId], [city], [address], [phone]) VALUES (9, N'Da Nang', N'Da Nang4', N'0363659356')
INSERT [dbo].[InfoUser] ([infoId], [city], [address], [phone]) VALUES (10, N'Da Nang', N'Da Nang4', N'0363659356')
INSERT [dbo].[InfoUser] ([infoId], [city], [address], [phone]) VALUES (11, N'Da Nang', N'Da Nang5', N'0363659356')
INSERT [dbo].[InfoUser] ([infoId], [city], [address], [phone]) VALUES (12, N'Da Nang', N'Da Nang2', N'0381874871')
INSERT [dbo].[InfoUser] ([infoId], [city], [address], [phone]) VALUES (13, N'Da Nang', N'Da Nang2', N'0381874871')
INSERT [dbo].[InfoUser] ([infoId], [city], [address], [phone]) VALUES (14, N'Da Nang', N'Da Nang2', N'0381874871')
INSERT [dbo].[InfoUser] ([infoId], [city], [address], [phone]) VALUES (15, N'Da Nang', N'Da Nang3', N'0381874871')
INSERT [dbo].[InfoUser] ([infoId], [city], [address], [phone]) VALUES (16, N'Da Nang', N'', N'0363659356')
INSERT [dbo].[InfoUser] ([infoId], [city], [address], [phone]) VALUES (17, N'Da Nang', N'Da Nang2', N'0381874871')
SET IDENTITY_INSERT [dbo].[InfoUser] OFF
GO
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P101', N'C0002', N'iPad 10.2 2020 Wi-Fi 32GB ', CAST(N'2020-11-15T14:36:43.567' AS DateTime), 100, 432, N'images_Product/P101/P101_thumbnail.png', N'IPad 10.2 2020 detailed review Wi-Fi 32GB
Less than 10 million, you already own the latest iPad 10.2 2020 model. With a large screen, powerful performance and a dedicated iPad app store, you will have a very enjoyable experience.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P102', N'C0002', N'iPad Mini 5 7.9 Wi-Fi 64GB', CAST(N'2020-11-15T14:09:55.000' AS DateTime), 100, 475, N'images_Product/P102/P102_thumbnail.png', N'IPad Mini 5 7.9 Wi-Fi 64GB Review
Since its launch, the iPad mini product line has always been favored by Vietnamese consumers thanks to its compact, compact size and attractive price compared to other iPads. After years of absence, now the iPad mini series has officially returned with the iPad mini 5 version running the extremely powerful A12 Bionic chip. ', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P103', N'C0002', N'iPad Air 10.9 2020 Wi-Fi 64GB', CAST(N'2020-11-15T14:15:17.000' AS DateTime), 100, 734, N'images_Product/P103/P103_thumbnail.png', N'IPad Air 10.9 2020 Wi-Fi 64GB Review
iPad Air 10.9 2020 is a premium tablet that perfectly meets all your needs in one portable design, a stunning Liquid Retina display, ultra-powerful Apple A14 Bionic processor and battery life. all day.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P104', N'C0002', N'iPad 10.2 2020 Wi-Fi 128GB ', CAST(N'2020-11-15T14:35:57.337' AS DateTime), 100, 691, N'images_Product/P104/P104_thumbnail.png', N'IPad 10.2 2020 detailed review Wi-Fi + Cellular 128GB
IPad version 10.2 2020 128GB Cellular does not have large storage, mobile connectivity, access to the network anytime, anywhere, giving you entertainment and work done with large 10.2 inch Retina display the same powerful Apple A12 Bionic processor.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P105', N'C0002', N'iPad Pro 11 2020 WI-FI 128GB', CAST(N'2020-11-15T14:32:46.027' AS DateTime), 100, 950, N'images_Product/P105/P105_thumbnail.png', N'IPad Pro 11 2020 detailed review WI-FI 128GB
Incredible power on an iPad Pro 11 2020 Wi-Fi 128GB compact, fully compatible with the new generation Magic Keyboard that supports TrackPad, you will have the ideal mobile product for work.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P106', N'C0002', N'iPad 10.2 2020 Wi-Fi 32GB', CAST(N'2020-11-15T14:36:14.743' AS DateTime), 100, 605, N'images_Product/P106/P106_thumbnail.png', N'IPad 10.2 2020 detailed review Wi-Fi + Cellular 32GB
Are you looking for a powerful tablet at an affordable price, the iPad 10.2 with the powerful A12 Bionic chip, the Apple Pencil support and a smart keyboard and great portability will be your ideal companion. for you.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P107', N'C0002', N'iPad Pro 11 2020 WI-FI 4G 128GB ', CAST(N'2020-11-15T14:38:42.000' AS DateTime), 100, 1123, N'images_Product/P107/P107_thumbnail.png', N'IPad Pro 11 2020 detailed review WI-FI 4G 128GB
Not only a means of entertainment, iPad Pro 11 2020 4G Wi-Fi 4G 128GB is also a professional device for work with worthwhile hardware power, compatible with TrackPad keyboard and lightweight ultraportable design. .', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P108', N'C0002', N'iPad 10.2 2020 Wi-Fi 128GB', CAST(N'2020-11-15T14:40:38.000' AS DateTime), 100, 518, N'images_Product/P108/P108_thumbnail.png', N'IPad 10.2 2020 detailed review Wi-Fi 128GB
iPad 10.2 2020 Wi-Fi 128GB owns a large internal memory, spoiled for you to store data and install applications. The content will be displayed on the stunning large and fast Retina display powered by the powerful Apple A12 Bionic chip.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P109', N'C0002', N'iPad Pro 12.9 2020 WI-FI 128GB', CAST(N'2020-11-15T14:42:44.000' AS DateTime), 100, 1210, N'images_Product/P109/P109_thumbnail.png', N'Detailed review iPad Pro 12.9 2020 WI-FI 128GB
More powerful than most current computers, but handy with a premium design and neatly done in your hand, the 12.9-inch 2020 iPad Pro with 128GB Wi-Fi can answer all you need.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P110', N'C0002', N'iPad Pro 11 2020 WI-FI 512GB', CAST(N'2020-11-15T14:45:34.000' AS DateTime), 100, 1382, N'images_Product/P110/P110_thumbnail.png', N'IPad Pro 11 2020 detailed review with WI-FI 512GB
More powerful than a laptop, up to 512GB of memory, iPad Pro 11 2020 512GB Wi-Fi is the most powerful and portable device for your work, all entertainment functions are no less interesting. taste.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P111', N'C0002', N'iPad Pro 12.9 2020 WI-FI 1TB', CAST(N'2020-11-15T14:49:23.000' AS DateTime), 100, 2074, N'images_Product/P111/P111_thumbnail.png', N'Detailed review iPad Pro 12.9 2020 WI-FI 1TB
With an ever-increasing capacity of 1TB and outstanding power, the iPad Pro 12.9 2020 1TB Wi-Fi delivers a top-of-the-line user experience of a mobile device that benefits but is capable of doing everything Work.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P112', N'C0002', N'iPad Pro 11 2020 WI-FI 4G 1TB', CAST(N'2020-11-15T14:50:44.000' AS DateTime), 100, 2030, N'images_Product/P112/P112_thumbnail.png', N'Detailed review iPad Pro 11 2020 WI-FI 4G 1TB
Equivalent to a desktop computer, 1TB super memory, connecting anytime, anywhere, iPad Pro 11 2020 1TB 4G Wi-Fi is ready with you to satisfy any test.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P113', N'C0002', N'iPad Pro 11 2020 WI-FI 1TB', CAST(N'2020-11-15T14:51:59.000' AS DateTime), 100, 1858, N'images_Product/P113/P113_thumbnail.png', N'IPad Pro 11 2020 detailed review WI-FI 1TB
In terms of both power and storage, the iPad Pro 11 2020''s 1TB Wi-Fi surpasses most laptops today. Moreover, with its high features, excellent camera and compatibility with many accessories, iPad Pro 2020 can do more than laptops.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P114', N'C0002', N'iPad Pro 12.9 2020 WI-FI 4G 1TB', CAST(N'2020-11-15T14:53:24.000' AS DateTime), 100, 2247, N'images_Product/P114/P114_thumbnail.png', N'IPad Pro 12.9 2020 WI-FI 4G 1TB Review
iPad Pro 12.9 2020 4G Wi-Fi 1TB is the most advanced tablet in the world today with extremely large storage capacity, high-speed Internet connection anytime, anywhere and amazing hardware power.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P115', N'C0002', N'iPad Pro 12.9 WI-FI 4G 1TB 2018', CAST(N'2020-11-15T14:54:45.000' AS DateTime), 100, 2247, N'images_Product/P115/P115_thumbnail.png', N'IPad Pro 12.9 WI-FI 4G 1TB 2018 Review
The biggest screen iPad has arrived, the 12.9-inch iPad Pro features an all-new design with a super-monolithic display, desktop power, Face ID and the most advanced technologies.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P116', N'C0002', N'iPad Pro 11 2020 WI-FI 4G 256GB', CAST(N'2020-11-15T14:56:26.000' AS DateTime), 100, 1296, N'images_Product/P116/P116_thumbnail.png', N'Detailed review iPad Pro 11 2020 WI-FI 4G 256GB
From feature facilities to really professional things, iPad Pro 11 2020 4G 256GB Wi-Fi is all done excellently, is the select the host computer is the perfect table for you.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P201', N'C0001', N'Iphone 6s Plus 32GB', CAST(N'2020-11-15T14:12:02.000' AS DateTime), 100, 345, N'images_Product/P201/P201_thumbnail.png', N'Apple iPhone 6s Plus is the largest screen iPhone, allowing users to do more on large spaces. In addition, new features such as iOS 10 operating system, 3D Touch, Live Photos or excellent 12MP camera will bring you the greatest satisfaction when using a really high-end smartphone.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P202', N'C0001', N'iPhone SE 2020 64GB', CAST(N'2020-11-15T14:29:16.000' AS DateTime), 100, 495, N'images_Product/P202/P202_thumbnail.png', N'A compact iPhone with a top-of-the-line powerful processor, iPhone SE 2020 at an unprecedented attractive price will be the right choice for all users.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P203', N'C0001', N'iPhone 8 Plus 64GB', CAST(N'2020-11-15T14:35:49.790' AS DateTime), 100, 582, N'images_Product/P203/P203_thumbnail.png', N'Apple suddenly launched the iPhone 8 and iPhone 8 Plus duo that created a new storm that swept all the super product charts. As usual, the iPhone 8 Plus from design to functionality offers users a great experience that cannot be missed.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P204', N'C0001', N'iPhone XR 64GB', CAST(N'2020-11-15T14:39:14.000' AS DateTime), 100, 560, N'images_Product/P204/P204_thumbnail.png', N'The iPhone with the all-new Liquid Retina display, the most advanced LCD technology with faster Face ID, a powerful chip, and a perfect font-erasing camera system. That is the iPhone XR with great colors waiting for you.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P205', N'C0001', N'iPhone 11 64GB', CAST(N'2020-11-15T14:45:00.460' AS DateTime), 100, 776, N'images_Product/P205/P205_thumbnail.png', N'iPhone 11 with 6 color versions, outstanding camera capabilities, extremely long battery life and the most powerful processor ever will bring you a great experience.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P206', N'C0001', N'iPhone 11 Pro 64GB', CAST(N'2020-11-15T14:44:03.000' AS DateTime), 100, 1120, N'images_Product/P206/P206_thumbnail.png', N'Welcome to the first generation iPhone Pro. iPhone 11 Pro owns a classy 3-camera system, a leap in battery life and a new chip with unprecedented powerful performance. Powerful, distinctive and professional, the product is absolutely worthy of the name.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P207', N'C0001', N'iPhone 11 Pro Max 64GB', CAST(N'2020-11-15T14:48:54.000' AS DateTime), 100, 1200, N'images_Product/P207/P207_thumbnail.png', N'The biggest, biggest, best battery life iPhone out there. iPhone 11 Pro Max is definitely the phone that everyone desires when possessing the best features, especially the camera and battery.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P208', N'C0001', N'iPhone 12 Mini 64GB', CAST(N'2020-11-15T14:52:47.000' AS DateTime), 100, 820, N'images_Product/P208/P208_thumbnail.png', N'iPhone 12 Mini - the "youngest" phone in the iPhone 12 generation this year was officially launched. With outstanding performance improvements in a small body, iPhone 12 Mini promises to explode the mobile market in the near future.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P209', N'C0001', N'iPhone 12 64GB', CAST(N'2020-11-15T14:55:21.000' AS DateTime), 100, 945, N'images_Product/P209/P209_thumbnail.png', N'The 64GB iPhone 12 has a design that has been completely "transformed" compared to previous generations with flat beveled edges, square to sharp edges, giving an extremely durable and solid feeling. This design makes it easy for users to think of the legendary iPhone models that have made the name of Apple such as iPhone 4 or iPhone 5.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P210', N'C0001', N'iPhone 12 Pro 128GB', CAST(N'2020-11-15T14:58:23.000' AS DateTime), 100, 1190, N'images_Product/P210/P210_thumbnail.png', N'The genuine iPhone 12 Pro 128GB has a square design with flat edges, giving it a strong, solid feel when held in the hand. This design is reminiscent of the iPhone 5s launched many years ago. Or most recently, the flat aluminum frame design of the iPad Pro also inspired the look of the 128GB iPhone 12 Pro.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P211', N'C0001', N'iPhone 12 Pro Max 128GB', CAST(N'2020-11-15T15:02:26.000' AS DateTime), 100, 1300, N'images_Product/P211/P211_thumbnail.png', N'iPhone 12 Pro Max officially became the iPhone with the largest screen up to now. You will experience stunning visuals on this 6.7 inch Super Retina XDR display. The screen bezel and the notch has been slimmed down to optimize the display space. The iPhone 12 Pro Max panel supports HDR10 standard with a maximum brightness of up to 1200 nits. The screen of the device is protected by the Ceremic Shield tempered glass for 4 times the durability of the previous generation.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P301', N'C0003', N'MacBook Air 13" 2017', CAST(N'2020-11-15T14:26:49.000' AS DateTime), 100, 1250, N'images_Product/P301/P301_thumbnail.png', N'Macbook Air 13 128 GB MQD32SA / A (2017) with unchanged design, luxurious aluminum case, super thin and super light, upgraded performance, extremely long battery life, suitable for office needs light, no need to put too much emphasis on the display of the screen.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P302', N'C0003', N'Macbook Pro 15'''' 2017 256GB', CAST(N'2020-11-15T14:35:32.150' AS DateTime), 100, 2588, N'images_Product/P302/P302_thumbnail.png', N'MacBook Pro 15 inch Touch Bar 256GB (2017) launched with many improvements in performance and configuration: faster, more powerful with the appearance of the Touch Bar - tool "divine" marks a new step. of this high-end product line.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P303', N'C0003', N'Macbook Pro 15'''' 2017 512GB', CAST(N'2020-11-15T14:37:21.000' AS DateTime), 100, 3020, N'images_Product/P303/P303_thumbnail.png', N'Macbook Pro 15 inch Touch Bar 512GB (2017) - Apple launched at WWDC 2017 with a slim, light design, has an OLED screen strip showing buttons, especially in hardware upgraded stronger than the session previous version. This is really a laptop that can satisfy tech enthusiasts in the high-end segment, in terms of configuration, technology and design.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P304', N'C0003', N'Macbook Pro 13'''' 2018 256GB', CAST(N'2020-11-15T14:41:08.000' AS DateTime), 100, 1855, N'images_Product/P304/P304_thumbnail.png', N'The MacBook Pro 13 Touch Bar 256GB 2018 is the perfect work laptop with the power of an 8th generation Intel processor, intelligent Touch Bar and a Retina display that''s sharp to detail.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P305', N'C0003', N'Macbook Pro 15'''' 2018 512GB', CAST(N'2020-11-15T14:45:02.000' AS DateTime), 100, 2890, N'images_Product/P305/P305_thumbnail.png', N'The MacBook Pro 15 Touch Bar 2018 is the most powerful laptop available today for work, with support from the Smart Touch Bar will change your laptop usage habits.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P306', N'C0003', N'Macbook 12 256GB (2018)', CAST(N'2020-11-15T14:48:38.000' AS DateTime), 100, 1466, N'images_Product/P306/P306_thumbnail.png', N'The MacBook 12 (2018) has a flawless look, the result of the constant efforts and creativity of Apple''s engineering team. Every detail has been meticulously designed with an ultra-light, ultra-durable shell to bring the most compact MacBook. The MacBook 12 is only 13.1mm thin and weighs a mere 0.9kg, which can be said to be unthinkable.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P307', N'C0003', N'Macbook 12 512GB (2018)', CAST(N'2020-11-15T14:50:25.000' AS DateTime), 100, 1509, N'images_Product/P307/P307_thumbnail.png', N'The MacBook 12 (2018) has a flawless look, the result of the constant efforts and creativity of Apple''s engineering team. Every detail has been meticulously designed with an ultra-light, ultra-durable shell to bring the most compact MacBook. The MacBook 12 is only 13.1mm thin and weighs a mere 0.9kg, which can be said to be unthinkable.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P308', N'C0003', N'Macbook Pro 15'''' i7 256GB (2019)', CAST(N'2020-11-15T14:54:05.000' AS DateTime), 100, 2437, N'images_Product/P308/P308_thumbnail.png', N'The Intel Core i7 processor on the MacBook Pro 15 Touch Bar is now even more powerful when it comes to clock speed upgrades. With a 6-core clocked at 2.6GHz Turbo Boost 4.5GHz, MacBook Pro 15 has super-fast CPU performance that handles any dedicated task great. You can work comfortably with heavy applications like 3D video rending; add special effects; handling multimedia tracks; programming complex software; ... everything went as quickly as it should.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P309', N'C0003', N'Macbook Pro 15'''' i9 512GB (2019)', CAST(N'2020-11-15T14:56:01.000' AS DateTime), 100, 2933, N'images_Product/P309/P309_thumbnail.png', N'The Retina display on the MacBook Pro 15 2019 is the best display ever found on a Mac laptop. This screen uses LED backlighting and high contrast, creating deep blacks with brighter white light. P3 wide color and sRGB technology makes blue and red more vibrant. In addition, the Touch Bar version also has True Tone technology, automatic white balance based on ambient temperature to bring the most natural experience. Not to mention the super high resolution of 2880 x 1800 pixels, giving you sharp images in every detail.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P310', N'C0003', N'MacBook Pro 13" 2019 i5 512GB', CAST(N'2020-11-15T15:00:39.000' AS DateTime), 100, 2113, N'images_Product/P310/P310_thumbnail.png', N'The power of the 512GB MacBook Pro 13 Touch Bar (2019) has been significantly upgraded, with four cores instead of just two like previous generations. The processor for the 2.4GHz Turbo Boost clocked at 4.1GHz, helping MacBook Pro 2019 with CPU performance reach new heights, handling every dedicated task wonderfully. You can work comfortably with heavy applications like 3D video rending; add special effects; handling multimedia tracks; programming complex software; ... everything went as quickly as it should.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P311', N'C0003', N'MacBook Pro 13" 2020 i5 1TB', CAST(N'2020-11-15T15:03:29.000' AS DateTime), 100, 2372, N'images_Product/P311/P311_thumbnail.png', N'MacBook Pro 13 2020 high-end version possesses the power of 10-generation Intel processor and up to 1TB of memory SSD hard drive, perfect for your work in a professional way like never before.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P312', N'C0003', N'MacBook Pro 16" 2019 i9 1TB', CAST(N'2020-11-15T15:07:24.000' AS DateTime), 100, 3019, N'images_Product/P312/P312_thumbnail.png', N'All the limits are born to break, the MacBook Pro 16 Touch Bar has upgraded the screen size to 16 inches and become the MacBook with the largest screen ever. You will enjoy the stunning Retina display, 500 nits of maximum brightness, and perfect depth black rendering. Colors are almost absolutely accurate, P3''s wide color gamut makes images and videos display lifelike. A larger, more professional workspace awaits you, especially graphics work that requires an accurate display.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P313', N'C0003', N'MacBook Pro 13" 2020 i5 256GB', CAST(N'2020-11-15T15:11:14.000' AS DateTime), 100, 1509, N'images_Product/P313/P313_thumbnail.png', N'The standard MacBook Pro 13 2020 version has now been upgraded to a 256GB SSD hard drive, enough for basic storage needs of users. SSDs are not only super durable, but also have amazing read / write speeds of up to 3.0GB / s. All your work on your computer from starting up, opening apps to installing and copying data is faster with the MacBook Pro''s SSD hard drive. Moreover, with the Apple T2 Security chip, all data is absolutely guaranteed.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P314', N'C0003', N'MacBook Pro 13" 2020 i5 512GB', CAST(N'2020-11-15T15:12:59.000' AS DateTime), 100, 2070, N'images_Product/P314/P314_thumbnail.png', N'MacBook Pro 13 2020 takes the performance of mobile laptops to a completely different level. New quad-core 10th Gen Intel processor, 2.0GHz Turbo Boost up to 3.8GHz, 6MB of L3 cache for your ideal speed. As long as the idea comes to mind, the MacBook Pro will do it right away. Furthermore, 16GB of LPDDR4X 3733MHz RAM makes it more capable of multitasking than ever. Multitasking, running multiple programs at once, opening heavy files, all are no problem on the MacBook Pro 13 2020.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P315', N'C0003', N'MacBook Air 13" 2020 i5 512GB', CAST(N'2020-11-15T15:14:57.000' AS DateTime), 100, 1509, N'images_Product/P315/P315_thumbnail.png', N'A portable ultra-thin and light laptop with a stunning Retina display, incredible power and a brand-new keyboard, the 512GB MacBook Air 13 2020 is your companion to work and play. mind.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P316', N'C0003', N'MacBook Air 13" 2020 i3 256GB', CAST(N'2020-11-15T15:16:18.000' AS DateTime), 100, 1250, N'images_Product/P316/P316_thumbnail.png', N'The ultra-thin and light MacBook Air 2020 is now more powerful than ever. Excellent Retina display, new Magic Keyboard keyboard and all-day battery life, MacBook Air 13 2020 256GB deserves to be the most portable laptop today.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P401', N'C0004', N' Apple Watch SE GPS 40mm rubber strap', CAST(N'2020-11-15T15:09:00.000' AS DateTime), 100, 389, N'images_Product/P401/P401_thumbnail.png', N'Apple Watch SE GPS 40mm review with aluminum rubber strap
With a large Retina display, gorgeous thin bezels, built-in advanced sensors and top-notch health features, the Apple Watch SE gives you more than you expected in an attractive price point.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P402', N'C0004', N'Apple Watch SE GPS + Cellular 40mm with aluminum band', CAST(N'2020-11-15T15:14:43.370' AS DateTime), 100, 475, N'images_Product/P402/P402_thumbnail.png', N'Apple Watch SE GPS Review + 40mm Portable Aluminum Rubber Strap
The Apple Watch SE Cellular version not only has a stylish design, high-end thin-bezel Retina display, a range of features useful for health, but also has the ability to connect independently without a phone.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P403', N'C0004', N'Apple Watch Series 6 GPS + Cellular 40mm aluminum ', CAST(N'2020-11-15T15:18:18.800' AS DateTime), 100, 691, N'images_Product/P403/P403_thumbnail.png', N'Review Apple Watch Series 6 GPS + 40mm Portable Aluminum Rubber Strap
The future of health is on your wrist. Apple Watch Series 6 with blood oxygen measurement, anytime, anywhere electrocardiogram and perfect workout support, will give you a healthier and more active life.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P404', N'C0004', N'Apple Watch Series 3 GPS 38mm with aluminum rubber band', CAST(N'2020-11-15T15:14:24.000' AS DateTime), 100, 237, N'images_Product/P404/P404_thumbnail.png', N'Apple Watch Series 3 GPS 38mm aluminum bezel with rubber trim
Apple Watch Series 3 GPS, 38mm aluminum rim, white rubber strap MTEY2VN / A - Apple branded watch, possesses a modern and youthful design, suitable for sports activities or picnic. You will have to be natural about the features this watch owns.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P405', N'C0004', N'Apple Watch Nike Series 3 GPS Cellular 38mm aluminum', CAST(N'2020-11-15T15:23:42.433' AS DateTime), 100, 259, N'images_Product/P405/P405_thumbnail.png', N'Review details Apple Watch Nike Series 3 GPS Cellular 38mm aluminum rubber band
Apple Watch Nike S3 Cellular 38mm wears a sporty design when paired with Nike; Comes with a series of smart features supporting health and connectivity, independent call listening without phone.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P406', N'C0004', N'Apple Watch Series 5 GPS 40mm with aluminum rubber band', CAST(N'2020-11-15T15:25:25.000' AS DateTime), 100, 432, N'images_Product/P406/P406_thumbnail.png', N'Apple Watch Series 5 GPS 40mm aluminum bezel with rubber trim
A watch with lots of smart features, health care and stunning jewelry, and more, immediately bring the Apple Watch Series 5 to your team.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P407', N'C0004', N'Apple Watch Nike Series 5 GPS Cellular 44mm aluminum ', CAST(N'2020-11-15T15:27:17.000' AS DateTime), 100, 561, N'images_Product/P407/P407_thumbnail.png', N'Review details Apple Watch Nike Series 5 GPS Cellular 44mm aluminum rubber band
Apple Watch Nike S5 Cellular 44mm is a smartwatch made by Apple in conjunction with Nike, has a very large screen, built-in eSIM that allows for independent call listening, and a host of notification features to assist with manipulation.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P408', N'C0004', N'Apple Watch Series 3 GPS Cellular 42mm aluminum ', CAST(N'2020-11-15T15:28:50.000' AS DateTime), 100, 302, N'images_Product/P408/P408_thumbnail.png', N'Review details Apple Watch Series 3 GPS Cellular 42mm aluminum rubber band
Apple Watch Series 3 Cellular 42mm aluminum rubber strap with integrated eSIM, capable of independent phone calls without the need of a phone, with two color versions: black and white, will be the optimal choice when you are want to buy a smart watch.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P409', N'C0004', N'Apple Watch Series 5 GPS Cellular 44mm aluminum rubber band', CAST(N'2020-11-15T15:30:48.783' AS DateTime), 100, 561, N'images_Product/P409/P409_thumbnail.png', N'Review details Apple Watch Series 5 GPS Cellular 44mm aluminum rubber band
Apple Watch Series 5 Cellular 44mm aluminum rubber band owns a large screen, for more experience, and the ability to hear called independent connection without a phone thanks to the integrated eSIM.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P410', N'C0004', N'Apple Watch Series 5 GPS Cellular 40mm with rubber strap', CAST(N'2020-11-15T15:32:17.000' AS DateTime), 100, 734, N'images_Product/P410/P410_thumbnail.png', N'Review details Apple Watch Series 5 GPS Cellular 40mm rubber strap
Apple Watch Series 5 Cellular 40mm rubber band is a premium version of the Apple Watch line with a combination of a luxurious frame and a sports rubber strap, in particular, this watch also has an integrated eSIM. phone-free setup.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P411', N'C0004', N'Apple Watch Series 5 GPS Cellular 40mm steel wire trim', CAST(N'2020-11-15T15:33:51.303' AS DateTime), 100, 821, N'images_Product/P411/P411_thumbnail.png', N'Review details Apple Watch Series 5 GPS Cellular 40mm steel wire rim
The high-end, elegant Apple Watch Series 5 Cellular 40mm steel bracelet is worthy of the symbol of the complete combination of technology and fashion, giving you an intelligent experience on a class product.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P412', N'C0004', N'Apple Watch Series 6 GPS + Cellular 44mm steel wire trim', CAST(N'2020-11-15T15:35:29.000' AS DateTime), 100, 994, N'images_Product/P412/P412_thumbnail.png', N'Review details Apple Watch Series 6 GPS + Cellular 44mm steel wire rim
Apple Watch Series 6 high-end steel wire version with a large 44mm face and Cellular connection support, is the most luxurious smartwatch, with a range of leading features in health and fitness.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P501', N'C0005', N'AirPods 2 wired charging box', CAST(N'2020-11-15T15:33:59.190' AS DateTime), 100, 215, N'images_Product/P501/P501_thumbnail.png', N'Inheriting all the quintessence of the original AirPods headset, Apple AirPods 2 have added many effective upgrades to increase battery life as well as optimize sound to become one of the True headset models. Wireless has the best technology.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P502', N'C0005', N'AirPods Pro', CAST(N'2020-11-15T15:33:28.163' AS DateTime), 100, 301, N'images_Product/P502/P502_thumbnail.png', N'AirPods Pro will immerse you in a deep music space and provide a superior entertainment experience like never before on Apple wireless headphones. Powerful upgrades in design and technology make AirPods Pro headphones a true professional music device.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P503', N'C0005', N'AirPods 1/2 wireless charging box', CAST(N'2020-11-15T15:31:16.930' AS DateTime), 100, 85, N'images_Product/P503/P503_thumbnail.png', N'From the very first days of its release, the image of the AirPods product line has been associated with a delicate wireless carrying case and a handy charging tool. To the AirPods 2 generation, the box has been upgraded to support Qi standard wireless charging feature, in addition, Apple also put the notification LED out to the outside so that users can easily distinguish. The wireless charging case is the perfect companion tool that''s ideal for AirPods users.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P504', N'C0005', N'AirPods 2 wireless charging box', CAST(N'2020-11-15T15:34:47.000' AS DateTime), 100, 258, N'images_Product/P504/P504_thumbnail.png', N'Inheriting one of Apple''s best-selling product lines in the world, the wireless AirPods 2 bring many improvements in efficiency and sophistication to become the superior True Wireless headset in terms of technology, perfection as well as sound quality.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P505', N'C0005', N'Airpods', CAST(N'2020-11-15T15:38:34.000' AS DateTime), 100, 215, N'images_Product/P505/P505_thumbnail.png', N'Smart setting with just one simple touch. Each headset has a microphone to help you talk or command Siri. Apple W1 chip is groundbreaking, providing better connectivity, improved audio and better battery life management. Just charging for 15 minutes can use listening continuously for 3 hours.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P601', N'C0006', N'Fast Charger iPhone 20W Type-C', CAST(N'2020-11-15T15:12:50.000' AS DateTime), 100, 35, N'images_Product/P601/P601_thumbnail.png', N'Fast, maximum time saver is what iPhone users expect from their battery chargers. To be able to do that, the use of genuine Apple iPhone 20W Type-C PD MHJE3ZA fast charger is essential that you should not ignore.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P602', N'C0006', N'Apple Pencil 1', CAST(N'2020-11-15T15:16:02.000' AS DateTime), 100, 125, N'images_Product/P602/P602_thumbnail.png', N'The Apple Pencil 1 is a stylus product used to support the iPad Pro and iPad 2018 product lines of Apple. With luxurious design and modern features, the user feels like using a real pen. With this apple accessory brings the iPad Pro experience to a new level.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P603', N'C0006', N'Apple Pencil 2', CAST(N'2020-11-15T16:28:59.957' AS DateTime), 100, 160, N'images_Product/P603/P603_thumbnail.png', N'After the support of users for the Apple Pencil, the Apple accessory has continued to release the second-generation Apple Pencil, called the Apple Pencil 2. A valuable upgrade, the Apple Pencil 2 stylus deserves to be an indispensable technology toy accessory when users own an iPad.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P604', N'C0006', N'Charger iPhone Type C 18W', CAST(N'2020-11-15T15:23:41.000' AS DateTime), 100, 38, N'images_Product/P604/P604_thumbnail.png', N'Annoyed that your iPhone can''t charge fast and is wasting your time handling your work? Want to buy a genuine Apple iPhone Type C 18w charger now but wonder about its features? Please refer to the article below for a better understanding.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P605', N'C0006', N'Apple Magic Mouse 2', CAST(N'2020-11-15T15:26:09.000' AS DateTime), 100, 80, N'images_Product/P605/P605_thumbnail.png', N'Apple Magic Mouse 2 carries a metal design of the frame and mouse body, giving them a certain elegance and premium. Along with that, the high-end, durable plastic manipulation on the top makes it possible for you to perform as compact, flexible and comfortable as possible. This design of Magic Mouse 2 mouse helps synchronize and harmonize when you use with Apple device.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P606', N'C0006', N'Smart Keyboard iPad Pro 11 2020', CAST(N'2020-11-15T15:31:55.000' AS DateTime), 100, 224, N'images_Product/P606/P606_thumbnail.png', N'As you probably already know, the newly launched iPad Pro 11 2020 also possesses the ability to turn into a laptop thanks to support for a removable keyboard. Therefore, to get your work done quickly, own Smart Keyboard iPad Pro 11 2020 keyboard.', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [quantity], [price], [thumbnail], [description], [visibility]) VALUES (N'P607', N'C0006', N'Power Adapter Macbook Apple 30W USB-C', CAST(N'2020-11-15T15:36:06.000' AS DateTime), 100, 52, N'images_Product/P607/P607_thumbnail.png', N'Made by Apple', 1)
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (1, N'ROLE_ADMIN')
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (2, N'Seller')
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (3, N'ROLE_USER')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_InfoUser] FOREIGN KEY([infoId])
REFERENCES [dbo].[InfoUser] ([infoId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_InfoUser]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([roleId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Account] FOREIGN KEY([userId])
REFERENCES [dbo].[Account] ([userID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Account]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_InfoUser] FOREIGN KEY([addressId])
REFERENCES [dbo].[InfoUser] ([infoId])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_InfoUser]
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD  CONSTRAINT [FK_CartDetail_Cart] FOREIGN KEY([cartId])
REFERENCES [dbo].[Cart] ([cartId])
GO
ALTER TABLE [dbo].[CartDetail] CHECK CONSTRAINT [FK_CartDetail_Cart]
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD  CONSTRAINT [FK_CartDetail_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([productId])
GO
ALTER TABLE [dbo].[CartDetail] CHECK CONSTRAINT [FK_CartDetail_Product]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([productId])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([categoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Account] FOREIGN KEY([userId])
REFERENCES [dbo].[Account] ([userID])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Account]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([productId])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Product]
GO
ALTER TABLE [dbo].[WishList]  WITH CHECK ADD  CONSTRAINT [FK_WishList_Account] FOREIGN KEY([userId])
REFERENCES [dbo].[Account] ([userID])
GO
ALTER TABLE [dbo].[WishList] CHECK CONSTRAINT [FK_WishList_Account]
GO
ALTER TABLE [dbo].[WishList]  WITH CHECK ADD  CONSTRAINT [FK_WishList_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([productId])
GO
ALTER TABLE [dbo].[WishList] CHECK CONSTRAINT [FK_WishList_Product]
GO
USE [master]
GO
ALTER DATABASE [YourAnswer] SET  READ_WRITE 
GO
