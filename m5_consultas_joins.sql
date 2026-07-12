-- Consulta 1
SELECT
    s.SaleDate AS Fecha,
    c.FirstName || ' ' || c.LastName AS Cliente,
    t.Region,
    p.ProductName AS Producto,
    p.CategoryID AS Categoria,
    s.Quantity AS Cantidad,
    s.UnitPrice AS PrecioUnitario,
    s.TotalAmount AS TotalVenta,
    t.TerritoryName AS Territorio
FROM Sales s
INNER JOIN Customers c
    ON s.CustomerID = c.ID_Customer
INNER JOIN Products p
    ON s.ProductID = p.ProductID
INNER JOIN Territories t
    ON s.TerritoryID = t.TerritoryID;

-- Consulta 2
SELECT
    c.FirstName,
    c.LastName,
    c.Email,
    c.RegistrationDate
FROM Customers c
LEFT JOIN Sales s
    ON c.ID_Customer = s.CustomerID
WHERE s.CustomerID IS NULL;

-- Consulta 3
SELECT
    p.ProductName,
    p.CategoryID,
    p.UnitPrice
FROM Products p
LEFT JOIN Sales s
    ON p.ProductID = s.ProductID
WHERE s.ProductID IS NULL;

-- Consulta 4
SELECT
    Canal,
    COUNT(*) AS CantidadVentas,
    SUM(TotalAmount) AS TotalVendido
FROM (
    SELECT TotalAmount, 'Online' AS Canal
    FROM Sales
    WHERE Channel = 'Online'

    UNION ALL

    SELECT TotalAmount, 'Presencial' AS Canal
    FROM Sales
    WHERE Channel = 'Presencial'
) t
GROUP BY Canal;
