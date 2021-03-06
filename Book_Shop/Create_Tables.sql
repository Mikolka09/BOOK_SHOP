﻿-- АВТОРЫ (AUTHORS)
IF	0 < (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Authors')
	DROP TABLE Authors ;

CREATE TABLE [Authors](
	[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Name] NVARCHAR(MAX) NOT NULL CHECK([Name] <> ''),
	[Surname] NVARCHAR(MAX) NOT NULL CHECK([Surname] <> ''),
	[CountryId] INT NOT NULL
)

-- Книги (Books)
IF	0 < (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Books')
	DROP TABLE Books;

CREATE TABLE [Books](
	[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Name] NVARCHAR(MAX) NOT NULL CHECK([Name] <> ''),
	[Pages] INT NOT NULL CHECK([Pages] > 0),
	[Price] MONEY NOT NULL CHECK([Price] >= 0),
	[PublishDate] DATE NOT NULL CHECK([PublishDate] <= GETDATE()),
	[AuthorId] INT NOT NULL,
	[ThemeID] INT NOT NULL
)

-- Страны (Countries)
IF	0 < (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Countries')
	DROP TABLE Countries;

CREATE TABLE [Countries](
	[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Name] NVARCHAR(50) NOT NULL CHECK([Name] <> '') UNIQUE
)

-- Продажи (Sales)
IF	0 < (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Sales')
	DROP TABLE Sales;

CREATE TABLE [Sales](
	[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Price] MONEY NOT NULL CHECK([Price] >= 0),
	[Quantity] INT NOT NULL CHECK([Quantity] > 0),
	[SaleDate] DATE NOT NULL CHECK([SaleDate] <= GETDATE()) DEFAULT GETDATE(),
	[BookId] INT NOT NULL,
	[ShopId] INT NOT NULL
)

-- Магазины (Shops)
IF	0 < (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Shops')
	DROP TABLE Shops;

CREATE TABLE [Shops](
	[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Name] NVARCHAR(MAX) NOT NULL CHECK([Name] <> ''),
	[CountryId] INT NOT NULL
)

-- Тематики (Themes)
IF	0 < (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Themes')
	DROP TABLE Themes ;

CREATE TABLE [Themes](
	[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Name] NVARCHAR(100) NOT NULL CHECK([Name] <> '') UNIQUE
)