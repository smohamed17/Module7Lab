-- this is finding out the company name and phone numbers from the shippers

SELECT CompanyName, Phone FROM Shippers;
-- limiting by 5 for the customer's company name, city, and country and sorting by city first 
SELECT CompanyName, City, Country FROM Customers ORDER BY City LIMIT 5;

--filtering the rows here 

SELECT OrderID, OrderDate, ShipCity FROM Orders
WHERE CustomerID = 'ANATR';
-- this is focusing on the joining two tables method. 
SELECT c.CompanyName, o.OrderDate FROM Customers 
AS c JOIN Orders AS o ON c.CustomerID = o.CustomerID 
WHERE c.CompanyName = 'Around the Horn' LIMIT 5;

-- now we are adding a row to these statements. 
DELETE FROM Customers WHERE CustomerID = 'STUD1';
INSERT INTO Customers (CustomerID, ContactName, CompanyName, Country) VALUES 
('STUD1', 'Said M', 'Starlight LLC', 'USA');
SELECT * FROM Customers WHERE CustomerID = 'STUD1';

-- we are now updating the statement for the phone. 
UPDATE Customers SET Phone = '555-0100'
WHERE CustomerID = 'STUD1';
SELECT CustomerID, ContactName, Phone FROM Customers WHERE CustomerID = 'STUD1';

-- Now we're deleting the row all together. 
DELETE FROM Customers WHERE CustomerID = 'STUD1';
SELECT * FROM Customers WHERE CustomerID = 'STUD1';
