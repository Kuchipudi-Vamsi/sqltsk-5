
-- 1. Drop existing tables if they exist
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;

-- 2. Create Customers table
CREATE TABLE Customers (
    CustomerID INTEGER PRIMARY KEY,
    Name TEXT
);

-- 3. Create Orders table
CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY,
    CustomerID INTEGER,
    Product TEXT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- 4. Insert sample data into Customers
INSERT INTO Customers (CustomerID, Name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'Diana');

-- 5. Insert sample data into Orders
INSERT INTO Orders (OrderID, CustomerID, Product) VALUES
(101, 1, 'Laptop'),
(102, 1, 'Mouse'),
(103, 2, 'Keyboard'),
(104, 5, 'Monitor'); -- This order has no matching customer (simulates orphaned data)

-- 6. INNER JOIN
SELECT 'INNER JOIN' AS JoinType, c.Name, o.Product
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;

-- 7. LEFT JOIN
SELECT 'LEFT JOIN' AS JoinType, c.Name, o.Product
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- 8. Simulated RIGHT JOIN (using LEFT JOIN with tables reversed)
SELECT 'SIMULATED RIGHT JOIN' AS JoinType, c.Name, o.Product
FROM Orders o
LEFT JOIN Customers c ON o.CustomerID = c.CustomerID;

-- 9. Simulated FULL OUTER JOIN (UNION of LEFT and RIGHT)
SELECT 'FULL OUTER JOIN' AS JoinType, c.Name, o.Product
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID

UNION

SELECT 'FULL OUTER JOIN' AS JoinType, c.Name, o.Product
FROM Orders o
LEFT JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.CustomerID IS NULL;
