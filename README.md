SQL Joins (Inner, Left, Right, Full):

Objective:
Learn how to combine data from two related tables using different types of SQL joins. This helps you extract meaningful combined information from a database.

Tools:
DB Browser for SQLite – Lightweight tool to run SQL locally
MySQL Workbench – Professional tool for MySQL database management

Tables Involved:
Two example tables:

Customers – holds customer information
Orders – holds order details, linked to customers


Customers
+------------+-------+
| CustomerID | Name  |
+------------+-------+
| 1          | Alice |
| 2          | Bob   |
| 3          | Charlie |
| 4          | Diana |
+------------+-------+

Orders
+---------+------------+----------+
| OrderID | CustomerID | Product  |
+---------+------------+----------+
| 101     | 1          | Laptop   |
| 102     | 1          | Mouse    |
| 103     | 2          | Keyboard |
| 104     | 5          | Monitor  | ← Orphan order (no matching customer)
+---------+------------+----------+

Types of Joins Practiced:
1. INNER JOIN
Shows only matching records in both tables.
SELECT c.Name, o.Product
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;
✅ Output: Only customers who placed an order.

2. LEFT JOIN
Shows all customers, even if they didn’t place an order.
SELECT c.Name, o.Product
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;
✅ Output: All customers; if no order, product is NULL.

3. Simulated RIGHT JOIN (Not in SQLite)
Shows all orders, even if the customer doesn’t exist (like CustomerID = 5).
SELECT c.Name, o.Product
FROM Orders o
LEFT JOIN Customers c ON o.CustomerID = c.CustomerID;

4. Simulated FULL OUTER JOIN
Combines both LEFT and RIGHT JOIN using UNION.
Shows all records from both tables, matched or unmatched.
SELECT c.Name, o.Product
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID

UNION

SELECT c.Name, o.Product
FROM Orders o
LEFT JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.CustomerID IS NULL;

✅ Outcome / Learning Goals:
By the end of this task, We will:

-->Understand the difference between INNER, LEFT, RIGHT, and FULL joins.
-->Know how to write and run join queries in SQL.
-->Be able to apply joins to real-world problems like sales reports, inventory management, etc.
