SET NOCOUNT ON

DECLARE @N INT
DECLARE @I INT
SET @I = 0

WHILE @I < 5000
BEGIN

SET @N = (SELECT TOP 1 [Id] FROM Books ORDER BY NEWID()) 

INSERT INTO [Sales] ( [Price], [Quantity], [SaleDate], [BookId], [ShopId] )

VALUES 
(
	(SELECT [Price] * 1.25 FROM Books WHERE [Id] = @N),
	(ABS(CHECKSUM(NEWID())) % 20 + 1),
	(DATEADD(DAY, (ABS(CHECKSUM(NEWID())) % 365), '2020-01-01')),
	(@N),
	(SELECT TOP 1 [Id] FROM Shops ORDER BY NEWID())
)
	SET @I = @I + 1
END

