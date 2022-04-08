
USE [Pizzeria]
GO

/****** Object:  StoredProcedure [dbo].[USP_GetDropdownList]    Script Date: 4/22/2019 1:17:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[USP_GetPizzaList]    Script Date: 4/22/2019 1:17:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[USP_GetSizeList]    Script Date: 4/22/2019 1:17:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[USP_ManagePizza]    Script Date: 4/22/2019 1:17:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[USP_ManageSize]    Script Date: 4/22/2019 1:17:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 4/22/2019 1:17:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 4/22/2019 1:17:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 4/22/2019 1:17:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 4/22/2019 1:17:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 4/22/2019 1:17:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 4/22/2019 1:17:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 4/22/2019 1:17:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Category]    Script Date: 4/22/2019 1:17:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Order]    Script Date: 4/22/2019 1:17:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[OrderPizza]    Script Date: 4/22/2019 1:17:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Pizza]    Script Date: 4/22/2019 1:17:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[PizzaSize]    Script Date: 4/22/2019 1:17:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Size]    Script Date: 4/22/2019 1:17:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Store]    Script Date: 4/22/2019 1:17:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'751bb8d9-0518-49b6-a994-84ac1bd6efa2', N'testuser1@pizzeria.com', N'TESTUSER1@PIZZERIA.COM', N'testuser1@pizzeria.com', N'TESTUSER1@PIZZERIA.COM', 0, N'AQAAAAEAACcQAAAAELX3TWAmgHhmk15EJtNl2rAJcQT/1W5r7aBuqFs2GokTBqTfrV/vZ9+5z9p5CzO/IQ==', N'7ROAY7IE46KMX6ARWKRT2VJ7KKPLP7WP', N'585172aa-b201-4287-a8da-503284112a73', NULL, 0, 0, NULL, 1, 0)
GO

INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'fa7faedd-fa72-4030-80b8-15740a95cb68', N'admin@pizzeria.com', N'ADMIN@PIZZERIA.COM', N'admin@pizzeria.com', N'ADMIN@PIZZERIA.COM', 0, N'AQAAAAEAACcQAAAAELXPN/A7q6afIOsfdsMzWj/MgQXDM7tMjf7k1vS8INEjQIXq9yM5NnDB4R0aK2W45w==', N'INFYVPWTTARLHS2X2SLQ3Q22YSW7NFNR', N'b054ccd6-baa7-4386-b627-817414ae26c5', NULL, 0, 0, NULL, 1, 0)
GO

INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'fa7faedd-fa72-4030-80b8-15740a95cb68', N'[AspNetUserStore]', N'AuthenticatorKey', N'PIMGTPXBWIQ7ZLG4WARGYVLO6O5UYRJS')
GO

SET IDENTITY_INSERT [dbo].[Category] ON
GO

INSERT [dbo].[Category] ([CategoryId], [Title], [CreatedDate], [ModifiedDate]) VALUES (1, N'Vegeterian', CAST(0x0000AA32016761DA AS DateTime), CAST(0x0000AA32016761DA AS DateTime))
GO

INSERT [dbo].[Category] ([CategoryId], [Title], [CreatedDate], [ModifiedDate]) VALUES (2, N'Non-Vegeterian', CAST(0x0000AA32016767E1 AS DateTime), CAST(0x0000AA32016767E1 AS DateTime))
GO

SET IDENTITY_INSERT [dbo].[Category] OFF
GO

SET IDENTITY_INSERT [dbo].[Pizza] ON
GO

INSERT [dbo].[Pizza] ([PizzaId], [Title], [Description], [CategoryId], [FilePath], [CreatedDate], [ModifiedDate]) VALUES (1, N'Cheese Burst Non-Veg', N'Cheese Burst Non-Veg', 2, N'images\pizzas\2004201912074507.png', CAST(0x0000AA35000231C0 AS DateTime), CAST(0x0000AA35000231C0 AS DateTime))
GO

INSERT [dbo].[Pizza] ([PizzaId], [Title], [Description], [CategoryId], [FilePath], [CreatedDate], [ModifiedDate]) VALUES (2, N'Extravaganza', N'Extravaganza', 1, N'images\pizzas\2004201912451166.png', CAST(0x0000AA35000C69D4 AS DateTime), CAST(0x0000AA35000C69D4 AS DateTime))
GO

INSERT [dbo].[Pizza] ([PizzaId], [Title], [Description], [CategoryId], [FilePath], [CreatedDate], [ModifiedDate]) VALUES (3, N'American Veggies', N'American Veggies', 1, N'images\pizzas\2004201912530731.png', CAST(0x0000AA35000E9724 AS DateTime), CAST(0x0000AA35000E9724 AS DateTime))
GO

INSERT [dbo].[Pizza] ([PizzaId], [Title], [Description], [CategoryId], [FilePath], [CreatedDate], [ModifiedDate]) VALUES (4, N'Veggie Supreme', N'Veggie Supreme', 1, N'images\pizzas\2004201912074507.png', CAST(0x0000AA35000231C0 AS DateTime), CAST(0x0000AA35000231C0 AS DateTime))
GO

INSERT [dbo].[Pizza] ([PizzaId], [Title], [Description], [CategoryId], [FilePath], [CreatedDate], [ModifiedDate]) VALUES (5, N'Mexican Passion', N'Mexican Passion', 2, N'images\pizzas\2004201912451166.png', CAST(0x0000AA35000C69D4 AS DateTime), CAST(0x0000AA35000C69D4 AS DateTime))
GO

INSERT [dbo].[Pizza] ([PizzaId], [Title], [Description], [CategoryId], [FilePath], [CreatedDate], [ModifiedDate]) VALUES (6, N'Italian Veggies', N'Italian Veggies', 1, N'images\pizzas\2004201912530731.png', CAST(0x0000AA35000E9724 AS DateTime), CAST(0x0000AA35000E9724 AS DateTime))
GO

INSERT [dbo].[Pizza] ([PizzaId], [Title], [Description], [CategoryId], [FilePath], [CreatedDate], [ModifiedDate]) VALUES (7, N'Texas Combo', N'Texas Combo', 2, N'images\pizzas\2004201912074507.png', CAST(0x0000AA35000231C0 AS DateTime), CAST(0x0000AA35000231C0 AS DateTime))
GO

INSERT [dbo].[Pizza] ([PizzaId], [Title], [Description], [CategoryId], [FilePath], [CreatedDate], [ModifiedDate]) VALUES (8, N'Meator', N'Meator', 1, N'images\pizzas\2004201912451166.png', CAST(0x0000AA35000C69D4 AS DateTime), CAST(0x0000AA35000C69D4 AS DateTime))
GO

INSERT [dbo].[Pizza] ([PizzaId], [Title], [Description], [CategoryId], [FilePath], [CreatedDate], [ModifiedDate]) VALUES (9, N'Pepperoni Plus', N'Pepperoni Plus', 1, N'images\pizzas\2004201912530731.png', CAST(0x0000AA35000E9724 AS DateTime), CAST(0x0000AA35000E9724 AS DateTime))
GO

INSERT [dbo].[Pizza] ([PizzaId], [Title], [Description], [CategoryId], [FilePath], [CreatedDate], [ModifiedDate]) VALUES (10, N'Tandoori Chicken', N'Tandoori Chicken', 2, N'images\pizzas\2004201912074507.png', CAST(0x0000AA35000231C0 AS DateTime), CAST(0x0000AA35000231C0 AS DateTime))
GO

INSERT [dbo].[Pizza] ([PizzaId], [Title], [Description], [CategoryId], [FilePath], [CreatedDate], [ModifiedDate]) VALUES (11, N'Garlic Breads', N'Garlic Breads', 1, N'images\pizzas\2004201912451166.png', CAST(0x0000AA35000C69D4 AS DateTime), CAST(0x0000AA35000C69D4 AS DateTime))
GO

INSERT [dbo].[Pizza] ([PizzaId], [Title], [Description], [CategoryId], [FilePath], [CreatedDate], [ModifiedDate]) VALUES (12, N'Mushroom Riot', N'Mushroom Riot', 1, N'images\pizzas\2004201912530731.png', CAST(0x0000AA35000E9724 AS DateTime), CAST(0x0000AA35000E9724 AS DateTime))
GO

INSERT [dbo].[Pizza] ([PizzaId], [Title], [Description], [CategoryId], [FilePath], [CreatedDate], [ModifiedDate]) VALUES (13, N'Spicy Treat', N'Spicy Treat', 2, N'images\pizzas\2004201912074507.png', CAST(0x0000AA35000231C0 AS DateTime), CAST(0x0000AA35000231C0 AS DateTime))
GO

INSERT [dbo].[Pizza] ([PizzaId], [Title], [Description], [CategoryId], [FilePath], [CreatedDate], [ModifiedDate]) VALUES (14, N'American Heat', N'American Heat', 1, N'images\pizzas\2004201912451166.png', CAST(0x0000AA35000C69D4 AS DateTime), CAST(0x0000AA35000C69D4 AS DateTime))
GO

INSERT [dbo].[Pizza] ([PizzaId], [Title], [Description], [CategoryId], [FilePath], [CreatedDate], [ModifiedDate]) VALUES (15, N'Hawaiian Fantasy', N'Hawaiian Fantasy', 1, N'images\pizzas\2004201912530731.png', CAST(0x0000AA35000E9724 AS DateTime), CAST(0x0000AA35000E9724 AS DateTime))
GO

SET IDENTITY_INSERT [dbo].[Pizza] OFF
GO

SET IDENTITY_INSERT [dbo].[PizzaSize] ON
GO

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price], [CreatedDate], [ModifiedDate]) VALUES (1, 1, 1, 10.0000, CAST(0x0000AA3501646A9E AS DateTime), CAST(0x0000AA3501646A9E AS DateTime))
GO

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price], [CreatedDate], [ModifiedDate]) VALUES (2, 1, 2, 12.0000, CAST(0x0000AA3501646EF3 AS DateTime), CAST(0x0000AA3501646EF3 AS DateTime))
GO

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price], [CreatedDate], [ModifiedDate]) VALUES (3, 1, 3, 15.0000, CAST(0x0000AA3501647414 AS DateTime), CAST(0x0000AA3501647414 AS DateTime))
GO

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price], [CreatedDate], [ModifiedDate]) VALUES (4, 2, 1, 11.0000, CAST(0x0000AA3501647C95 AS DateTime), CAST(0x0000AA3501647C95 AS DateTime))
GO

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price], [CreatedDate], [ModifiedDate]) VALUES (5, 2, 2, 14.0000, CAST(0x0000AA3501647F70 AS DateTime), CAST(0x0000AA3501647F70 AS DateTime))
GO

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price], [CreatedDate], [ModifiedDate]) VALUES (6, 2, 3, 17.0000, CAST(0x0000AA35016481FE AS DateTime), CAST(0x0000AA35016481FE AS DateTime))
GO

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price], [CreatedDate], [ModifiedDate]) VALUES (7, 2, 4, 20.0000, CAST(0x0000AA35016484FC AS DateTime), CAST(0x0000AA35016484FC AS DateTime))
GO

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price], [CreatedDate], [ModifiedDate]) VALUES (8, 2, 5, 30.0000, CAST(0x0000AA3501648F08 AS DateTime), CAST(0x0000AA3501648F08 AS DateTime))
GO

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price], [CreatedDate], [ModifiedDate]) VALUES (9, 3, 1, 12.0000, CAST(0x0000AA350164923C AS DateTime), CAST(0x0000AA350164923C AS DateTime))
GO

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price], [CreatedDate], [ModifiedDate]) VALUES (10, 3, 4, 18.0000, CAST(0x0000AA3501649864 AS DateTime), CAST(0x0000AA3501649864 AS DateTime))
GO

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price], [CreatedDate], [ModifiedDate]) VALUES (11, 4, 1, 10.0000, CAST(0x0000AA3501646A9E AS DateTime), CAST(0x0000AA3501646A9E AS DateTime))
GO

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price], [CreatedDate], [ModifiedDate]) VALUES (12, 4, 2, 12.0000, CAST(0x0000AA3501646EF3 AS DateTime), CAST(0x0000AA3501646EF3 AS DateTime))
GO

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price], [CreatedDate], [ModifiedDate]) VALUES (13, 4, 3, 15.0000, CAST(0x0000AA3501647414 AS DateTime), CAST(0x0000AA3501647414 AS DateTime))
GO

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price], [CreatedDate], [ModifiedDate]) VALUES (14, 5, 1, 11.0000, CAST(0x0000AA3501647C95 AS DateTime), CAST(0x0000AA3501647C95 AS DateTime))
GO

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price], [CreatedDate], [ModifiedDate]) VALUES (15, 5, 2, 14.0000, CAST(0x0000AA3501647F70 AS DateTime), CAST(0x0000AA3501647F70 AS DateTime))
GO

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price], [CreatedDate], [ModifiedDate]) VALUES (16, 5, 3, 17.0000, CAST(0x0000AA35016481FE AS DateTime), CAST(0x0000AA35016481FE AS DateTime))
GO

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price], [CreatedDate], [ModifiedDate]) VALUES (17, 6, 4, 20.0000, CAST(0x0000AA35016484FC AS DateTime), CAST(0x0000AA35016484FC AS DateTime))
GO

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price], [CreatedDate], [ModifiedDate]) VALUES (18, 6, 5, 30.0000, CAST(0x0000AA3501648F08 AS DateTime), CAST(0x0000AA3501648F08 AS DateTime))
GO

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price], [CreatedDate], [ModifiedDate]) VALUES (19, 6, 1, 12.0000, CAST(0x0000AA350164923C AS DateTime), CAST(0x0000AA350164923C AS DateTime))
GO

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price], [CreatedDate], [ModifiedDate]) VALUES (20, 6, 4, 18.0000, CAST(0x0000AA3501649864 AS DateTime), CAST(0x0000AA3501649864 AS DateTime))
GO

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price], [CreatedDate], [ModifiedDate]) VALUES (21, 7, 1, 10.0000, CAST(0x0000AA3501646A9E AS DateTime), CAST(0x0000AA3501646A9E AS DateTime))
GO

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price], [CreatedDate], [ModifiedDate]) VALUES (22, 7, 2, 12.0000, CAST(0x0000AA3501646EF3 AS DateTime), CAST(0x0000AA3501646EF3 AS DateTime))
GO

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price], [CreatedDate], [ModifiedDate]) VALUES (23, 7, 3, 15.0000, CAST(0x0000AA3501647414 AS DateTime), CAST(0x0000AA3501647414 AS DateTime))
GO

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price], [CreatedDate], [ModifiedDate]) VALUES (24, 7, 1, 11.0000, CAST(0x0000AA3501647C95 AS DateTime), CAST(0x0000AA3501647C95 AS DateTime))
GO

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price], [CreatedDate], [ModifiedDate]) VALUES (25, 8, 2, 14.0000, CAST(0x0000AA3501647F70 AS DateTime), CAST(0x0000AA3501647F70 AS DateTime))
GO

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price], [CreatedDate], [ModifiedDate]) VALUES (26, 9, 3, 17.0000, CAST(0x0000AA35016481FE AS DateTime), CAST(0x0000AA35016481FE AS DateTime))
GO

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price], [CreatedDate], [ModifiedDate]) VALUES (27, 9, 4, 20.0000, CAST(0x0000AA35016484FC AS DateTime), CAST(0x0000AA35016484FC AS DateTime))
GO

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price], [CreatedDate], [ModifiedDate]) VALUES (28, 9, 5, 30.0000, CAST(0x0000AA3501648F08 AS DateTime), CAST(0x0000AA3501648F08 AS DateTime))
GO

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price], [CreatedDate], [ModifiedDate]) VALUES (29, 9, 1, 12.0000, CAST(0x0000AA350164923C AS DateTime), CAST(0x0000AA350164923C AS DateTime))
GO

INSERT [dbo].[PizzaSize] ([PizzaSizeId], [PizzaId], [SizeId], [Price], [CreatedDate], [ModifiedDate]) VALUES (30, 9, 4, 18.0000, CAST(0x0000AA3501649864 AS DateTime), CAST(0x0000AA3501649864 AS DateTime))
GO

SET IDENTITY_INSERT [dbo].[PizzaSize] OFF
GO

SET IDENTITY_INSERT [dbo].[Size] ON
GO

INSERT [dbo].[Size] ([SizeId], [SizeName], [Abbreviation], [CreatedDate], [ModifiedDate]) VALUES (1, N'Small', N'S', CAST(0x0000AA320167184F AS DateTime), CAST(0x0000AA320167184F AS DateTime))
GO

INSERT [dbo].[Size] ([SizeId], [SizeName], [Abbreviation], [CreatedDate], [ModifiedDate]) VALUES (2, N'Medium', N'M', CAST(0x0000AA3201671BA3 AS DateTime), CAST(0x0000AA3201671BA3 AS DateTime))
GO

INSERT [dbo].[Size] ([SizeId], [SizeName], [Abbreviation], [CreatedDate], [ModifiedDate]) VALUES (3, N'Large', N'L', CAST(0x0000AA3201671D7E AS DateTime), CAST(0x0000AA3201671D7E AS DateTime))
GO

INSERT [dbo].[Size] ([SizeId], [SizeName], [Abbreviation], [CreatedDate], [ModifiedDate]) VALUES (4, N'Extra Large', N'XL', CAST(0x0000AA340003DBCC AS DateTime), CAST(0x0000AA340003DBCC AS DateTime))
GO

INSERT [dbo].[Size] ([SizeId], [SizeName], [Abbreviation], [CreatedDate], [ModifiedDate]) VALUES (5, N'Monster', N'MR', CAST(0x0000AA3400047F28 AS DateTime), CAST(0x0000AA3400047F28 AS DateTime))
GO

SET IDENTITY_INSERT [dbo].[Size] OFF
GO
