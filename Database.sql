USE [master]
GO
/****** Object:  Database [CalofitDB]    Script Date: 08-Jun-24 8:08:38 PM ******/
CREATE DATABASE [CalofitDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CalofitDB', FILENAME = N'D:\SQL_Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CalofitDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CalofitDB_log', FILENAME = N'D:\SQL_Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CalofitDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CalofitDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CalofitDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CalofitDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CalofitDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CalofitDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CalofitDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CalofitDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CalofitDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CalofitDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CalofitDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CalofitDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CalofitDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CalofitDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CalofitDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CalofitDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CalofitDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CalofitDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CalofitDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CalofitDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CalofitDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CalofitDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CalofitDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CalofitDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CalofitDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CalofitDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CalofitDB] SET  MULTI_USER 
GO
ALTER DATABASE [CalofitDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CalofitDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CalofitDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CalofitDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CalofitDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CalofitDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CalofitDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [CalofitDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CalofitDB]
GO
/****** Object:  Table [dbo].[Allergy]    Script Date: 08-Jun-24 8:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Allergy](
	[allergy_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[allergen] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[allergy_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 08-Jun-24 8:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[orderid] [int] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 08-Jun-24 8:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[recipe_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[comment_text] [nvarchar](max) NOT NULL,
	[comment_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Diet]    Script Date: 08-Jun-24 8:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[diet_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 08-Jun-24 8:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[image_id] [int] IDENTITY(1,1) NOT NULL,
	[image_filename] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredient_Serving_Sizes]    Script Date: 08-Jun-24 8:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredient_Serving_Sizes](
	[serving_size_id] [int] IDENTITY(1,1) NOT NULL,
	[ingredient_id] [int] NOT NULL,
	[qty] [float] NOT NULL,
	[scale] [float] NOT NULL,
	[units] [nvarchar](50) NOT NULL,
	[grams] [float] NOT NULL,
	[description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[serving_size_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredients]    Script Date: 08-Jun-24 8:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredients](
	[ingredient_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[image_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ingredient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meal]    Script Date: 08-Jun-24 8:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meal](
	[meal_id] [int] IDENTITY(1,1) NOT NULL,
	[plan_id] [int] NOT NULL,
	[meal_type] [nvarchar](50) NOT NULL,
	[meal_date] [date] NOT NULL,
	[meal_recipes_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[meal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MealPlan]    Script Date: 08-Jun-24 8:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MealPlan](
	[plan_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NOT NULL,
	[plan_type] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[plan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 08-Jun-24 8:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[menu_name] [nvarchar](50) NOT NULL,
	[diet_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nutritions]    Script Date: 08-Jun-24 8:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nutritions](
	[ingredient_id] [int] NOT NULL,
	[calories] [float] NOT NULL,
	[fat] [float] NOT NULL,
	[sugar] [float] NOT NULL,
	[carbohydrates] [float] NOT NULL,
	[protein] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ingredient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 08-Jun-24 8:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[userid] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 08-Jun-24 8:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[orderid] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recipe_Allergies]    Script Date: 08-Jun-24 8:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipe_Allergies](
	[recipe_allergy_id] [int] IDENTITY(1,1) NOT NULL,
	[recipe_id] [int] NOT NULL,
	[allergy_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[recipe_allergy_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recipe_Ingredients]    Script Date: 08-Jun-24 8:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipe_Ingredients](
	[recipe_ingredient_id] [int] IDENTITY(1,1) NOT NULL,
	[recipe_id] [int] NOT NULL,
	[ingredient_id] [int] NOT NULL,
	[serving_size_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[recipe_ingredient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recipe_Ratings]    Script Date: 08-Jun-24 8:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipe_Ratings](
	[rating_id] [int] IDENTITY(1,1) NOT NULL,
	[recipe_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[rating] [int] NOT NULL,
	[rating_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[rating_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recipes]    Script Date: 08-Jun-24 8:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipes](
	[recipe_id] [int] IDENTITY(1,1) NOT NULL,
	[recipe_name] [nvarchar](255) NOT NULL,
	[servings] [int] NOT NULL,
	[cook_time] [int] NOT NULL,
	[prep_time] [int] NOT NULL,
	[description] [nvarchar](max) NULL,
	[image_id] [int] NULL,
	[menu_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[recipe_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Step]    Script Date: 08-Jun-24 8:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Step](
	[step_id] [int] IDENTITY(1,1) NOT NULL,
	[recipe_id] [int] NOT NULL,
	[step_number] [int] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[image_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[step_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Goals]    Script Date: 08-Jun-24 8:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Goals](
	[user_goal_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[goal_type] [nvarchar](50) NOT NULL,
	[goal_details] [nvarchar](255) NULL,
	[target_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_goal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Preferences]    Script Date: 08-Jun-24 8:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Preferences](
	[user_preference_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[diet_id] [int] NOT NULL,
	[favorite_recipes_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_preference_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 08-Jun-24 8:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
	[registration_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Allergy] ON 

INSERT [dbo].[Allergy] ([allergy_id], [user_id], [allergen]) VALUES (1, 1, N'Đậu phộng')
INSERT [dbo].[Allergy] ([allergy_id], [user_id], [allergen]) VALUES (2, 2, N'Sữa bò')
INSERT [dbo].[Allergy] ([allergy_id], [user_id], [allergen]) VALUES (3, 1, N'Gluten')
INSERT [dbo].[Allergy] ([allergy_id], [user_id], [allergen]) VALUES (4, 1, N'Hải sản')
INSERT [dbo].[Allergy] ([allergy_id], [user_id], [allergen]) VALUES (5, 2, N'Đậu nành')
INSERT [dbo].[Allergy] ([allergy_id], [user_id], [allergen]) VALUES (6, 1, N'Trứng')
SET IDENTITY_INSERT [dbo].[Allergy] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([id], [userid], [orderid]) VALUES (1, 1, 1)
INSERT [dbo].[Cart] ([id], [userid], [orderid]) VALUES (2, 1, 1)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([comment_id], [recipe_id], [user_id], [comment_text], [comment_date]) VALUES (1, 1, 1, N'Món này ngon quá!', CAST(N'2023-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Comments] ([comment_id], [recipe_id], [user_id], [comment_text], [comment_date]) VALUES (2, 1, 2, N'Thực đơn Keto phù hợp cho ai đang giảm cân.', CAST(N'2023-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Comments] ([comment_id], [recipe_id], [user_id], [comment_text], [comment_date]) VALUES (3, 2, 1, N'Sốt thịt bò thơm ngon lắm!', CAST(N'2023-01-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Comments] ([comment_id], [recipe_id], [user_id], [comment_text], [comment_date]) VALUES (4, 2, 2, N'Làm theo công thức dễ dàng và nhanh chóng.', CAST(N'2023-01-04T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Diet] ON 

INSERT [dbo].[Diet] ([id], [diet_name]) VALUES (1, N'Thực phẩm dinh dưỡng')
INSERT [dbo].[Diet] ([id], [diet_name]) VALUES (2, N'Ăn chay')
INSERT [dbo].[Diet] ([id], [diet_name]) VALUES (3, N'Ít Carbohydrates')
INSERT [dbo].[Diet] ([id], [diet_name]) VALUES (4, N'Nhiều Protein')
INSERT [dbo].[Diet] ([id], [diet_name]) VALUES (5, N'Không Gluten')
SET IDENTITY_INSERT [dbo].[Diet] OFF
GO
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (1, N'https://images.pexels.com/photos/2059153/pexels-photo-2059153.jpeg?auto=compress&cs=tinysrgb&w=600')
SET IDENTITY_INSERT [dbo].[Images] OFF
GO
SET IDENTITY_INSERT [dbo].[Ingredient_Serving_Sizes] ON 

INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (1, 1, 100, 1, N'gram', 100, N'1 miếng')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (2, 2, 15, 1, N'ml', 15, N'1 muỗng canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (3, 3, 3, 1, N'gram', 3, N'2 tép')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (4, 4, 2, 1, N'gram', 2, N'1/2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (5, 5, 2, 1, N'gram', 2, N'1/2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (6, 6, 50, 1, N'gram', 50, N'1 tô nhỏ')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (7, 7, 1, 1, N'gram', 1, N'1 cành')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (8, 8, 150, 1, N'gram', 150, N'1 phần')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (9, 9, 200, 1, N'gram', 200, N'1 phần')
SET IDENTITY_INSERT [dbo].[Ingredient_Serving_Sizes] OFF
GO
SET IDENTITY_INSERT [dbo].[Ingredients] ON 

INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (1, N'Thịt bò xay', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (2, N'Dầu ô liu nguyên chất', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (3, N'Tỏi tươi', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (4, N'Muối', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (5, N'Húng quế khô', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (6, N'Bắp cải xanh', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (7, N'Húng quế', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (8, N'Trái cây', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (9, N'Gà', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (10, N'Cá hồi', 1)
SET IDENTITY_INSERT [dbo].[Ingredients] OFF
GO
SET IDENTITY_INSERT [dbo].[Meal] ON 

INSERT [dbo].[Meal] ([meal_id], [plan_id], [meal_type], [meal_date], [meal_recipes_id]) VALUES (1, 1, N'Bữa sáng', CAST(N'2023-01-01' AS Date), 1)
INSERT [dbo].[Meal] ([meal_id], [plan_id], [meal_type], [meal_date], [meal_recipes_id]) VALUES (2, 2, N'Bữa trưa', CAST(N'2023-01-02' AS Date), 2)
INSERT [dbo].[Meal] ([meal_id], [plan_id], [meal_type], [meal_date], [meal_recipes_id]) VALUES (3, 3, N'Bữa tối', CAST(N'2023-01-03' AS Date), 3)
INSERT [dbo].[Meal] ([meal_id], [plan_id], [meal_type], [meal_date], [meal_recipes_id]) VALUES (4, 4, N'Bữa sáng', CAST(N'2023-01-04' AS Date), 4)
INSERT [dbo].[Meal] ([meal_id], [plan_id], [meal_type], [meal_date], [meal_recipes_id]) VALUES (5, 5, N'Bữa trưa', CAST(N'2023-01-05' AS Date), 5)
INSERT [dbo].[Meal] ([meal_id], [plan_id], [meal_type], [meal_date], [meal_recipes_id]) VALUES (6, 6, N'Bữa tối', CAST(N'2023-01-06' AS Date), 6)
SET IDENTITY_INSERT [dbo].[Meal] OFF
GO
SET IDENTITY_INSERT [dbo].[MealPlan] ON 

INSERT [dbo].[MealPlan] ([plan_id], [user_id], [start_date], [end_date], [plan_type]) VALUES (1, 1, CAST(N'2023-01-01' AS Date), CAST(N'2023-01-07' AS Date), N'weekly')
INSERT [dbo].[MealPlan] ([plan_id], [user_id], [start_date], [end_date], [plan_type]) VALUES (2, 2, CAST(N'2023-01-02' AS Date), CAST(N'2023-01-08' AS Date), N'weekly')
INSERT [dbo].[MealPlan] ([plan_id], [user_id], [start_date], [end_date], [plan_type]) VALUES (3, 1, CAST(N'2023-01-03' AS Date), CAST(N'2023-01-09' AS Date), N'weekly')
INSERT [dbo].[MealPlan] ([plan_id], [user_id], [start_date], [end_date], [plan_type]) VALUES (4, 2, CAST(N'2023-01-04' AS Date), CAST(N'2023-01-10' AS Date), N'weekly')
INSERT [dbo].[MealPlan] ([plan_id], [user_id], [start_date], [end_date], [plan_type]) VALUES (5, 1, CAST(N'2023-01-05' AS Date), CAST(N'2023-01-11' AS Date), N'daily')
INSERT [dbo].[MealPlan] ([plan_id], [user_id], [start_date], [end_date], [plan_type]) VALUES (6, 2, CAST(N'2023-01-06' AS Date), CAST(N'2023-01-12' AS Date), N'daily')
INSERT [dbo].[MealPlan] ([plan_id], [user_id], [start_date], [end_date], [plan_type]) VALUES (7, 1, CAST(N'2023-01-07' AS Date), CAST(N'2023-01-13' AS Date), N'daily')
SET IDENTITY_INSERT [dbo].[MealPlan] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([id], [menu_name], [diet_id]) VALUES (1, N'Thực đơn dinh dưỡng', 1)
INSERT [dbo].[Menu] ([id], [menu_name], [diet_id]) VALUES (2, N'Thực đơn Ăn chay', 3)
INSERT [dbo].[Menu] ([id], [menu_name], [diet_id]) VALUES (3, N'Thực đơn Ít Carbohydrates', 2)
INSERT [dbo].[Menu] ([id], [menu_name], [diet_id]) VALUES (4, N'Thực đơn Nhiều Protein', 4)
INSERT [dbo].[Menu] ([id], [menu_name], [diet_id]) VALUES (5, N'Thực đơn Không Gluten', 5)
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
INSERT [dbo].[Nutritions] ([ingredient_id], [calories], [fat], [sugar], [carbohydrates], [protein]) VALUES (1, 250, 10, 0, 0, 30)
INSERT [dbo].[Nutritions] ([ingredient_id], [calories], [fat], [sugar], [carbohydrates], [protein]) VALUES (2, 120, 14, 0, 0, 0)
INSERT [dbo].[Nutritions] ([ingredient_id], [calories], [fat], [sugar], [carbohydrates], [protein]) VALUES (3, 5, 0, 0, 1, 0)
INSERT [dbo].[Nutritions] ([ingredient_id], [calories], [fat], [sugar], [carbohydrates], [protein]) VALUES (4, 0, 0, 0, 0, 0)
INSERT [dbo].[Nutritions] ([ingredient_id], [calories], [fat], [sugar], [carbohydrates], [protein]) VALUES (5, 0, 0, 0, 0, 0)
INSERT [dbo].[Nutritions] ([ingredient_id], [calories], [fat], [sugar], [carbohydrates], [protein]) VALUES (6, 20, 0, 0, 5, 1)
INSERT [dbo].[Nutritions] ([ingredient_id], [calories], [fat], [sugar], [carbohydrates], [protein]) VALUES (7, 2, 0, 0, 0, 0)
INSERT [dbo].[Nutritions] ([ingredient_id], [calories], [fat], [sugar], [carbohydrates], [protein]) VALUES (8, 60, 0, 15, 15, 0)
INSERT [dbo].[Nutritions] ([ingredient_id], [calories], [fat], [sugar], [carbohydrates], [protein]) VALUES (9, 220, 5, 0, 0, 40)
INSERT [dbo].[Nutritions] ([ingredient_id], [calories], [fat], [sugar], [carbohydrates], [protein]) VALUES (10, 180, 8, 0, 0, 25)
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [date], [userid]) VALUES (1, CAST(N'2024-06-08' AS Date), 1)
INSERT [dbo].[Order] ([id], [date], [userid]) VALUES (5, CAST(N'2024-06-08' AS Date), 1)
INSERT [dbo].[Order] ([id], [date], [userid]) VALUES (6, CAST(N'2024-06-08' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([id], [productId], [price], [quantity], [orderid]) VALUES (1, 1, 5.5, 11, 1)
INSERT [dbo].[OrderDetail] ([id], [productId], [price], [quantity], [orderid]) VALUES (2, 2, 6, 5, 1)
INSERT [dbo].[OrderDetail] ([id], [productId], [price], [quantity], [orderid]) VALUES (3, 3, 3, 4, 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Recipe_Allergies] ON 

INSERT [dbo].[Recipe_Allergies] ([recipe_allergy_id], [recipe_id], [allergy_id]) VALUES (1, 1, 1)
INSERT [dbo].[Recipe_Allergies] ([recipe_allergy_id], [recipe_id], [allergy_id]) VALUES (2, 2, 2)
INSERT [dbo].[Recipe_Allergies] ([recipe_allergy_id], [recipe_id], [allergy_id]) VALUES (3, 3, 3)
INSERT [dbo].[Recipe_Allergies] ([recipe_allergy_id], [recipe_id], [allergy_id]) VALUES (4, 4, 4)
INSERT [dbo].[Recipe_Allergies] ([recipe_allergy_id], [recipe_id], [allergy_id]) VALUES (5, 5, 5)
INSERT [dbo].[Recipe_Allergies] ([recipe_allergy_id], [recipe_id], [allergy_id]) VALUES (6, 6, 6)
SET IDENTITY_INSERT [dbo].[Recipe_Allergies] OFF
GO
SET IDENTITY_INSERT [dbo].[Recipe_Ingredients] ON 

INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (1, 1, 9, 1)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (2, 1, 2, 2)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (3, 1, 3, 3)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (4, 1, 4, 4)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (5, 1, 5, 5)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (6, 1, 6, 6)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (7, 1, 7, 7)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (8, 2, 1, 1)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (9, 2, 2, 2)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (10, 2, 3, 3)
SET IDENTITY_INSERT [dbo].[Recipe_Ingredients] OFF
GO
SET IDENTITY_INSERT [dbo].[Recipe_Ratings] ON 

INSERT [dbo].[Recipe_Ratings] ([rating_id], [recipe_id], [user_id], [rating], [rating_date]) VALUES (1, 1, 1, 5, CAST(N'2023-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Recipe_Ratings] ([rating_id], [recipe_id], [user_id], [rating], [rating_date]) VALUES (2, 1, 2, 4, CAST(N'2023-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Recipe_Ratings] ([rating_id], [recipe_id], [user_id], [rating], [rating_date]) VALUES (3, 2, 1, 5, CAST(N'2023-01-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Recipe_Ratings] ([rating_id], [recipe_id], [user_id], [rating], [rating_date]) VALUES (4, 2, 2, 4, CAST(N'2023-01-04T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Recipe_Ratings] OFF
GO
SET IDENTITY_INSERT [dbo].[Recipes] ON 

INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (1, N'Mì Keto Ý Bò Bắp Cải', 2, 20, 10, N'Bữa ăn này làm hài lòng đám đông đến tận ruột gan! Bắp cải thái mỏng hoạt động giống như “mì” trong nước sốt thịt Ý đậm đà này.', 1, 1)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (2, N'Mì Ý với Sốt Thịt Bò', 4, 30, 15, N'Món mì Ý với sốt thịt bò đậm đà.', 1, 1)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (3, N'Salad Trái Cây', 2, 10, 5, N'Salad tươi mát với các loại trái cây.', 1, 2)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (4, N'Gà Nướng Mật Ong', 4, 40, 10, N'Gà nướng với mật ong thơm ngon.', 1, 1)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (5, N'Cá Hồi Sốt Bơ Chanh', 2, 20, 10, N'Cá hồi tươi ngon với sốt bơ chanh.', 1, 1)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (6, N'Bánh Mì Kẹp Thịt', 1, 15, 5, N'Bánh mì kẹp thịt bò và rau.', 1, 1)
SET IDENTITY_INSERT [dbo].[Recipes] OFF
GO
SET IDENTITY_INSERT [dbo].[Step] ON 

INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (1, 1, 1, N'Đun nóng dầu ô liu trong chảo hoặc nồi lớn trên lửa vừa. Sau khi nóng, thêm thịt bò xay vào, dùng thìa hoặc thìa bẻ nhỏ.', 1)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (2, 1, 2, N'Thêm tỏi, muối, gia vị Ý và húng quế vào thịt. Khi đã chín hoàn toàn được nửa chừng, hãy cho lọ nước sốt Rao vào. Đun sôi và giảm nhiệt xuống mức trung bình thấp.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (3, 1, 3, N'Cắt mỏng bắp cải, thêm vào thịt bò và dùng kẹp đảo đều. Sau khi bắp cải đã được phủ một phần hỗn hợp cà chua và thịt bò, hãy giảm nhiệt xuống mức vừa phải và đậy nắp chảo lại, chỉ để lại một vết nứt nhỏ để nhiệt thoát ra và giảm bớt. Để hỗn hợp sôi trong khoảng 7-10 phút hoặc cho đến khi bắp cải mềm.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (4, 1, 4, N'Để hỗn hợp sôi trong khoảng 7-10 phút hoặc cho đến khi bắp cải mềm. Mở nắp ra khỏi chảo và để nấu thêm vài phút nữa để làm bay hơi hết chất lỏng thoát ra khỏi bắp cải. Rắc húng quế cắt nhỏ lên trên và thưởng thức!', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (5, 2, 1, N'Bước 1 cho nước sôi vào chảo và chờ nước sôi, sau đó cho mì Ý vào luộc chín.', 1)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (6, 2, 2, N'Bước 2 ướp thịt bò với gia vị Ý và húng quế.', 1)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (7, 2, 3, N'Bước 3 sau đó chảo lên bếp đun nóng dầu cho thịt vào xào đều.', 1)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (8, 2, 4, N'Bước 4 tiếp theo cho sốt cà chua vào và xào đều tay.', 1)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (9, 2, 5, N'Bước 5 cuối cùng cho mì vào khuấy đều với thịt và sốt trong khoảng 5-7 phút cho mì thấm gia vị.', 1)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (10, 3, 1, N'Rửa sạch trái cây và rau xanh, cắt nhỏ theo từng miếng vừa ăn.', 1)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (11, 3, 2, N'Trộn đều trái cây và rau trong một tô lớn.', 1)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (12, 3, 3, N'Chuẩn bị sốt vinaigrette bằng cách trộn đường, dầu ô liu, giấm, muối và tiêu với nhau.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (13, 3, 4, N'Rưới sốt vinaigrette lên trên trái cây và rau, trộn đều.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (14, 3, 5, N'Chuẩn bị một dĩa trang trí, sắp xếp trái cây và rau lên trên, rắc thêm hạt giống và chia để thưởng thức.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (15, 4, 1, N'Bước 1: Chuẩn bị nguyên liệu. Rửa sạch gà và để ráo nước.', 1)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (16, 4, 2, N'Bước 2: Ướp gà với hỗn hợp gia vị gồm mật ong, dầu ô liu, muối, tiêu, tỏi băm nhỏ và hành lá băm nhỏ.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (17, 4, 3, N'Bước 3: Đặt gà vào khay nướng và nướng ở nhiệt độ 200°C trong khoảng 30 phút hoặc cho đến khi gà chín và mặt nướng vàng đẹp.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (18, 4, 4, N'Bước 4: Khi gà đã chín, lấy ra khỏi lò và chờ nguội một chút trước khi thái lát và dọn ra đĩa.', 1)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (19, 4, 5, N'Bước 5: Trang trí gà với một ít rau mầm và hành lá băm. Thêm một ít hạt tiêu lên trên và thưởng thức.', 1)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (20, 5, 1, N'Chuẩn bị nguyên liệu: Cắt cá hồi thành từng miếng vừa ăn, ướp gia vị với một ít muối, tiêu và dầu ô liu.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (21, 5, 2, N'Chuẩn bị sốt bơ chanh bằng cách trộn bơ tan chảy, nước chanh và một ít muối trong một tô nhỏ.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (22, 5, 3, N'Nướng cá hồi trên bếp than hoặc lò nướng với lửa vừa trong khoảng 10-12 phút hoặc cho đến khi cá chín và mặt ngoài hồng đẹp.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (23, 5, 4, N'Khi cá hồi đã nướng chín, đặt lên dĩa, rưới sốt bơ chanh lên trên và thêm một ít hành lá băm nhỏ để trang trí.', NULL)
SET IDENTITY_INSERT [dbo].[Step] OFF
GO
SET IDENTITY_INSERT [dbo].[User_Goals] ON 

INSERT [dbo].[User_Goals] ([user_goal_id], [user_id], [goal_type], [goal_details], [target_date]) VALUES (1, 1, N'Giảm cân', N'Giảm 5 kg', CAST(N'2023-03-01' AS Date))
INSERT [dbo].[User_Goals] ([user_goal_id], [user_id], [goal_type], [goal_details], [target_date]) VALUES (2, 2, N'Tăng cơ', N'Tăng 2 kg cơ bắp', CAST(N'2023-04-01' AS Date))
SET IDENTITY_INSERT [dbo].[User_Goals] OFF
GO
SET IDENTITY_INSERT [dbo].[User_Preferences] ON 

INSERT [dbo].[User_Preferences] ([user_preference_id], [user_id], [diet_id], [favorite_recipes_id]) VALUES (1, 1, 1, 1)
INSERT [dbo].[User_Preferences] ([user_preference_id], [user_id], [diet_id], [favorite_recipes_id]) VALUES (2, 2, 2, 3)
INSERT [dbo].[User_Preferences] ([user_preference_id], [user_id], [diet_id], [favorite_recipes_id]) VALUES (3, 2, 3, 4)
INSERT [dbo].[User_Preferences] ([user_preference_id], [user_id], [diet_id], [favorite_recipes_id]) VALUES (4, 1, 4, 5)
INSERT [dbo].[User_Preferences] ([user_preference_id], [user_id], [diet_id], [favorite_recipes_id]) VALUES (5, 1, 5, 6)
SET IDENTITY_INSERT [dbo].[User_Preferences] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role], [registration_date]) VALUES (1, N'Tran Xuan Bang', N'bang0501@aa', N'bang1@example.com', N'user', CAST(N'2023-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role], [registration_date]) VALUES (2, N'Nguyen Van Tien', N'tien12345', N'tien2@example.com', N'user', CAST(N'2023-01-02T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__AB6E61646800B2CC]    Script Date: 08-Jun-24 8:08:38 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__F3DBC57203525822]    Script Date: 08-Jun-24 8:08:38 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (getdate()) FOR [comment_date]
GO
ALTER TABLE [dbo].[Recipe_Ratings] ADD  DEFAULT (getdate()) FOR [rating_date]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [registration_date]
GO
ALTER TABLE [dbo].[Allergy]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Order] FOREIGN KEY([orderid])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Order]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Users] FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Users]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([recipe_id])
REFERENCES [dbo].[Recipes] ([recipe_id])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Ingredient_Serving_Sizes]  WITH CHECK ADD FOREIGN KEY([ingredient_id])
REFERENCES [dbo].[Ingredients] ([ingredient_id])
GO
ALTER TABLE [dbo].[Ingredients]  WITH CHECK ADD FOREIGN KEY([image_id])
REFERENCES [dbo].[Images] ([image_id])
GO
ALTER TABLE [dbo].[Meal]  WITH CHECK ADD FOREIGN KEY([meal_recipes_id])
REFERENCES [dbo].[Recipes] ([recipe_id])
GO
ALTER TABLE [dbo].[Meal]  WITH CHECK ADD FOREIGN KEY([plan_id])
REFERENCES [dbo].[MealPlan] ([plan_id])
GO
ALTER TABLE [dbo].[MealPlan]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD FOREIGN KEY([diet_id])
REFERENCES [dbo].[Diet] ([id])
GO
ALTER TABLE [dbo].[Nutritions]  WITH CHECK ADD FOREIGN KEY([ingredient_id])
REFERENCES [dbo].[Ingredients] ([ingredient_id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Users] FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Users]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Ingredients] FOREIGN KEY([productId])
REFERENCES [dbo].[Ingredients] ([ingredient_id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Ingredients]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([orderid])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[Recipe_Allergies]  WITH CHECK ADD FOREIGN KEY([allergy_id])
REFERENCES [dbo].[Allergy] ([allergy_id])
GO
ALTER TABLE [dbo].[Recipe_Allergies]  WITH CHECK ADD FOREIGN KEY([recipe_id])
REFERENCES [dbo].[Recipes] ([recipe_id])
GO
ALTER TABLE [dbo].[Recipe_Ingredients]  WITH CHECK ADD FOREIGN KEY([ingredient_id])
REFERENCES [dbo].[Ingredients] ([ingredient_id])
GO
ALTER TABLE [dbo].[Recipe_Ingredients]  WITH CHECK ADD FOREIGN KEY([recipe_id])
REFERENCES [dbo].[Recipes] ([recipe_id])
GO
ALTER TABLE [dbo].[Recipe_Ingredients]  WITH CHECK ADD FOREIGN KEY([serving_size_id])
REFERENCES [dbo].[Ingredient_Serving_Sizes] ([serving_size_id])
GO
ALTER TABLE [dbo].[Recipe_Ratings]  WITH CHECK ADD FOREIGN KEY([recipe_id])
REFERENCES [dbo].[Recipes] ([recipe_id])
GO
ALTER TABLE [dbo].[Recipe_Ratings]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Recipes]  WITH CHECK ADD FOREIGN KEY([image_id])
REFERENCES [dbo].[Images] ([image_id])
GO
ALTER TABLE [dbo].[Recipes]  WITH CHECK ADD FOREIGN KEY([menu_id])
REFERENCES [dbo].[Menu] ([id])
GO
ALTER TABLE [dbo].[Step]  WITH CHECK ADD FOREIGN KEY([image_id])
REFERENCES [dbo].[Images] ([image_id])
GO
ALTER TABLE [dbo].[Step]  WITH CHECK ADD FOREIGN KEY([recipe_id])
REFERENCES [dbo].[Recipes] ([recipe_id])
GO
ALTER TABLE [dbo].[User_Goals]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[User_Preferences]  WITH CHECK ADD FOREIGN KEY([diet_id])
REFERENCES [dbo].[Diet] ([id])
GO
ALTER TABLE [dbo].[User_Preferences]  WITH CHECK ADD FOREIGN KEY([favorite_recipes_id])
REFERENCES [dbo].[Recipes] ([recipe_id])
GO
ALTER TABLE [dbo].[User_Preferences]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[MealPlan]  WITH CHECK ADD CHECK  (([plan_type]='weekly' OR [plan_type]='daily'))
GO
ALTER TABLE [dbo].[Recipe_Ratings]  WITH CHECK ADD CHECK  (([rating]>=(1) AND [rating]<=(5)))
GO
USE [master]
GO
ALTER DATABASE [CalofitDB] SET  READ_WRITE 
GO
