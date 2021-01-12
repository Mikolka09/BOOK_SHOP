﻿-- 1. Показать все книги, количество страниц в которых больше 500, но меньше 650:
--SELECT
--	*
--FROM
--	Books
--WHERE
--	[Pages] BETWEEN 500 AND 650
--ORDER BY
--	[Pages]

-- 2. Показать все книги, в которых первая буква названия либо «А», либо «З»:
--SELECT
--	*
--FROM
--	Books
--WHERE
--	[Name] LIKE N'А%' 
--	OR [Name] LIKE N'З%'
--ORDER BY
--	[Name]

--3. Показать все книги жанра «Детектив», количество проданных книг более 30 экземпляров:
--SELECT
--	B.[Name] AS [Name Book],
--	SUM(S.[Quantity]) AS [Quantity],
--	MAX(T.[Name]) AS [Theme]
--FROM
--	Sales S
--	JOIN Books B ON B.[Id] = S.[BookId]
--	JOIN Themes T ON T.[Id] = B.[ThemeID]
--WHERE
--	T.[Name] = N'Детектив'
--GROUP BY
--	B.[Name]
--HAVING
--	SUM(S.[Quantity]) > 30
--ORDER BY
--	2

-- 4. Показать все книги, в названии которых есть слово «Microsoft», но нет слова «Windows»:
--SELECT
--	*
--FROM
--	Books
--WHERE
--	[Name] LIKE N'%Microsoft%'
--	AND [Name] NOT LIKE N'%Windows%'
--ORDER BY
--	[Name]

-- 5. Показать все книги (название, тематика, полное имя автора в одной ячейке), цена одной страницы которых меньше 65 копеек:
--SELECT
--	B.[Name] + ',  ' + N'тематика - ' + T.[Name] + ',  ' + N'автор - ' + A.[Name] + ' ' + A.[Surname] AS [Full Name Book] 
--FROM
--	Books B
--	JOIN Themes T ON T.[Id] = B.[ThemeID]
--	JOIN Authors A ON A.[Id] = B.[AuthorId]
--WHERE
--	B.[Price] / B.[Pages] < 0.65
--ORDER BY
--	1

-- 6. Показать все книги, название которых состоит из 4 слов:
--SELECT
--	*
--FROM
--	Books
--WHERE
--	(LEN([Name]) - LEN(REPLACE([Name], ' ', '')) + 1) = 4

-- 7. Показать информацию о продажах в следующем виде:
--    ▷▷ Название книги, но, чтобы оно не содержало букву «А».
--    ▷▷ Тематика, но, чтобы не «Программирование».
--    ▷▷ Автор, но, чтобы не «Герберт Шилдт».
--    ▷▷ Цена, но, чтобы в диапазоне от 300 до 500 гривен.
--    ▷▷ Количество продаж, но не менее 8 книг.
--    ▷▷ Название магазина, который продал книгу, но он не должен быть в Украине или России.
--SELECT
--	B.[Name] AS [Book Name],
--	T.[Name] AS [Theme],
--	A.[Name] + ' ' + A.[Surname] AS [Author],
--	S.[Price] AS [Price],
--	S.[Quantity] AS [Quantly, cnt],
--	Sh.[Name] AS [Shop]
--FROM
--	Books B
--	JOIN Themes T ON T.[Id] = B.[ThemeID]
--	JOIN Authors A ON A.[Id] = B.[AuthorId]
--	JOIN Sales S ON S.[BookId] = B.[Id]
--	JOIN Shops Sh ON Sh.[Id] = S.[ShopId]
--	JOIN Countries C ON C.[Id] = Sh.[CountryId]
--WHERE
--	B.[Name] NOT LIKE N'%А%' AND
--	T.[Name] <> N'Программирование' AND
--	A.[Name] + ' ' + A.[Surname] <> N'Герберт Шилдт' AND
--	S.[Price] BETWEEN 500 AND 700 AND
--	S.[Quantity] >= 8 AND
--	C.[Name] <> N'Украина' AND
--	C.[Name] <> N'Россия'
--ORDER BY
--	4

-- 8. Показать следующую информацию в два столбца (числа в правом столбце приведены в качестве примера):
--    ▷▷Количество авторов: 14
--    ▷▷Количество книг: 47
--    ▷▷Средняя цена продажи: 85.43 грн.
--    ▷▷Среднее количество страниц: 650.6.
--SELECT N'Количество авторов' AS [Name],
--	COUNT([Id]) AS [Cnt]
--FROM
--	Authors
--UNION All
--SELECT N'Количество книг',
--	COUNT([Id])
--FROM
--	Books
--UNION All
--SELECT N'Средняя цена продажи',
--	ROUND(AVG([Price]), 2)
--FROM
--	Sales
--UNION All
--SELECT N'Среднее количество страниц',
--	AVG([Pages])
--FROM
--	Books

-- 9. Показать тематики книг и сумму страниц всех книг по каждой из них:
--SELECT
--	T.[Name] AS [Theme],
--	SUM(B.[Pages]) AS [Sum Pages, cnt]
--FROM
--	Themes T
--	JOIN Books B ON B.[ThemeID] = T.[Id]
--GROUP BY
--	T.[Name]
--ORDER BY
--	1

-- 10. Показать количество всех книг и сумму страниц этих книг по каждому из авторов:
--SELECT
--	A.[Name] + ' ' + A.[Surname] AS [Name Author],
--	COUNT(B.[Id]) AS [Count Book, cnt],
--	SUM (B.[Pages]) AS [Sum Pages]
--FROM
--	Authors A
--	JOIN Books B ON B.[AuthorId] = A.[Id]
--GROUP BY
--	A.[Name] + ' ' + A.[Surname]
--ORDER BY
--	1

-- 11. Показать книгу тематики «Программирование» с наибольшим количеством страниц:
--SELECT
--	T.[Name] AS [Theme],
--	B.[Name] AS [Name Book],
--	B.[Pages] AS [Pages]
--FROM
--	Themes T
--	JOIN Books B ON B.[ThemeID] = T.[Id]
--WHERE
--	T.[Name] = N'Программирование' AND
--	B.[Pages] = (SELECT MAX(B.[Pages]) FROM Books B JOIN Themes T ON T.[Id] = B.[ThemeID] WHERE T.[Name] = N'Программирование')

-- 12. Показать среднее количество страниц по каждой тематике, которое не превышает 400:
--SELECT
--	T.[Name] AS [Theme],
--	AVG(B.[Pages]) AS [AVG Pages]
--FROM
--	Themes T
--	JOIN Books B ON B.[ThemeID] = T.[Id]
--GROUP BY
--	T.[Name]
--HAVING
--	AVG(B.[Pages]) <= 400

-- 13. Показать сумму страниц по каждой тематике, учитывая только книги с количеством страниц более 400, и чтобы
--     тематики были «Программирование», «Администрирование» и «Дизайн»:
--SELECT
--	T.[Name] AS [Theme],
--	SUM(B.[Pages]) AS [Sum Pages]
--FROM
--	Themes T
--	JOIN Books B ON B.[ThemeID] = T.[Id]
--WHERE
--	B.[Pages] > 400
--GROUP BY
--	T.[Name]
--HAVING
--	T.[Name] = N'Программирование' OR
--	T.[Name] = N'Администрирование' OR
--	T.[Name] = N'Дизайн'
--ORDER BY
--	2 DESC

-- 14. Показать информацию о работе магазинов: что, где, кем, когда и в каком количестве было продано:
--SELECT
--	Sh.[Name] AS [Shop],
--	C.[Name] AS [Country],
--	B.[Name] AS [Book],
--	S.[SaleDate] AS [SaleDate],
--	S.[Quantity] AS [Cnt]
--FROM
--	Shops Sh
--	JOIN Countries C ON C.[Id] = Sh.[CountryId]
--	JOIN Sales S ON S.[ShopId] = Sh.[Id]
--	JOIN Books B ON B.[Id] = S.[BookId]
--ORDER BY
--	Sh.[Name]
	
 --15. Показать самый прибыльный магазин:
--SELECT TOP 1
--	Sh.[Name] AS [Shop],
--	SUM(S.[Quantity] * S.[Price]) AS [Summa] 
--FROM
--	Shops Sh
--	JOIN Sales S ON S.[ShopId] = Sh.[Id]
--GROUP BY
--	Sh.[Name]
--ORDER BY
--	2 DESC
	
