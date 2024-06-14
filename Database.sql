USE [CalofitDB]
GO
/****** Object:  Table [dbo].[Allergy]    Script Date: 6/13/2024 8:04:48 PM ******/
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
/****** Object:  Table [dbo].[Cart]    Script Date: 6/13/2024 8:04:48 PM ******/
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
/****** Object:  Table [dbo].[Comments]    Script Date: 6/13/2024 8:04:48 PM ******/
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
/****** Object:  Table [dbo].[Diet]    Script Date: 6/13/2024 8:04:48 PM ******/
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
/****** Object:  Table [dbo].[Images]    Script Date: 6/13/2024 8:04:48 PM ******/
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
/****** Object:  Table [dbo].[Ingredient_Serving_Sizes]    Script Date: 6/13/2024 8:04:48 PM ******/
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
/****** Object:  Table [dbo].[Ingredients]    Script Date: 6/13/2024 8:04:48 PM ******/
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
/****** Object:  Table [dbo].[Meal]    Script Date: 6/13/2024 8:04:48 PM ******/
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
/****** Object:  Table [dbo].[MealPlan]    Script Date: 6/13/2024 8:04:48 PM ******/
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
/****** Object:  Table [dbo].[Menu]    Script Date: 6/13/2024 8:04:48 PM ******/
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
/****** Object:  Table [dbo].[Nutritions]    Script Date: 6/13/2024 8:04:48 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 6/13/2024 8:04:48 PM ******/
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6/13/2024 8:04:48 PM ******/
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
/****** Object:  Table [dbo].[Recipe_Allergies]    Script Date: 6/13/2024 8:04:48 PM ******/
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
/****** Object:  Table [dbo].[Recipe_Ingredients]    Script Date: 6/13/2024 8:04:48 PM ******/
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
/****** Object:  Table [dbo].[Recipe_Ratings]    Script Date: 6/13/2024 8:04:48 PM ******/
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
/****** Object:  Table [dbo].[Recipes]    Script Date: 6/13/2024 8:04:48 PM ******/
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
/****** Object:  Table [dbo].[Step]    Script Date: 6/13/2024 8:04:48 PM ******/
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
/****** Object:  Table [dbo].[User_Goals]    Script Date: 6/13/2024 8:04:48 PM ******/
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
/****** Object:  Table [dbo].[User_Preferences]    Script Date: 6/13/2024 8:04:48 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 6/13/2024 8:04:48 PM ******/
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
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (2, N'https://healthyrecipesblogs.com/wp-content/uploads/2022/06/cobb-salad-1-2022.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (3, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/01/mix-the-dressing.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (4, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/01/1-Cobb-Salad-greens.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (5, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/01/7-Cobb-Salad-blue-cheese.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (6, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/01/7-Cobb-Salad-blue-cheese.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (7, N'https://healthyrecipesblogs.com/wp-content/uploads/2022/07/lettuce-sandwich-1-2022.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (8, N'https://healthyrecipesblogs.com/wp-content/uploads/2023/08/baked-chicken-drumsticks-1-2023.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (9, N'https://healthyrecipesblogs.com/wp-content/uploads/2022/03/shrimp-salad-1-2022.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (10, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/02/protein-pancakes-blueberries-stack.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (11, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/03/balsamic-cauliflower-steaks.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (12, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/04/veggie-kabobs-1-2024.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (13, N'https://healthyrecipesblogs.com/wp-content/uploads/2021/12/pumpkin-curry-soup-1-2021.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (14, N'https://healthyrecipesblogs.com/wp-content/uploads/2022/03/korean-ground-beef-1-2022.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (15, N'https://healthyrecipesblogs.com/wp-content/uploads/2022/07/chicken-meatballs-1-2022.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (16, N'https://healthyrecipesblogs.com/wp-content/uploads/2021/10/peanut-butter-mug-cake-1-2021.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (17, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/04/ham-steak-1.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (18, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/03/pork-stew-1-2024.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (19, N'https://healthyrecipesblogs.com/wp-content/uploads/2022/06/cucumber-tomato-salad-1.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (20, N'https://healthyrecipesblogs.com/wp-content/uploads/2023/06/homemade-coleslaw-1.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (21, N'https://healthyrecipesblogs.com/wp-content/uploads/2022/06/keto-fried-chicken-1-2022.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (22, N'https://healthyrecipesblogs.com/wp-content/uploads/2023/04/sauteed-shrimp-1.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (23, N'https://healthyrecipesblogs.com/wp-content/uploads/2022/01/hamburger-soup-1-2022.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (24, N'https://healthyrecipesblogs.com/wp-content/uploads/2022/09/mushroom-frittata-1-2022-new.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (25, N'https://healthyrecipesblogs.com/wp-content/uploads/2022/07/octopus-salad-1.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (26, N'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/coconut-sponge-b64579a.jpg?quality=90&webp=true&resize=375,341')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (27, N'https://images.immediate.co.uk/production/volatile/sites/30/2023/12/Sausage-and-kale-minestrone-51e4b25.jpg?quality=90&webp=true&resize=375,341')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (28, N'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/beef-curry-711a4c1.jpg?quality=90&webp=true&resize=375,341')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (29, N'https://images.immediate.co.uk/production/volatile/sites/30/2023/06/Healthy-BBQ-chicken-47f94f2.jpg?quality=90&webp=true&resize=375,341')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (30, N'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/creamed-corn-4e1fb02.jpg?quality=90&webp=true&resize=375,341')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (31, N'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/kentucky-fried-seitan-e7d0879.jpg?quality=90&webp=true&resize=375,341')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (32, N'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/tomato-and-chickpea-curry-53a2e1d.jpg?quality=90&webp=true&resize=375,341')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (33, N'https://images.immediate.co.uk/production/volatile/sites/30/2021/02/butter-chicken-ac2ff98.jpg?quality=90&webp=true&resize=375,341')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (34, N'https://images.immediate.co.uk/production/volatile/sites/30/2020/12/Chicken-parmigiana-c13fae7.jpg?quality=90&webp=true&resize=375,341')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (35, N'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/creamy_mashed_potatoes-a78053f.jpg?quality=90&webp=true&resize=375,341')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (36, N'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/crispiest-ever-roast-potatoes-b0cfb42.jpg?quality=90&webp=true&resize=375,341')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (37, N'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2013/9/12/1/FN_Picky-Eaters-Chicken-Nuggets_s4x3.jpg.rend.hgtvcom.826.620.suffix/1383770571120.jpeg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (38, N'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-560972_11-656d5fc.jpg?quality=90&webp=true&resize=375,341')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (39, N'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/prawn-fried-rice-a36cef9.jpg?quality=90&webp=true&resize=375,341')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (40, N'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/pomegranate-487dac3.jpg?quality=90&webp=true&resize=375,341')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (41, N'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-1116452_11-a8988c1.jpg?quality=90&webp=true&resize=375,341')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (42, N'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/vegan-chilli-be48585.jpg?quality=90&webp=true&resize=375,341')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (43, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/01/mint-tea-1.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (44, N'https://healthyrecipesblogs.com/wp-content/uploads/2023/06/iced-tea-1.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (45, N'https://healthyrecipesblogs.com/wp-content/uploads/2022/06/fried-fish-1-2022.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (46, N'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/fish-mappas-a84eed1.jpg?quality=90&webp=true&resize=375,341')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (47, N'https://healthyrecipesblogs.com/wp-content/uploads/2021/12/mashed-sweet-potatoes-1-2021.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (48, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/03/boil-the-shrimp.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (49, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/03/mix-dressing.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (50, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/03/add-ingredients-to-dressing.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (51, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/03/mix-salad.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (52, N'https://healthyrecipesblogs.com/wp-content/uploads/2022/07/lettuce-sandwich-collage-1-2022.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (53, N'https://healthyrecipesblogs.com/wp-content/uploads/2022/07/lettuce-sandwich-collage-2-2022.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (54, N'https://healthyrecipesblogs.com/wp-content/uploads/2023/11/Protein-Pancakes-1.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (55, N'https://healthyrecipesblogs.com/wp-content/uploads/2023/11/Protein-Pancakes-2.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (56, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/02/weighing-protein-powder-40.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (57, N'https://healthyrecipesblogs.com/wp-content/uploads/2023/11/Protein-Pancakes-4.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (58, N'https://healthyrecipesblogs.com/wp-content/uploads/2023/11/Protein-Pancakes-5.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (59, N'https://healthyrecipesblogs.com/wp-content/uploads/2023/11/Protein-Pancakes-6.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (60, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/02/slice-cauliflower.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (61, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/02/season-cauliflower.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (62, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/02/cauliflower-ready.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (63, N'https://healthyrecipesblogs.com/wp-content/uploads/2023/09/Pumpkin-Soup-Saucepan.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (64, N'https://healthyrecipesblogs.com/wp-content/uploads/2023/09/Pumpkin-Soup-Mix.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (65, N'https://healthyrecipesblogs.com/wp-content/uploads/2023/09/Pumpkin-Soup-boiling.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (66, N'https://healthyrecipesblogs.com/wp-content/uploads/2023/09/Pumpkin-Soup-Coconut-Milk.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (67, N'https://healthyrecipesblogs.com/wp-content/uploads/2023/09/Pumpkin-Soup-Served.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (68, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/04/mix-marinade.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (69, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/04/mix-veggies-marinade.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (70, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/04/thread-veggies-skewers.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (71, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/04/veggie-kabobs-grill.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (72, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/03/mix-the-sauce.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (73, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/03/cooking-ground-beef.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (74, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/03/draining-the-ground-beef.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (75, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/03/adding-the-sauce.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (76, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/03/Korean-Ground-Beef-served.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (77, N'https://healthyrecipesblogs.com/wp-content/uploads/2022/07/chicken-meatballs-collage-1-2022.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (78, N'https://healthyrecipesblogs.com/wp-content/uploads/2022/07/chicken-meatballs-collage-2-2022.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (79, N'https://healthyrecipesblogs.com/wp-content/uploads/2023/09/cut-ham-steak.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (80, N'https://healthyrecipesblogs.com/wp-content/uploads/2023/09/season-ham-steak.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (81, N'https://healthyrecipesblogs.com/wp-content/uploads/2023/09/flip-ham-steak-in-skillet.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (82, N'https://healthyrecipesblogs.com/wp-content/uploads/2023/09/Serving-Ham-Steak.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (83, N'https://healthyrecipesblogs.com/wp-content/uploads/2021/10/peanut-butter-mug-cake-collage.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (84, N'https://healthyrecipesblogs.com/wp-content/uploads/2023/10/Pork-Stew-cube.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (85, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/03/add-spices.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (86, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/03/add-water.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (87, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/03/add-tomato-sauce-2.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (88, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/03/simmer-the-stew.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (89, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/03/add-spinach-in-batches.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (90, N'https://healthyrecipesblogs.com/wp-content/uploads/2022/06/cucumber-tomato-salad-collage-1.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (91, N'https://healthyrecipesblogs.com/wp-content/uploads/2022/06/cucumber-tomato-salad-collage-2.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (92, N'https://healthyrecipesblogs.com/wp-content/uploads/2021/10/keto-fried-chicken-collage-1.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (93, N'https://healthyrecipesblogs.com/wp-content/uploads/2021/10/keto-fried-chicken-collage-2.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (94, N'https://healthyrecipesblogs.com/wp-content/uploads/2023/10/Sauteed-Shrimp-olive-oil.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (95, N'https://healthyrecipesblogs.com/wp-content/uploads/2023/10/Sauteed-Shrimp-spices.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (96, N'https://healthyrecipesblogs.com/wp-content/uploads/2023/10/Sauteed-Shrimp-mix.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (97, N'https://healthyrecipesblogs.com/wp-content/uploads/2023/10/Sauteed-Shrimp-flip.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (98, N'https://healthyrecipesblogs.com/wp-content/uploads/2023/10/Sauteed-Shrimp-juicy.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (99, N'https://healthyrecipesblogs.com/wp-content/uploads/2023/11/Coleslaw-step-2.jpg')
GO
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (100, N'https://healthyrecipesblogs.com/wp-content/uploads/2023/11/Coleslaw-step-3.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (101, N'https://healthyrecipesblogs.com/wp-content/uploads/2023/11/Coleslaw-step-4.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (102, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/06/add-spices.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (103, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/06/simmer-the-soup.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (104, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/06/soup-served.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (105, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/06/octopus-pieces-bowl.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (106, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/06/adding-olive-oil.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (107, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/06/mixing-the-salad-1.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (108, N'https://healthyrecipesblogs.com/wp-content/uploads/2024/06/salad-is-served.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (109, N'https://healthyrecipesblogs.com/wp-content/uploads/2022/10/Sauteed-mushrooms-liquid-evaporates.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (110, N'https://healthyrecipesblogs.com/wp-content/uploads/2022/09/mushroom-frittata-collage-1.jpg')
INSERT [dbo].[Images] ([image_id], [image_filename]) VALUES (111, N'https://healthyrecipesblogs.com/wp-content/uploads/2022/09/mushroom-frittata-collage-2.jpg')
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
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (10, 2, 400, 1, N'ml', 400, N'2 muỗng canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (11, 4, 0.5, 1, N'gram', 0.5, N'1/8 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (12, 12, 200, 1, N'ml', 200, N'1 muỗng canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (13, 14, 1.3, 1, N'gram', 1.3, N'1/4 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (14, 13, 1.3, 1, N'gram', 1.3, N'1/4 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (15, 11, 100, 1, N'ml', 100, N'1 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (16, 15, 2, 1, N'quả', 2, N'2 quả')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (18, 17, 4, 1, N'dải', 50, N'4 dải')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (19, 19, 170, 1, N'gram', 170, N'2 miếng')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (20, 20, 450, 1, N'gram', 450, N'2 cốc')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (21, 21, 275, 1, N'gram', 275, N'1/2 cốc')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (22, 22, 1, 1, N'quả', 100, N'1 quả')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (23, 23, 56, 1, N'gram', 56, N'2 oz')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (24, 16, 450, 1, N'gram', 450, N'450 gram')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (25, 4, 2.5, 1, N'gram', 2.5, N'1/2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (26, 18, 120, 1, N'ml', 120, N'1/2 cốc')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (27, 24, 7.5, 1, N'ml', 7.5, N'1/2 muỗng canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (28, 25, 7.5, 1, N'ml', 7.5, N'1/2 muỗng canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (29, 4, 1.3, 1, N'gram', 1.3, N'1/4 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (30, 13, 1.3, 1, N'gram', 1.3, N'1/4 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (31, 26, 60, 1, N'gram', 60, N'1/4 cốc')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (32, 27, 60, 1, N'gram', 60, N'1/4 cốc')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (33, 28, 30, 1, N'gram', 30, N'2 thìa canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (34, 30, 5, 1, N'lá', 5, N'5 lá')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (35, 31, 56, 1, N'gram', 56, N'4 miếng')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (36, 22, 60, 1, N'gram', 60, N'1/4 cốc')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (37, 29, 3, 1, N'miếng', 3, N'3 miếng mỏng')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (38, 26, 3, 1, N'miếng', 3, N'3 miếng nhỏ')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (39, 17, 1, 1, N'dải', 1, N'1 dải')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (40, 33, 2, 1, N'quả', 2, N'2 quả')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (41, 34, 15, 1, N'ml', 15, N'1 thìa canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (42, 35, 5, 1, N'gram', 5, N'1 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (43, 36, 120, 1, N'ml', 120, N'1/2 cốc')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (44, 37, 2, 1, N'gram', 2, N'2 muỗng')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (45, 38, 5, 1, N'gram', 5, N'1 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (46, 39, 1, 1, N'bình', 1, N'1 bình')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (47, 40, 2, 1, N'đầu', 2, N'2 đầu')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (48, 41, 1, 1, N'bình', 1, N'1 bình')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (49, 42, 5, 1, N'gram', 5, N'1 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (50, 28, 5, 1, N'gram', 5, N'1 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (51, 13, 2.5, 1, N'gram', 2.5, N'1/2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (52, 14, 5, 1, N'gram', 5, N'1 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (53, 44, 1, 1, N'l', 1, N'1 lít')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (54, 45, 425, 1, N'gram', 425, N'2 hộp')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (55, 4, 5, 1, N'gram', 5, N'1 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (56, 14, 10, 1, N'gram', 10, N'2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (57, 46, 10, 1, N'gram', 10, N'2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (58, 47, 10, 1, N'gram', 10, N'2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (59, 48, 2.5, 1, N'gram', 2.5, N'1/2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (60, 49, 425, 1, N'ml', 425, N'425 mililit')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (61, 2, 30, 1, N'ml', 30, N'2 thìa canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (62, 50, 15, 1, N'ml', 15, N'1 thìa canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (63, 51, 2.5, 1, N'gram', 2.5, N'1/2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (64, 52, 226, 1, N'gram', 226, N'226 gram')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (65, 53, 1, 1, N'quả', 1, N'1 quả')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (66, 54, 0.5, 1, N'củ', 0.5, N'1/2 củ')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (67, 55, 2, 1, N'quả', 2, N'2 quả')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (68, 56, 60, 1, N'ml', 60, N'1/4 cốc')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (69, 57, 15, 1, N'ml', 15, N'1 thìa canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (70, 58, 5, 1, N'gram', 5, N'1 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (71, 62, 2.5, 1, N'gram', 2.5, N'1/2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (72, 2, 30, 1, N'ml', 30, N'2 thìa canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (73, 63, 15, 1, N'gram', 15, N'1 thìa canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (74, 59, 15, 1, N'gram', 15, N'1 thìa canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (75, 61, 15, 1, N'ml', 15, N'1 thìa canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (76, 60, 15, 1, N'gram', 15, N'1 thìa canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (77, 1, 450, 1, N'gram', 450, N'450 gram')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (78, 64, 450, 1, N'gram', 450, N'450 gram')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (79, 14, 5, 1, N'gram', 5, N'1 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (80, 18, 30, 1, N'ml', 30, N'1 thìa canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (81, 42, 5, 1, N'gram', 5, N'1 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (82, 46, 5, 1, N'gram', 5, N'1 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (83, 65, 5, 1, N'gram', 5, N'1 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (84, 2, 60, 1, N'ml', 60, N'4 thìa canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (85, 66, 230, 1, N'gram', 230, N'2 miếng')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (86, 43, 30, 1, N'gram', 30, N'2 thìa canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (87, 67, 1.3, 1, N'gram', 1.3, N'1/4 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (88, 68, 1.3, 1, N'gram', 1.3, N'1/4 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (89, 69, 10, 1, N'ml', 10, N'2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (90, 70, 60, 1, N'ml', 60, N'1/4 cốc')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (91, 33, 1, 1, N'quả', 1, N'1 quả')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (92, 35, 2.5, 1, N'ml', 1, N'1/2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (93, 71, 1.3, 1, N'gram', 1.3, N'1/4 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (94, 2, 30, 1, N'ml', 30, N'2 thìa canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (95, 72, 1.3, 1, N'kilogram', 1.3, N'1.3 kilogram')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (96, 3, 15, 1, N'gram', 15, N'1 thìa canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (97, 67, 5, 1, N'gram', 5, N'1 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (98, 42, 10, 1, N'gram', 10, N'2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (99, 44, 120, 1, N'ml', 120, N'1/2 cốc')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (100, 73, 240, 1, N'ml', 240, N'1 cốc')
GO
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (101, 74, 1, 1, N'cành', 1, N'1 cành')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (102, 58, 15, 1, N'gram', 15, N'1 thìa canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (103, 75, 30, 1, N'gram', 30, N'2 thìa canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (104, 76, 480, 1, N'gram', 480, N'2 cốc')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (105, 21, 240, 1, N'gram', 240, N'1 cốc')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (106, 54, 60, 1, N'gram', 60, N'1/4 cốc')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (107, 79, 60, 1, N'gram', 60, N'1/4 cốc')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (108, 77, 2.5, 1, N'gram', 2.5, N'1/2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (109, 78, 2.5, 1, N'gram', 2.5, N'1/2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (110, 51, 2.5, 1, N'gram', 2.5, N'1/2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (111, 2, 45, 1, N'ml', 45, N'3 thìa canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (112, 25, 15, 1, N'ml', 15, N'1 thìa canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (113, 80, 57, 1, N'gram', 57, N'57 gram')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (114, 14, 5, 1, N'gram', 5, N'1 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (115, 42, 5, 1, N'gram', 5, N'1 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (116, 67, 2.5, 1, N'gram', 2.5, N'1/2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (117, 81, 1, 1, N'kilogram', 1, N'10 cái')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (118, 16, 453, 1, N'gram', 453, N'30 - 40 con')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (119, 42, 7.5, 1, N'gram', 7.5, N'3/2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (120, 65, 2.5, 1, N'gram', 2.5, N'1/2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (121, 67, 2.5, 1, N'gram', 2.5, N'1/2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (122, 68, 1.3, 1, N'gram', 1.3, N'1/4 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (123, 75, 30, 1, N'gram', 30, N'2 thìa canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (124, 18, 120, 1, N'ml', 120, N'1/2 cốc')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (125, 24, 5, 1, N'ml', 5, N'1 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (126, 82, 15, 1, N'ml', 15, N'1 thìa canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (127, 69, 5, 1, N'ml', 5, N'1 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (128, 13, 0.5, 1, N'gram', 0.5, N'1/8 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (129, 83, 2.5, 1, N'gram', 2.5, N'1/2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (130, 84, 1.4, 1, N'kilogram', 1.4, N'6 cốc')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (131, 2, 15, 1, N'ml', 15, N'1 thìa canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (132, 90, 226, 1, N'gram', 226, N'1 củ')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (133, 85, 480, 1, N'gram', 480, N'2 cốc')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (134, 91, 480, 1, N'gram', 480, N'2 cốc')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (135, 1, 450, 1, N'gram', 450, N'450 gram')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (136, 13, 2.5, 1, N'gram', 2.5, N'1/2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (137, 51, 5, 1, N'gram', 5, N'1 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (138, 86, 2.5, 1, N'gram', 2.5, N'1/2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (139, 42, 1.3, 1, N'gram', 1.3, N'1/4 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (140, 87, 960, 1, N'ml', 960, N'4 cốc')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (142, 88, 740, 1, N'gram', 740, N'740 gram')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (143, 89, 120, 1, N'gram', 120, N'1/2 cốc')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (144, 92, 340, 1, N'gram', 340, NULL)
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (145, 93, 120, 1, N'gram', 120, N'1/2 cốc')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (146, 79, 120, 1, N'gram', 120, N'1/2 cốc')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (147, 94, 1, 1, N'tép', 2, N'1 tép')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (148, 51, 1.3, 1, N'gram', 1.3, N'1/4 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (149, 95, 450, 1, N'gram', 450, N'450 gram')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (150, 96, 60, 1, N'ml', 60, N'1/4 cốc')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (151, 33, 8, 1, N'quả', 8, N'8 quả')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (152, 77, 1.3, 1, N'gram', 1.3, N'1/4 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (153, 67, 1.3, 1, N'gram', 1.3, N'1/4 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (154, 60, 120, 1, N'gram', 120, N'1/2 cốc')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (155, 98, 225, 1, N'gram', 225, N'225 gram')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (156, 97, 425, 1, N'gram', 425, N'425 gram')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (157, 43, 200, 1, N'gram', 200, N'200 gram')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (158, 33, 4, 1, N'quả', 4, N'4 quả')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (159, 99, 200, 1, N'gram', 200, N'200 gram')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (160, 36, 140, 1, N'gram', 140, N'140 gram')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (161, 100, 50, 1, N'gram', 50, N'50 gram')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (162, 101, 15, 1, N'ml', 15, N'1 thìa canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (163, 26, 1, 1, N'củ', 1, N'1 củ')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (164, 102, 3, 1, N'chiếc', 3, N'3 chiếc')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (165, 103, 1, 1, N'quả', 1, N'1 quả')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (166, 94, 3, 1, N'tép', 3, N'3 tép')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (167, 105, 2, 1, N'quả', 2, N'2 quả')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (169, 106, 200, 1, N'gram', 200, N'200 gram')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (170, 44, 1.5, 1, N'l', 1.5, N'1.5 lít')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (171, 107, 30, 1, N'ml', 30, N'2 thìa canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (172, 113, 500, 1, N'gram', 500, N'500 gram')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (173, 43, 15, 1, N'gram', 15, N'1 thìa canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (174, 90, 1, 1, N'củ', 1, N'1 củ')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (175, 94, 2, 1, N'tép', 2, N'2 tép')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (176, 114, 1, 1, N'miếng', 1, N'1 miếng')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (177, 42, 1.3, 1, N'gram', 1.3, N'1/4 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (178, 108, 5, 1, N'gram', 5, N'1 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (179, 28, 10, 1, N'gram', 10, N'2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (180, 109, 15, 1, N'gram', 15, N'3 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (181, 88, 400, 1, N'gram', 400, N'400 gram')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (182, 87, 300, 1, N'ml', 300, N'300 ml')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (183, 110, 5, 1, N'gram', 5, N'1 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (184, 111, 10, 1, N'gram', 10, N'2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (185, 112, 10, 1, N'gram', 10, N'2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (186, 115, 760, 1, N'gram', 760, N'4 miếng')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (187, 116, 125, 1, N'gram', 125, N'125 gram')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (189, 118, 1, 1, N'quả', 1, N'1 quả')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (190, 3, 2, 1, N'tép', 2, N'2 tép')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (191, 119, 15, 1, N'ml', 15, N'1 thìa canh')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (192, 122, 2.5, 1, N'gram', 2.5, N'1/2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (193, 2, 5, 1, N'ml', 5, N'1 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (194, 22, 2, 1, N'quả', 2, N'2 quả')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (195, 25, 10, 1, N'ml', 10, N'2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (196, 29, 4, 1, N'quả', 4, N'4 quả')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (197, 28, 20, 1, N'gram', 20, N'20 gram')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (198, 43, 75, 1, N'gram', 75, N'75 gram')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (199, 90, 1, 1, N'củ', 1, N'1 củ')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (200, 123, 3, 1, N'lõi', 3, N'3 lõi')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (201, 124, 125, 1, N'ml', 125, N'125 ml')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (202, 125, 30, 1, N'gram', 30, N'30 gram')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (203, 126, 250, 1, N'gram', 250, N'250 gram')
GO
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (204, 127, 150, 1, N'ml', 150, N'150 ml')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (205, 128, 10, 1, N'ml', 10, N'2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (206, 129, 10, 1, N'gram', 10, N'2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (207, 141, 5, 1, N'gram', 5, N'1 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (208, 143, 5, 1, N'gram', 5, N'1 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (210, 142, 5, 1, N'gram', 5, N'1 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (211, 46, 5, 1, N'gram', 5, N'1 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (212, 14, 5, 1, N'gram', 5, N'1 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (213, 131, 40, 1, N'gram', 40, N'40 gram')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (214, 132, 1.5, 1, N'l', 1.5, N'1.5 lít')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (215, 130, 160, 1, N'gram', 160, N'160 gram')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (216, 90, 1, 1, N'củ', 1, N'1 củ')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (217, 3, 3, 1, N'củ', 3, N'3 củ')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (218, 28, 15, 1, N'gram', 15, N'15 gram')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (219, 133, 300, 1, N'gram', 300, N'300 gram')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (220, 134, 350, 1, N'gram', 350, N'350 gram')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (221, 101, 30, 1, N'ml', 30, N'1 cốc')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (222, 144, 10, 1, N'gram', 10, N'2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (223, 141, 10, 1, N'gram', 10, N'2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (224, 51, 10, 1, N'gram', 10, N'2 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (225, 13, 15, 1, N'gram', 15, N'3 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (226, 137, 15, 1, N'gram', 15, N'3 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (227, 122, 15, 1, N'gram', 15, N'3 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (228, 140, 15, 1, N'gram', 15, N'3 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (229, 143, 15, 1, N'gram', 15, N'3 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (230, 145, 20, 1, N'gram', 20, N'4 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (231, 138, 5, 1, N'gram', 5, N'1 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (232, 139, 200, 1, N'gram', 200, N'200 gram')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (233, 90, 2, 1, N'củ', 2, N'2 củ')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (234, 3, 2, 1, N'tép', 2, N'2 tép')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (235, 111, 5, 1, N'gram', 5, N'1 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (236, 108, 5, 1, N'gram', 5, N'1 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (237, 28, 5, 1, N'gram', 5, N'1 muỗng cà phê')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (238, 146, 400, 1, N'gram', 400, N'400 gram')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (239, 147, 400, 1, N'ml', 400, N'400 ml')
INSERT [dbo].[Ingredient_Serving_Sizes] ([serving_size_id], [ingredient_id], [qty], [scale], [units], [grams], [description]) VALUES (240, 29, 2, 1, N'quả', 2, N'2 quả lớn')
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
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (11, N'Dầu bơ sốt mayonnaise', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (12, N'Giấm rượu vang đỏ', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (13, N'Tiêu đen', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (14, N'Bột tỏi', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (15, N'Trứng luộc', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (16, N'Tôm sống', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (17, N'Thịt xông khói nấu chín', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (18, N'Mayonaise', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (19, N'Ức gà nướng', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (20, N'Rau xanh', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (21, N'Cà chua bi', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (22, N'Quả bơ', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (23, N'Phô mai vụn', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (24, N'Mù tạt Dijon', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (25, N'Nước chanh tươi', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (26, N'Hành đỏ', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (27, N'Cần tây', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (28, N'Rau mùi', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (29, N'Cà chua', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (30, N'Lá xà lách', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (31, N'Thịt giăm bông', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (32, N'Phô mai Thụy Sĩ', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (33, N'Trứng', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (34, N'Tinh dầu vanilla', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (35, N'Stevia Glycerite', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (36, N'Sữa chua Hy Lạp', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (37, N'Bột Whey Protein', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (38, N'Bột nở', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (39, N'Bình xịt nấu ăn', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (40, N'Súp lơ', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (41, N'Bình xịt dầu oliu', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (42, N'Ớt bột', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (43, N'Bơ nấu ăn', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (44, N'Nước luộc gà', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (45, N'Bí ngô nghiền nhuyễn', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (46, N'Bột hành', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (47, N'Bột cà ri', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (48, N'Gừng xay', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (49, N'Nước cốt dừa', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (50, N'Giấm balsamic', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (51, N'Lá oregano khô', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (52, N'Nấm', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (53, N'Ớt chuông xanh', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (54, N'Củ hành tím', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (55, N'Bí xanh', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (56, N'Xì dầu', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (57, N'Mật ong', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (58, N'Bột ngô', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (59, N'Gừng tươi', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (60, N'Hành lá', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (61, N'Dầu mè', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (62, N'Ớt chuông đỏ', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (63, N'Dầu bơ', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (64, N'Thịt gà xay', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (65, N'Thì là xay', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (66, N'Thịt giăm bông', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (67, N'Húng tây khô', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (68, N'Ớt cayenne', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (69, N'Si rô phong', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (70, N'Bơ đậu phộng', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (71, N'Baking soda', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (72, N'Thịt lợn thăn', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (73, N'Sốt cà chua', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (74, N'Lá nguyệt quế khô', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (75, N'Rau mùi tây', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (76, N'Dưa chuột', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (77, N'Muối biển', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (78, N'Hạt tỏi', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (79, N'Rau ngò', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (80, N'Bì lợn', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (81, N'Đùi gà', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (82, N'Giấm táo', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (83, N'Hạt cần tây xay', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (84, N'Hỗn hợp xà lách trộn', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (85, N'Cà rốt', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (86, N'Hương thảo khô', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (87, N'Nước súp bò', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (88, N'Cà chua xắt nhỏ Pomi', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (89, N'Phô mai Parmesan bào', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (90, N'Hành tây', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (91, N'Rau cần tây', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (92, N'Xúc tu bạch tuộc đã nấu chín', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (93, N'Quả ô liu', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (94, N'Tỏi băm', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (95, N'Nấm thái lát', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (96, N'Kem chua', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (97, N'Xoài cắt lát ngâm nước si-rô, để ráo nước', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (98, N'Đường vàng', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (99, N'Bột nở', 1)
GO
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (100, N'Dừa sấy', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (101, N'Dầu thực vật', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (102, N'Xúc xích', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (103, N'Ớt đỏ tươi', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (104, N'Bông cải xanh', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (105, N'Bí xanh', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (106, N'Mỳ ống nhỏ', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (107, N'Dầu ăn', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (108, N'Nghệ', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (109, N'Bạch đậu khấu', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (110, N'Đường', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (111, N'Garam Masala', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (112, N'Double cream', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (113, N'Bít tết thái nhỏ', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (114, N'Gừng', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (115, N'Ức gà không da', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (116, N'Sốt cà chua kiểu Ý', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (118, N'Quả dátil Medjool', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (119, N'Giấm balsamic', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (121, N'Ớt chuông vàng', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (122, N'Bột mù tạt', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (123, N'Lõi ngô', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (124, N'Single cream', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (125, N'Phô mai mozzarella', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (126, N'Đậu phụ', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (127, N'Sữa đậu nành không đường', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (128, N'Tương miso', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (129, N'Cao lên men', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (130, N'Gluten từ lúa mì', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (131, N'Bột protein thực vật', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (132, N'Nước dùng rau củ', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (133, N'Bột đậu', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (134, N'Bột mì', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (135, N'Bột gừng', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (136, N'Muối cần tây', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (137, N'Tiêu trắng', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (138, N'Đường nâu', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (139, N'Bánh mì khô dạng vảy', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (140, N'Ớt paprika', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (141, N'Húng tây khô', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (142, N'Ngò tây khô', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (143, N'Thì là khô', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (144, N'Húng thì khô', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (145, N'Bột tỏi khô', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (146, N'Cà chua mận đóng hộp', 1)
INSERT [dbo].[Ingredients] ([ingredient_id], [name], [image_id]) VALUES (147, N'Đậu xanh đóng hộp', 1)
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
INSERT [dbo].[Recipe_Allergies] ([recipe_allergy_id], [recipe_id], [allergy_id]) VALUES (7, 8, 6)
INSERT [dbo].[Recipe_Allergies] ([recipe_allergy_id], [recipe_id], [allergy_id]) VALUES (8, 9, 4)
INSERT [dbo].[Recipe_Allergies] ([recipe_allergy_id], [recipe_id], [allergy_id]) VALUES (9, 10, 2)
INSERT [dbo].[Recipe_Allergies] ([recipe_allergy_id], [recipe_id], [allergy_id]) VALUES (10, 11, 4)
INSERT [dbo].[Recipe_Allergies] ([recipe_allergy_id], [recipe_id], [allergy_id]) VALUES (11, 15, 5)
INSERT [dbo].[Recipe_Allergies] ([recipe_allergy_id], [recipe_id], [allergy_id]) VALUES (12, 17, 2)
INSERT [dbo].[Recipe_Allergies] ([recipe_allergy_id], [recipe_id], [allergy_id]) VALUES (13, 18, 1)
INSERT [dbo].[Recipe_Allergies] ([recipe_allergy_id], [recipe_id], [allergy_id]) VALUES (14, 21, 6)
INSERT [dbo].[Recipe_Allergies] ([recipe_allergy_id], [recipe_id], [allergy_id]) VALUES (15, 22, 4)
INSERT [dbo].[Recipe_Allergies] ([recipe_allergy_id], [recipe_id], [allergy_id]) VALUES (16, 24, 2)
INSERT [dbo].[Recipe_Allergies] ([recipe_allergy_id], [recipe_id], [allergy_id]) VALUES (17, 25, 2)
INSERT [dbo].[Recipe_Allergies] ([recipe_allergy_id], [recipe_id], [allergy_id]) VALUES (18, 26, 2)
INSERT [dbo].[Recipe_Allergies] ([recipe_allergy_id], [recipe_id], [allergy_id]) VALUES (19, 26, 6)
INSERT [dbo].[Recipe_Allergies] ([recipe_allergy_id], [recipe_id], [allergy_id]) VALUES (20, 27, 2)
INSERT [dbo].[Recipe_Allergies] ([recipe_allergy_id], [recipe_id], [allergy_id]) VALUES (21, 28, 3)
INSERT [dbo].[Recipe_Allergies] ([recipe_allergy_id], [recipe_id], [allergy_id]) VALUES (22, 29, 6)
INSERT [dbo].[Recipe_Allergies] ([recipe_allergy_id], [recipe_id], [allergy_id]) VALUES (23, 31, 6)
INSERT [dbo].[Recipe_Allergies] ([recipe_allergy_id], [recipe_id], [allergy_id]) VALUES (24, 31, 2)
INSERT [dbo].[Recipe_Allergies] ([recipe_allergy_id], [recipe_id], [allergy_id]) VALUES (25, 32, 2)
INSERT [dbo].[Recipe_Allergies] ([recipe_allergy_id], [recipe_id], [allergy_id]) VALUES (26, 32, 5)
INSERT [dbo].[Recipe_Allergies] ([recipe_allergy_id], [recipe_id], [allergy_id]) VALUES (27, 32, 3)
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
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (11, 8, 2, 10)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (13, 8, 4, 11)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (14, 8, 12, 12)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (15, 8, 13, 14)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (16, 8, 14, 13)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (17, 8, 11, 15)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (19, 8, 15, 16)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (21, 8, 17, 18)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (22, 8, 19, 19)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (23, 8, 20, 20)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (24, 8, 21, 21)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (25, 8, 22, 22)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (26, 8, 23, 23)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (27, 9, 16, 24)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (28, 9, 4, 25)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (29, 9, 18, 26)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (30, 9, 24, 27)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (31, 9, 25, 28)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (32, 9, 4, 29)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (33, 9, 13, 30)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (34, 9, 26, 31)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (35, 9, 27, 32)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (36, 9, 28, 33)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (37, 10, 29, 34)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (38, 10, 30, 35)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (39, 10, 22, 36)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (40, 10, 29, 37)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (41, 10, 26, 38)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (42, 10, 17, 39)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (43, 11, 33, 40)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (44, 11, 34, 41)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (45, 11, 35, 42)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (46, 11, 36, 43)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (47, 11, 37, 44)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (48, 11, 38, 45)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (49, 11, 39, 46)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (50, 12, 40, 47)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (51, 12, 41, 48)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (52, 12, 42, 49)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (53, 12, 28, 50)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (54, 12, 13, 51)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (55, 12, 13, 52)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (56, 12, 4, 4)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (57, 13, 44, 53)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (58, 13, 45, 54)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (59, 13, 4, 55)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (60, 13, 13, 51)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (61, 13, 14, 56)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (62, 13, 46, 57)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (63, 13, 47, 58)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (64, 13, 48, 59)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (65, 13, 49, 60)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (66, 14, 2, 61)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (67, 14, 50, 62)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (68, 14, 4, 4)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (69, 14, 13, 51)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (70, 14, 14, 56)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (71, 14, 51, 63)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (72, 14, 52, 64)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (73, 14, 53, 65)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (74, 14, 54, 66)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (75, 14, 55, 67)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (76, 15, 56, 68)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (77, 15, 57, 69)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (78, 15, 58, 70)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (79, 15, 61, 75)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (80, 15, 63, 73)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (81, 15, 1, 77)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (82, 15, 2, 72)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (83, 15, 60, 76)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (84, 15, 59, 74)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (85, 15, 62, 71)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (86, 16, 64, 78)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (87, 16, 14, 79)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (88, 16, 18, 80)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (89, 16, 42, 81)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (90, 16, 46, 82)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (91, 16, 65, 83)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (92, 16, 2, 84)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (93, 16, 13, 29)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (94, 17, 66, 85)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (95, 17, 43, 86)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (96, 17, 67, 87)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (97, 17, 14, 13)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (98, 17, 68, 88)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (99, 17, 69, 89)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (100, 18, 70, 90)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (101, 18, 33, 91)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (102, 18, 35, 92)
GO
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (103, 18, 71, 93)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (104, 19, 2, 94)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (105, 19, 72, 95)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (106, 19, 3, 96)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (107, 19, 67, 97)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (108, 19, 42, 98)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (109, 19, 44, 99)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (110, 19, 73, 100)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (111, 19, 74, 101)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (112, 19, 58, 102)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (113, 19, 75, 103)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (114, 20, 76, 104)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (115, 20, 21, 105)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (116, 20, 54, 106)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (117, 20, 79, 107)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (118, 20, 77, 108)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (119, 20, 78, 109)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (120, 20, 13, 14)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (121, 20, 51, 110)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (122, 20, 2, 111)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (123, 20, 25, 112)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (125, 21, 80, 113)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (126, 21, 14, 114)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (127, 21, 13, 14)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (128, 21, 42, 115)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (129, 21, 67, 116)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (130, 21, 81, 117)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (131, 22, 16, 118)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (132, 22, 42, 119)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (133, 22, 4, 4)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (134, 22, 13, 14)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (135, 22, 65, 120)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (136, 22, 67, 121)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (137, 22, 68, 122)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (138, 22, 75, 123)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (139, 22, 2, 111)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (140, 23, 4, 29)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (141, 23, 18, 124)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (142, 23, 24, 125)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (143, 23, 82, 126)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (144, 23, 69, 127)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (145, 23, 13, 128)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (146, 23, 83, 129)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (147, 23, 84, 130)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (148, 24, 2, 131)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (149, 24, 90, 132)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (150, 24, 85, 133)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (151, 24, 91, 134)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (152, 24, 1, 135)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (153, 24, 13, 136)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (154, 24, 51, 137)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (155, 24, 86, 138)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (156, 24, 42, 139)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (157, 24, 87, 140)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (158, 24, 3, 96)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (159, 24, 74, 101)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (160, 24, 88, 142)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (161, 24, 89, 143)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (162, 25, 92, 144)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (163, 25, 93, 145)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (164, 25, 79, 146)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (165, 25, 21, 21)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (166, 25, 4, 29)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (167, 25, 13, 14)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (168, 25, 25, 112)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (169, 25, 94, 147)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (170, 25, 51, 148)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (171, 25, 2, 111)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (172, 26, 2, 94)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (173, 26, 95, 149)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (174, 26, 96, 150)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (175, 26, 33, 151)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (176, 26, 77, 152)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (177, 26, 67, 153)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (178, 26, 13, 14)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (179, 26, 60, 154)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (180, 26, 89, 143)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (181, 26, 41, 48)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (182, 27, 97, 156)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (183, 27, 43, 157)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (184, 27, 98, 155)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (185, 27, 33, 158)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (186, 27, 99, 159)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (187, 27, 36, 160)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (188, 27, 100, 161)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (189, 28, 101, 162)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (190, 28, 26, 163)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (191, 28, 102, 164)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (192, 28, 103, 165)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (193, 28, 94, 166)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (194, 28, 105, 167)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (196, 28, 106, 169)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (197, 28, 44, 170)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (198, 29, 107, 171)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (199, 29, 113, 172)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (200, 29, 43, 173)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (201, 29, 90, 174)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (202, 29, 94, 174)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (203, 29, 114, 176)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (204, 29, 42, 177)
GO
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (206, 29, 108, 178)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (207, 29, 28, 179)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (208, 29, 109, 180)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (209, 29, 88, 181)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (210, 29, 87, 182)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (211, 29, 110, 183)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (212, 29, 111, 184)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (213, 29, 112, 185)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (214, 30, 115, 186)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (215, 30, 116, 187)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (216, 30, 118, 189)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (217, 30, 3, 190)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (218, 30, 119, 191)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (219, 30, 42, 49)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (220, 30, 122, 192)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (221, 30, 2, 193)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (222, 30, 22, 194)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (223, 30, 25, 195)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (225, 30, 29, 196)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (226, 30, 28, 197)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (227, 30, 26, 163)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (228, 31, 43, 198)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (229, 31, 90, 199)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (230, 31, 110, 183)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (231, 31, 123, 200)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (232, 31, 124, 201)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (233, 31, 125, 202)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (235, 32, 126, 203)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (236, 32, 127, 204)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (237, 32, 128, 205)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (238, 32, 129, 206)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (239, 32, 141, 207)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (240, 32, 143, 208)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (241, 32, 142, 210)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (242, 32, 46, 211)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (243, 32, 14, 212)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (244, 32, 131, 213)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (245, 32, 132, 214)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (246, 32, 130, 215)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (247, 32, 90, 216)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (248, 32, 3, 217)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (249, 32, 28, 218)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (250, 32, 133, 219)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (251, 32, 134, 220)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (252, 32, 101, 221)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (253, 32, 144, 222)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (254, 32, 141, 223)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (255, 32, 51, 224)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (256, 32, 13, 225)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (257, 32, 137, 226)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (258, 32, 122, 227)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (259, 32, 140, 228)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (260, 32, 143, 229)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (261, 32, 145, 230)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (262, 32, 138, 231)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (263, 32, 139, 232)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (264, 33, 2, 2)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (265, 33, 90, 233)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (266, 33, 3, 234)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (267, 33, 111, 235)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (268, 33, 108, 236)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (269, 33, 28, 237)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (270, 33, 146, 238)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (271, 33, 147, 239)
INSERT [dbo].[Recipe_Ingredients] ([recipe_ingredient_id], [recipe_id], [ingredient_id], [serving_size_id]) VALUES (272, 33, 29, 240)
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
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (7, N'Đùi gà nướng', 4, 40, 10, N'Đùi gà nướng thơm ngon', 8, 1)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (8, N'Salad Gà Cobb', 4, 15, 15, N'Món salad gà Cobb thơm ngon ăn kèm với dầu giấm tự làm đơn giản', 2, 1)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (9, N'Salad tôm sốt kem', 4, 10, 15, N'Món salad tôm sốt kem này là bữa trưa hoàn hảo và tạo nên một bữa tối tuyệt vời trong mùa hè.', 9, 1)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (10, N'Bánh kẹp rau xà lách', 1, 15, 15, N'Bánh sandwich rau diếp quả là một phát minh thông minh! Đó là bữa trưa keto và nhạt hoàn hảo. Ai cần bánh mì khi bạn có thể bọc nhân bánh sandwich của mình bằng thứ gì đó ngon hơn nhiều?', 7, 5)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (11, N'Bánh kếp protein', 2, 10, 10, N'Những chiếc bánh bông xốp protein này được làm bằng sáu nguyên liệu đơn giản, bao gồm bột protein và sữa chua Hy Lạp.', 10, 4)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (12, N'Bít tết súp lơ', 4, 30, 10, N'Những miếng bít tết súp lơ dày này rất ngon, được tẩm ướp vừa miệng và vừa miệng.', 11, 2)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (13, N'Súp cà ri bí ngô', 8, 20, 10, N'Món súp cà ri bí ngô đầy hương vị này được nêm tỏi, gừng và bột cà ri. Nước cốt dừa làm cho món ăn thêm đậm đà và béo ngậy!', 13, 1)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (14, N'Xiên rau củ nướng', 6, 20, 10, N'Món xiên rau củ nướng là món ăn cổ điển của mùa hè, nhưng bạn có thể làm chúng quanh năm trên bếp nướng trong nhà.', 12, 2)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (15, N'Thịt bò xay Hàn Quốc', 4, 10, 10, N'Món thịt bò xay Hàn Quốc đầy hương vị này được phục vụ cùng cơm súp lơ.', 14, 1)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (16, N'Thịt gà viên', 4, 10, 15, N'Những viên thịt gà tẩm gia vị và hương vị tuyệt vời này sẽ sẵn sàng trong vòng chưa đầy 30 phút.', 15, 1)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (17, N'Bít tết giăm bông', 4, 10, 5, N'Bít tết giăm bông là một trong những bữa tối dễ dàng nhất mà bạn có thể làm. Sẵn sàng trong khoảng 15 phút, thật đơn giản và ngon miệng.', 17, 1)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (18, N'Bánh cốc bơ đậu phộng', 1, 1, 5, N'Món bánh cốc bơ đậu phộng keto tuyệt vời này được làm không cần bột mì - chỉ có bơ đậu phộng, trứng, baking soda và chất làm ngọt.', 16, 5)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (19, N'Thịt lợn hầm nhanh', 4, 20, 20, N'Món thịt lợn hầm thơm và đậm đà này rất hoàn hảo cho những đêm đông lạnh giá và rất dễ làm.', 18, 1)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (20, N'Salad cà chua dưa chuột', 3, 15, 15, N'Món salad cà chua dưa chuột có hương vị vô cùng thơm ngon và tươi mát này là món ăn phụ hoàn hảo trong mùa hè và là cứu cánh trong những tháng không thể tưởng tượng nổi việc bật lò nướng.', 19, 2)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (21, N'Gà rán Keto', 5, 40, 20, N'Giòn bên ngoài và ngon ngọt bên trong, gà rán keto được phủ một lớp bì lợn nghiền nát, sau đó nướng trong lò để tạo độ giòn hoàn hảo.', 21, 5)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (22, N'Tôm xào', 3, 10, 10, N'Được phủ trong dầu ô liu và nhiều gia vị, những con tôm xào đầy hương vị này sẽ sẵn sàng trong vòng chưa đầy 20 phút.', 22, 1)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (23, N'Xà lách trộn tự làm', 4, 60, 10, N'Là món ăn cổ điển của mùa hè, món xà lách trộn tự làm này sẽ sẵn sàng sau 10 phút. Đây là món ăn kèm hoàn hảo cho bánh mì kẹp thịt, thịt lợn hoặc thịt gà kéo và đồ nướng.', 20, 2)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (24, N'Súp thịt bò và rau củ', 2, 30, 20, N'Món súp thịt bò rau thơm đầy hương vị này tạo nên sự khởi đầu thoải mái cho bữa ăn mùa đông và đủ thịnh soạn để được phục vụ như một món chính làm no bụng.', 23, 1)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (25, N'Salad bạch tuộc', 3, 20, 15, N'Món khai vị hoàn hảo cho mùa hè, món salad bạch tuộc này mang hương vị Địa Trung Hải.', 25, 1)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (26, N'Trứng nướng với nấm', 2, 30, 20, N'Món trứng nướng với nấm rất thơm này không chứa gluten.', 24, 5)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (27, N'Bánh bông lan dừa xoài', 4, 30, 20, N'Bánh bông lan nướng khay tiết kiệm này sử dụng trái cây đóng hộp và sữa chua dừa. Cắt thành hình vuông và phục vụ trong bữa tiệc hoặc bán bánh', 26, 1)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (28, N'Súp Minestrone với xúc xích và rau cải xoăn', 4, 40, 10, N'Sử dụng bất kỳ hình dạng mì ống nhỏ nào mà bạn yêu thích cho bát súp minestrone thoải mái này - chỉ cần sửa đổi thời gian nấu theo hướng dẫn trên bao bì', 27, 1)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (29, N'Cà ri bò', 4, 120, 20, N'Hãy làm món cà ri thịt bò dễ dàng của chúng tôi và dùng kèm với một miếng bánh mì naan để thưởng thức các loại nước ép thơm ngon. Nếu thích ăn ít cay thì cho ít ớt bột vào', 28, 1)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (30, N'Gà nướng BBQ', 2, 18, 12, N'Phủ ức gà không da trong lớp men nướng ít đường của chúng tôi để có một bữa ăn mùa hè bổ dưỡng, đáng yêu để ăn ngoài trời. Thưởng thức với salad bơ và cà chua bên cạnh', 29, 5)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (31, N'Ngô sốt kem', 4, 20, 10, N'Món ăn kèm ngon nhất ở Hoa Kỳ, hỗn hợp kem, phô mai gây nghiện này phù hợp với hầu hết mọi thứ, nhưng đặc biệt hợp với các món nướng', 30, 2)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (32, N'Gà rán chay', 6, 50, 45, N'Sử dụng đậu phụ để làm món ‘gà’ chiên giòn gây nghiện này. Hãy thử món ăn thuần chay thơm ngon này với sốt BBQ hoặc bánh mì với salad hoặc xà lách trộn', 31, 2)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (33, N'Cà ri cà chua đậu xanh', 4, 45, 10, N'Bạn muốn sử dụng hết những chiếc lon đang làm bừa bộn tủ của mình? Món cà ri đậu xanh thơm ngon này được thực hiện theo bốn bước đơn giản và được tính là ba trong số năm bước một ngày của bạn.', 32, 5)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (34, N'Gà Masala Bơ', 6, 50, 45, N'Hãy đổi món ăn mang về thông thường của bạn bằng món gà bơ tự làm (gà makhani). Món ăn được làm thành hai phần, kết hợp gà tandoori với nước sốt bơ béo ngậy', 33, 5)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (35, N'Gà Parmesan truyền thống', 4, 30, 40, N'Làm cho giữa tuần trở nên dễ dàng hơn với món gà parmagiana thân thiện với gia đình của chúng tôi. Lý tưởng để đông lạnh cho những đêm bận rộn trong tuần, công thức cũng dễ dàng tăng gấp đôi', 34, 4)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (36, N'Gà viên', 4, 15, 20, N'Những món gà viên tự làm này chắc chắn sẽ làm hài lòng cả gia đình', 37, 4)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (37, N'Khoai tây nghiền', 6, 15, 10, N'Hãy làm hỗn hợp nghiền mịn và mượt này để có mặt hoàn hảo. Nó kết hợp các sự thay thế thông minh để giảm chất béo và calo, trong khi vẫn giữ được chất kem dễ chịu.', 35, 2)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (38, N'Khoai tây nướng giòn', 8, 85, 10, N'Hãy biến khoai tây sũng nước thành quá khứ với công thức thông minh này. Bạn sẽ có được những chiếc bánh nướng có lớp giữa mềm mịn và bề ngoài vàng óng, giòn', 36, 2)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (39, N'Vịt luộc bắp cải khoai tây', 1, 50, 10, N'Hãy tự thưởng cho mình bữa tối một mình với Barney Desmazery - với phần thưởng thêm là không phải rửa bát', 38, 1)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (40, N'Cơm chiên tôm', 4, 25, 5, N'Làm món ăn đơn giản lấy cảm hứng từ châu Á này chỉ trong 30 phút. Món này tốt cho sức khỏe và ít calo nhưng lại có hương vị đậm đà, khiến món ăn này trở nên hoàn hảo cho bữa tối nhanh chóng của gia đình', 39, 1)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (41, N'Nước ép lựu nghiền', 1, 10, 5, N'Chăm sóc tất cả các vị khách trong bữa tiệc của bạn, kể cả những người không uống rượu với nước ép trái cây có gia vị Giáng sinh không cồn đơn giản được phục vụ ấm áp này', 40, 5)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (42, N'Ớt thuần chay', 4, 45, 15, N'Công thức ớt thuần chay tốt cho sức khỏe của chúng tôi chứa nhiều loại rau và không hề thiếu hương vị. Ăn kèm với cơm hoặc khoai tây bọc ngoài để có bữa tối no nê', 42, 2)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (43, N'Súp cà chua', 4, 90, 15, N'Món súp thuần chay ấm áp này được làm bằng cà chua chín, mọng nước, vào mùa vào khoảng tháng 9. Đó là một công thức dễ làm và ăn được quanh năm', 41, 2)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (44, N'Trà bạc hà', 2, 5, 10, N'Trà bạc hà tươi rất dễ làm! Bạn không cần túi trà - chỉ cần đổ nước nóng lên lá bạc hà tươi.', 43, 2)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (45, N'Trà đá', 8, 0, 10, N'Trà đá là một trong những đồ uống giải khát nhất mà bạn có thể thưởng thức trong mùa hè. Nó lạnh tuyệt vời và có hương vị sâu sắc.', 44, 1)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (46, N'Cá chiên Keto', 4, 15, 15, N'Món cá chiên keto thơm ngon này được phủ một lớp bột hạnh nhân, sau đó nấu trong dầu bơ cho đến khi nóng và giòn.', 45, 1)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (47, N'Cá Mappas', 4, 20, 15, N'Món cà ri cá dừa, phổ biến ở bang Kerala miền nam Ấn Độ - sử dụng cá minh thái hoặc bất kỳ phi lê cá trắng có nguồn gốc bền vững nào khác', 46, 1)
INSERT [dbo].[Recipes] ([recipe_id], [recipe_name], [servings], [cook_time], [prep_time], [description], [image_id], [menu_id]) VALUES (48, N'Khoai lang nghiền', 4, 10, 10, N'Công thức làm khoai lang nghiền dễ dàng này sử dụng bơ, xi-rô cây thích và quế để tăng hương vị ngọt tự nhiên của khoai tây.', 47, 1)
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
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (24, 8, 1, N'Bắt đầu bằng cách trộn các nguyên liệu làm nước sốt cho đến khi chúng nhũ hóa thành nước sốt salad mịn, mượt.', 3)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (25, 8, 2, N'Tiếp theo, sắp xếp các loại rau salad lên đĩa lớn.', 4)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (27, 8, 3, N'Xếp các nguyên liệu còn lại lên trên rau xanh. Bạn có thể sắp xếp chúng theo bất kỳ thứ tự nào bạn thích.', 5)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (28, 8, 4, N'Bước cuối cùng là rưới nước sốt lên salad và thưởng thức.', 6)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (29, 9, 1, N'Đầu tiên, luộc tôm một thời gian ngắn cho đến khi có màu hồng và đục. Chuyển chúng vào một cái bát chứa đầy nước lạnh. Điều này sẽ dừng quá trình nấu và giúp làm lạnh chúng.', 48)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (30, 9, 2, N'Trong tô salad, trộn đều các nguyên liệu làm nước sốt.', 49)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (31, 9, 3, N'Thêm tôm nấu chín, hành tím, cần tây và ngò vào nước sốt.', 50)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (32, 9, 4, N'Trộn nhẹ nhàng, sau đó phục vụ.', 51)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (33, 10, 1, N'Xếp các lá rau diếp của bạn sao cho có đường viền 1 inch xung quanh chúng trên giấy da. Thêm topping theo thứ tự', 52)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (34, 10, 2, N'Sau khi cho nhân vào, bạn dùng giấy da để hướng dẫn khi cuộn màng bọc, giống như cách bạn sử dụng thảm lót sushi khi cuộn sushi.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (35, 10, 3, N'Bắt đầu cuộn càng chặt càng tốt bằng giấy da. Sau mỗi lần cuộn, hãy nhấc giấy da lên lại - bạn sẽ không muốn cuộn nó vào bánh sandwich. Sau đó đưa nó trở lại và tiếp tục lăn.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (36, 10, 4, N'Khi bánh sandwich đã được cuộn hoàn toàn, hãy quấn chặt giấy da quanh bánh. Cắt màng bọc thành hai nửa bằng dao.', 53)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (37, 11, 1, N'Đánh trứng, vani, stevia và sữa chua Hy Lạp.', 54)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (38, 11, 2, N'Đánh đều bột protein. Đánh đều và kiên nhẫn cho đến khi mịn hoàn toàn và không bị vón cục, sau đó cho bột nở vào.', 55)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (39, 11, 3, N'Bột protein rất khô, vì vậy tốt nhất nên đo theo trọng lượng, như bạn thấy tôi làm trong ảnh bên dưới chứ không phải theo thể tích.', 56)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (40, 11, 4, N'Đun nóng vỉ nướng hai đầu chống dính trên lửa vừa (không cao hơn). Xịt nó bằng dầu. Sử dụng muỗng bánh quy 1,5 muỗng canh, đổ sáu đến tám khối bột vào vỉ nướng (hoặc sử dụng chảo chống dính lớn 12 inch và nấu ba hoặc bốn chiếc bánh cùng một lúc).', 57)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (41, 11, 5, N'Nấu bánh kếp trên lửa vừa cho đến khi nổi bong bóng trên mặt, một phút hoặc thậm chí ít hơn. Lật và nấu chúng chỉ trong vài giây nữa.', 58)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (42, 11, 6, N'Lấy bánh ra đĩa, thêm mỡ vào chảo nếu cần và nấu những chiếc bánh còn lại. Phục vụ ngay lập tức.', 59)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (43, 12, 1, N'Làm nóng lò nướng của bạn ở nhiệt độ 425°F. Lót giấy bạc chống dính lên khay nướng lớn có viền và phết dầu ô liu lên trên.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (44, 12, 2, N'Rửa sạch đầu súp lơ, loại bỏ các lá bên ngoài và cắt phần dưới cùng của lõi, giữ nguyên. Cắt từng đầu súp lơ thành từng lát dày ¾ inch.', 60)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (45, 12, 3, N'Xếp các miếng bít tết thành một lớp duy nhất trên khay nướng. Rải những bông hoa xung quanh chúng. Xịt dầu ô liu lên trên và rắc một nửa gia vị lên trên.', 61)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (46, 12, 4, N'Nướng bít tết súp lơ trong 15 phút. Lấy chúng ra khỏi lò, cẩn thận lật chúng bằng hai thìa rộng, xịt thêm dầu và rắc các loại gia vị còn lại. Nướng chúng cho đến khi chín vàng và mềm như nĩa, thêm 10-15 phút nữa.', 62)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (47, 13, 1, N'Bạn bắt đầu bằng cách trộn nước dùng, bí ngô và gia vị với nhau trong một nồi kho lớn.', 63)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (48, 13, 2, N'Đánh đều cho đến khi hỗn hợp mịn.', 64)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (49, 13, 3, N'Đun sôi hỗn hợp, giảm nhiệt và đun nhỏ lửa trong mười phút.', 65)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (50, 13, 4, N'Đánh đều trong nước cốt dừa. Tiếp tục nấu cho đến khi súp nóng lên, chỉ vài phút nữa là có thể dùng được.', 66)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (51, 13, 5, N'Hãy nhìn xem nó đậm đà và béo ngậy như thế nào!', 67)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (52, 14, 1, N'Trộn các thành phần ướp trong một cái bát.', 68)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (53, 14, 2, N'Rửa sạch nấm, cắt bí xanh thành lát dày ¼ inch, cắt ớt chuông và hành đỏ thành hình vuông.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (54, 14, 3, N'Cho rau vào nước ướp cho đến khi ngấm đều.', 69)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (55, 14, 4, N'Xiên rau vào xiên.', 70)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (56, 14, 5, N'Nướng chúng trên lửa vừa cao cho đến khi mềm, 4-5 phút mỗi mặt.', 71)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (57, 15, 1, N'Đầu tiên, chuẩn bị nước sốt: trộn đều nước tương, mật ong, bột ngô và ớt đỏ vào tô.', 72)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (58, 15, 2, N'Nấu thịt trong dầu bơ cho đến khi thịt không còn sống, bẻ thành từng miếng vụn khi nấu.', 73)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (59, 15, 3, N'Xả thịt bò, cho vào chảo, thêm tỏi và gừng. Nấu, khuấy trong một phút.', 74)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (60, 15, 4, N'Khuấy nước sốt vào thịt bò. Nấu cho đến khi nóng và nước sốt đặc lại.', 75)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (61, 15, 5, N'Tắt bếp, rưới dầu mè lên món ăn, rắc hành lá thái lát lên trên rồi thưởng thức. Ăn kèm với cơm.', 76)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (62, 16, 1, N'Bắt đầu bằng cách trộn các nguyên liệu (tất cả đều ngoại trừ dầu). Tạo thành hỗn hợp thành 16 viên thịt.', 77)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (63, 16, 2, N'Chiên thịt viên trong dầu ô liu ở tất cả các mặt trong khoảng 5 phút.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (64, 16, 3, N'Thêm nước vào chảo, đậy nắp và nấu xong thịt viên cho đến khi chúng đạt nhiệt độ bên trong là 165°F. Việc này sẽ mất khoảng 3 phút nữa.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (65, 16, 4, N'Dùng ngay với nước chấm nếu muốn.', 78)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (66, 17, 1, N'Thịt giăm bông thường có hình tròn. Bạn sẽ muốn cắt mỗi cái một nửa. Mỗi nửa sẽ là một khẩu phần.', 79)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (67, 17, 2, N'Đun nóng chảo lớn trên lửa vừa (không cao hơn). Thêm bơ. Khi bơ bắt đầu sủi bọt, xếp từng miếng thịt giăm bông vào một lớp và rắc gia vị.', 80)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (68, 17, 3, N'Nấu cho đến khi có màu nâu ở phía dưới. Quá trình này sẽ mất khoảng 3 phút nhưng sẽ khác nhau tùy thuộc vào bếp và chảo bạn sử dụng.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (69, 17, 4, N'Lúc này, thêm xi-rô cây thích vào chảo. Lật giăm bông sang mặt còn lại và nấu cho đến khi chín vàng mặt đó, khoảng 2 phút nữa. Nó sẽ nâu nhanh hơn ở mặt thứ hai.', 81)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (70, 17, 5, N'Chuyển giăm bông vào đĩa. Rưới hoặc phết nước ép chảo lên trên (đừng bỏ qua bước này!) Và thưởng thức.', 82)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (71, 18, 1, N'Bắt đầu bằng cách trộn bơ đậu phộng với trứng trong một cốc vừa cho đến khi hòa quyện hoàn toàn. Bạn có thể cần thêm một chút nước.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (72, 18, 2, N'Bước tiếp theo là trộn chất làm ngọt và baking soda.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (73, 18, 3, N'Bây giờ, cho bánh vào lò vi sóng trong 30 giây, sau đó cho vào lò vi sóng thêm 10 giây nếu cần. Đừng nấu quá chín! Và nếu bạn muốn, hãy phủ một lớp kem keto lên trên.', 83)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (74, 19, 1, N'Cắt miếng thăn lợn. Có thể chúng sẽ có một lượng nhỏ mỡ trên thịt. Cứ để nó yên. Không cần phải cắt nó.', 84)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (75, 19, 2, N'Nêm các khối thịt lợn với muối và hạt tiêu. Nấu chúng trong dầu ô liu ở tất cả các mặt. Thêm tỏi (hoặc bột tỏi), ớt bột và húng tây vào rồi nấu chín nhanh.', 85)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (76, 19, 3, N'Thêm nước dùng (hoặc nước) và dùng nó để khử men trong chảo - cạo đáy chảo để loại bỏ những phần ngon còn sót lại ở đáy.', 86)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (77, 19, 4, N'Sau đó thêm nước sốt cà chua và lá nguyệt quế.', 87)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (78, 19, 5, N'Đun sôi hỗn hợp, sau đó giảm nhiệt và đun nhỏ lửa cho đến khi thịt lợn chín và nước sốt đặc lại. Việc này sẽ mất khoảng 10 phút.', 88)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (79, 19, 6, N'Bạn có thể thêm bông cải xanh hoặc bông súp lơ nhỏ vào năm phút trước khi hầm xong hoặc thêm lá rau bina non vào cuối quá trình nấu.', 89)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (80, 20, 1, N'Đặt các lát dưa chuột, cà chua bi, hành tím và ngò vào tô lớn.', 90)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (81, 20, 2, N'Trộn rau với muối kosher, hạt tiêu đen, hạt tỏi và lá oregano khô.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (82, 20, 3, N'Trộn salad với dầu ô liu và nước cốt chanh. Nhẹ nhàng bỏ vào để kết hợp.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (83, 20, 4, N'Ăn ngay hoặc để salad nghỉ ở nhiệt độ phòng trong 10 phút để hương vị hòa quyện.', 91)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (84, 21, 1, N'Nghiền bì lợn thành vụn kiểu panko, sau đó nêm gia vị.', 92)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (85, 21, 2, N'Nhúng miếng thịt gà vào trứng rồi nhúng vào hỗn hợp bì lợn nghiền và gia vị.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (86, 21, 3, N'Đặt các miếng thịt gà đã tráng men lên giá đã phết dầu đặt trên khay nướng có viền.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (87, 21, 4, N'Nướng gà cho đến khi chín vàng, khoảng 40-45 phút trong lò nướng ở nhiệt độ 400°F.', 93)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (88, 22, 1, N'Dùng khăn giấy vỗ nhẹ cho khô cả hai mặt tôm. Đặt chúng vào một cái bát lớn và thêm dầu ô liu.', 94)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (89, 22, 2, N'Trong một bát nhỏ, trộn muối, hạt tiêu, ớt bột xông khói, bột tỏi, thì là xay, húng tây khô và ớt cayenne. Thêm hỗn hợp gia vị vào tôm.', 95)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (90, 22, 3, N'Đảo đều bằng thìa lớn', 96)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (91, 22, 4, N'Đun nóng chảo lớn 12 inch trên lửa vừa cao. Thêm tôm vào một lớp duy nhất. Dùng thìa cao su để chuyển hết dầu và gia vị còn sót lại từ tô trộn sang chảo. Xào tôm cho đến khi chín, khoảng 2 phút mỗi mặt.', 97)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (92, 22, 5, N'Cho tôm vào đĩa phục vụ. Rắc chúng với nước ép chảo, trang trí với rau mùi tây cắt nhỏ và thưởng thức. Hãy xem chúng ngon ngọt như thế nào! Họ hoàn toàn tuyệt đẹp.', 98)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (93, 23, 1, N'Trong một tô trộn lớn, trộn đều sốt mayonnaise, mù tạt Dijon, giấm, xi-rô phong, muối kosher, tiêu đen và hạt cần tây.', 99)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (94, 23, 2, N'Thêm hỗn hợp xà lách trộn và trộn đều.', 100)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (95, 23, 3, N'Đậy nắp và để lạnh trong một giờ để hương vị hòa quyện. Trộn lại trước khi phục vụ.', 101)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (96, 24, 1, N'Nấu hành tây, cà rốt, cần tây và thịt bò xay trong dầu ô liu. Nấu cho đến khi thịt bò không còn sống và rau củ mềm, giòn. Chia thịt khi nấu thành từng miếng nhỏ. Thêm tỏi và gia vị và nấu thêm một phút nữa.', 102)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (97, 24, 2, N'Khuấy nước luộc thịt bò và cà chua, đun sôi, sau đó giảm nhiệt và đun sôi súp trong 20 phút. Đây là giai đoạn cho phép tất cả các hương vị tuyệt vời hòa quyện vào nhau. Nó cũng làm nước súp đặc lại một chút.', 103)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (98, 24, 3, N'Bước cuối cùng là trộn phô mai parmesan và phục vụ món súp.', 104)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (99, 25, 1, N'Cắt xúc tu bạch tuộc thành miếng vừa ăn rồi cho vào tô.', 105)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (100, 25, 2, N'Thêm các thành phần còn lại', 106)
GO
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (101, 25, 3, N'Nhẹ nhàng trộn để kết hợp.', 107)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (103, 25, 4, N'Ăn ngay hoặc để salad nghỉ trong 20 phút, trộn lại và dùng!', 108)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (104, 26, 1, N'Bước đầu tiên của bạn là nấu nấm trong dầu ô liu. Bạn muốn nấu cho đến khi nấm ra nước, nước bốc hơi hết và nấm có màu nâu đẹp mắt.', 109)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (105, 26, 2, N'Khi nấm chín, cho nấm vào đĩa bánh đã làm nóng trước và phết dầu mỡ. Thêm hỗn hợp trứng, kem chua, phô mai và gia vị.', 110)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (106, 26, 3, N'Nướng frittata cho đến khi chín và phồng lên. Quá trình này sẽ mất khoảng 20 phút trong lò nướng 400F đã được làm nóng trước.', 111)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (107, 27, 1, N'Làm nóng lò nướng ở mức quạt/khí 180C/160C 4. Bôi mỡ và lót 2 dải giấy nướng chéo nhau vào khuôn nướng 20 x 30 cm.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (108, 27, 2, N'au khô các miếng xoài trên giấy ăn, sau đó cắt thành từng miếng 3 cm và đặt sang một bên.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (109, 27, 3, N'Cho bơ và đường vào tô, đánh đều cho đến khi mịn và mịn. Thêm từng quả trứng vào, đánh đều sau mỗi lần thêm. Dùng thìa trộn đều bột mì và dừa, sau đó là xoài và sữa chua.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (110, 27, 4, N'Múc hỗn hợp vào khuôn và dàn đều trên bề mặt, sau đó rắc thêm một ít dừa.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (111, 27, 5, N'Nướng trong 30 phút cho đến khi bánh nở và vàng và xiên que vào giữa bánh sẽ thấy tăm sạch sẽ.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (112, 27, 6, N'Để nguội trong hộp thiếc 10 phút, sau đó chuyển sang giá lưới. Sau đó, thưởng thức thôi!', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (113, 28, 1, N'Đun nóng dầu trên lửa vừa trong nồi lớn, sâu lòng có nắp đậy. Nấu hành tây trong 10 phút cho đến khi mềm và vàng ở các cạnh.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (114, 28, 2, N'Nghiền xúc xích, dùng thìa bẻ thành từng miếng vừa ăn. Nấu trong 7-8 phút cho đến khi vàng và giòn. Khuấy cùng tỏi và ớt.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (115, 28, 3, N'Thêm bông cải xanh và bí xanh. Nấu khoảng 10-12 phút cho đến khi mềm, sau đó đổ mì ống và nước luộc gà vào.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (116, 28, 4, N'Khuấy đều, sau đó đun sôi. Đun nhỏ lửa, đậy nắp và nấu trong 8-10 phút cho đến khi mì gần chín.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (117, 28, 5, N'Ngâm cải xoăn hoặc cavolo nero theo từng mẻ và nấu thêm 2-3 phút nữa cho đến khi cải xoăn chín và mì ống có độ chín vừa phải. Vắt nước chanh vào và nêm đều.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (118, 28, 6, N'Chia thành bốn bát và rắc vỏ chanh và vỏ parmesan lên trên để thưởng thức.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (119, 29, 1, N'Đun nóng một muỗng canh dầu trong nồi hầm trên lửa vừa cao. Nêm thịt bò và chiên trong nồi khoảng 5-8 phút, dùng kẹp đảo nửa chừng cho đến khi chín vàng đều. Đặt sang lên trên đĩa.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (120, 29, 2, N'Đun nóng dầu và bơ còn lại trong chảo rồi cho hành vào. Chiên nhẹ nhàng trong 15 phút hoặc cho đến khi có màu vàng nâu và caramen.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (121, 29, 3, N'Thêm tỏi, gừng, ớt, nghệ, rau mùi xay và thảo quả vào xào trong hai phút. Cho cà chua, nước luộc và đường vào rồi đun nhỏ lửa.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (122, 29, 4, N'Thêm thịt bò vào, đậy nắp lên trên cà ri và nấu ở lửa nhỏ trong 1 tiếng rưỡi - 2 giờ hoặc cho đến khi thịt mềm và rời ra. Tháo nắp trong 20 phút nấu cuối cùng.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (123, 29, 5, N'Khuấy đều garam masala và kem (nếu dùng) và nêm nếm cho vừa ăn. Rắc rau mùi lên trên và dùng kèm với bánh mì hoặc cơm.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (124, 30, 1, N'Cho phi lê gà vào túi đựng thực phẩm hoặc giữa hai tờ giấy nến nướng, dùng cán cán đập nhẹ cho đến khi chúng có độ dày đều nhau – tránh làm quá mỏng. Cho vào một cái đĩa nông lớn.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (125, 30, 2, N'Đổ passata vào tô lớn cùng với chà là, tỏi, balsamic, ớt bột, bột mù tạt và dầu. Dùng máy xay cầm tay xay nhuyễn cho đến khi mịn rồi đổ lên gà, đảo vài lần để đảm bảo gà được phủ đều. Nấu ngay theo hướng dẫn bên dưới, hoặc đậy nắp và để lạnh để ướp qua đêm.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (126, 30, 3, N'Nướng gà trên than tro trong 6-7 phút mỗi mặt hoặc chiên trong chảo chống dính trên lửa vừa cao với dầu rưới dầu trong 6-7 phút mỗi mặt cho đến khi chín.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (127, 30, 4, N'Cho các nguyên liệu salad vào tô và dùng kèm với thịt gà và khoai tây bọc ngoài nếu bạn thích.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (128, 31, 1, N'Đun nóng 75g bơ trong chảo đế dày cho đến khi sủi bọt rồi xào 1 củ hành tây thái nhỏ trong khoảng 5 phút.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (129, 31, 2, N'Cắt bỏ hạt của 3 lõi ngô và cho vào chảo cùng 125ml nước. Giảm nhiệt, đậy nắp và nấu nhẹ nhàng trong 10 phút.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (130, 31, 3, N'Thêm 1 thìa cà phê đường và 125ml kem tươi, nêm gia vị và nấu, không đậy nắp trong 5 phút nữa.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (131, 31, 4, N'Rắc 50g phô mai cheddar hoặc phô mai mozzarella bào lên trên và nấu thêm vài phút nữa cho đến khi tan chảy.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (132, 32, 1, N'Đầu tiên, làm seitan. Xay đậu phụ, sữa đậu nành, miso, chiết xuất men, ngải giấm, cây xô thơm, húng tây, bột hành, bột tỏi, 1 thìa cà phê muối và ½ thìa cà phê tiêu trắng trong máy xay thực phẩm cho đến khi mịn.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (133, 32, 2, N'Đổ vào tô và thêm gluten lúa mì và protein đậu hoặc bột protein. Trộn để tạo thành bột. Khi nó đã dính lại với nhau, hãy nhào thật kỹ, kéo căng và xé trong vòng 10 - 15 phút. Nó sẽ sẵn sàng khi seitan cảm thấy đàn hồi.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (134, 32, 3, N'Đổ nước luộc rau vào chảo cùng với cọng hành, tỏi và mùi tây. Đun sôi. Làm phẳng miếng seitan có độ dày 1 cm và cắt thành từng miếng cỡ ức gà. Đun nhỏ lửa trong kho trong 30 phút, đậy nắp lại. Để nguội trong kho. Lý tưởng nhất là làm điều này vào ngày hôm trước và làm lạnh trong tủ lạnh.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (135, 32, 4, N'Trộn các nguyên liệu làm lớp phủ gia vị trong một bát. Đặt bột gram vào một cái khác và bột mì thường vào cái thứ ba. Trộn đủ nước vào bột gram cho đến khi nó có kết cấu tương tự như trứng đánh. Nhúng các miếng seitan vào bột mì thường, rũ bỏ phần thừa, sau đó phủ từng miếng vào hỗn hợp bột gram và cuối cùng là hỗn hợp gia vị panko.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (136, 32, 5, N'Trong chảo rán lớn hoặc nồi chiên ngập dầu, đun nóng dầu đến 180C (hoặc cho đến khi miếng bánh mì chuyển sang màu nâu trong 20 giây). Khi đã nóng, cẩn thận thả từng miếng seitan vào và nấu trong khoảng 6 phút cho đến khi chúng có màu nâu vàng đậm và giòn.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (137, 32, 6, N'Chuyển sang giấy ăn để ráo dầu và rắc một ít muối. Dùng trong bánh mì nướng với salad hoặc salad, hoặc cách khác là làm món gỏi gà giả với sốt BBQ.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (138, 33, 1, N'Đun nóng 1 muỗng canh dầu ô liu trong chảo lớn và thêm 2 củ hành tây thái lát mỏng. Nấu cho đến khi mềm, khoảng 10 phút.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (139, 33, 2, N'Thêm 2 tép tỏi nghiền nát, 1 thìa cà phê garam masala, 1 thìa cà phê bột nghệ và 1 thìa cà phê rau mùi xay, sau đó khuấy đều. Nấu trong 1-2 phút, sau đó đổ lon cà chua mận 400g vào, dùng thìa gỗ nhỏ và đun nhỏ lửa trong 10 phút.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (140, 33, 3, N'Đổ nước cốt dừa vào lon 400ml và nêm gia vị. Đun sôi và đun nhỏ lửa thêm 10-15 phút nữa cho đến khi nước sốt đặc lại.', NULL)
INSERT [dbo].[Step] ([step_id], [recipe_id], [step_number], [description], [image_id]) VALUES (141, 33, 4, N'Cho lon đậu xanh 400g và 2 quả cà chua lớn cắt làm tư vào đã rửa sạch và ráo nước rồi hâm nóng. Rắc ½ gói nhỏ lên trên rau mùi đã cắt nhỏ và dùng với cơm mịn.', NULL)
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
/****** Object:  Index [UQ__Users__AB6E61648F4EA5D6]    Script Date: 6/13/2024 8:04:48 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__F3DBC572A6B46EAE]    Script Date: 6/13/2024 8:04:48 PM ******/
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
