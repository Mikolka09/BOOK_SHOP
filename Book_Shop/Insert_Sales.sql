SET NOCOUNT ON

DECLARE @I INT
SET @I = 0

WHILE @I < 10000
BEGIN

INSERT INTO [Sales] ( [Price], [Quantity], [SaleDate], [BookId], [ShopId] )

VALUES 
(
	 0,
	(ABS(CHECKSUM(NEWID()) % 10) + 1),
	(DATEADD(DAY, (ABS(CHECKSUM(NEWID())) % 365), '2020-01-01')),
	(ABS(CHECKSUM(NEWID()) % 68) + 1),
	(ABS(CHECKSUM(NEWID()) % 14) + 1)
)
	SET @I = @I + 1
END

UPDATE 
	Sales
SET [Price] = B.[Price] * 1.25
FROM 
	Sales S
	JOIN Books B ON B.[Id] = S.[BookId] 
WHERE
	S.[BookId] = B.[Id]
