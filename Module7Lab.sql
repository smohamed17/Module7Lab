-- Module 7 Lab by Said 
-- Getting SELECT query data from the shippers table

SELECT * FROM Shippers;

-- Adding more queries to the database. Sorting rows. 
SELECT ContactName, Country, Phone FROM Customers
ORDER BY Country, ContactName LIMIT 5;

-- Filtering rows using the WHERE clause. 
SELECT CustomerID, OrderDate, ShipCity FROM Orders
WHERE CustomerID = 'ALFKI';

-- Collecting or retrieving data from two different tables using JOIN
SELECT c.CompanyName, o.OrderDate FROM Customers AS c
JOIN Orders AS o ON c.CustomerID = o.CustomerID 
WHERE c.CompanyName = 'QUICK-Stop' LIMIT 5; 

-- Attempting to modify data. Adding a row by using INSERT
INSERT INTO Customers (CustomerID, ContactName, CompanyName, Country)
VALUES ('ALICE','Alice Johnson', 'Wonderful Widgets', 'USA');

-- using the SELECT statement to retrieve the new record that was added earlier. 
SELECT * FROM Customers WHERE CustomerID = 'ALICE';

-- Changing a row using thr UPDATE statement 
UPDATE Customers SET ContactName = 'Maria Anders'
WHERE CustomerID = 'ALFKI';

-- using the SELECT statement to check to see if it is okay. 
SELECT CustomerID, ContactName FROM Customers WHERE CustomerID = 'ALFKI';

-- creating a DELETE statement. 
INSERT INTO Customers (CustomerID, ContactName, CompanyName, Country)
VALUES ('TEMP1', 'Tom Temp', 'Temporary Traders', 'USA');

SELECT * FROM Customers WHERE CustomerID = 'TEMP1';
-- WHERE is important because otherwise you'll delete the whole table. 
DELETE FROM Customers WHERE CustomerID = 'TEMP1';

SELECT * FROM Customers WHERE CustomerID = 'TEMP1';
