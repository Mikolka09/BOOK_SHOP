---- АВТОРЫ (AUTHORS)
--CREATE TABLE [Authors](
--	[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
--	[Name] NVARCHAR(MAX) NOT NULL CHECK([Name] <> ''),
--	[Surname] NVARCHAR(MAX) NOT NULL CHECK([Surname] <> ''),
--	[CountryId] INT NOT NULL
--)

---- Книги (Books)
--CREATE TABLE [Books](
--	[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
--	[Name] NVARCHAR(MAX) NOT NULL CHECK([Name] <> ''),
--	[Pages] INT NOT NULL CHECK([Pages] > 0),
--	[Price] MONEY NOT NULL CHECK([Price] >= 0),
--	[PublishDate] DATE NOT NULL CHECK([PublishDate] <= GETDATE()),
--	[AuthorId] INT NOT NULL,
--	[ThemeID] INT NOT NULL
--)

---- Страны (Countries)
--CREATE TABLE [Countries](
--	[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
--	[Name] NVARCHAR(50) NOT NULL CHECK([Name] <> '') UNIQUE
--)

-- Продажи (Sales)
CREATE TABLE [Sales](
	[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Price] MONEY NOT NULL CHECK([Price] >= 0),
	[Quantity] INT NOT NULL CHECK([Quantity] > 0),
	[SaleDate] DATE NOT NULL CHECK([SaleDate] <= GETDATE()) DEFAULT GETDATE(),
	[BookId] INT NOT NULL,
	[ShopId] INT NOT NULL
)

---- Магазины (Shops)
--CREATE TABLE [Shops](
--	[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
--	[Name] NVARCHAR(MAX) NOT NULL CHECK([Name] <> ''),
--	[CountryId] INT NOT NULL
--)

---- Тематики (Themes)
--CREATE TABLE [Themes](
--	[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
--	[Name] NVARCHAR(100) NOT NULL CHECK([Name] <> '') UNIQUE
--)
