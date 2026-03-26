CREATE DATABASE EcommerceDB;
USE Ecommercedb;

CREATE TABLE Customers (
    CustomerId INT,
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    Email VARCHAR(100)
);


CREATE TABLE Products (
    ProductId INT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);




CREATE TABLE Orders (
    OrderId INT,
    CustomerId INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2)
);

CREATE TABLE OrderItems (
    OrderItemId INT,
    OrderId INT,
    ProductId INT,
    Quantity INT
);



ALTER TABLE Customers ADD PRIMARY KEY (CustomerId);
ALTER TABLE Products ADD PRIMARY KEY (ProductId);
ALTER TABLE Orders ADD PRIMARY KEY (OrderId);
ALTER TABLE OrderItems ADD PRIMARY KEY (OrderItemId);




ALTER TABLE Orders ADD CONSTRAINT fk_orders_customers FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId);
ALTER TABLE OrderItems ADD CONSTRAINT fk_orderitems_orders FOREIGN KEY (OrderId) REFERENCES Orders(OrderId);
ALTER TABLE OrderItems ADD CONSTRAINT fk_orderitems_products FOREIGN KEY (ProductId) REFERENCES Products(ProductId);


INSERT INTO Customers VALUES (1,'Arun','Chennai','arun@gmail.com');
INSERT INTO Customers VALUES (2,'Bhavana','Bangalore','bhavana@gmail.com');
INSERT INTO Customers VALUES (3,'Chitra','Mumbai','chitra@gmail.com');
INSERT INTO Customers VALUES (4,'Dinesh','Delhi','dinesh@gmail.com');
INSERT INTO Customers VALUES (5,'Esha','Chennai','esha@gmail.com');
INSERT INTO Customers VALUES (6,'Fahad','Bangalore',NULL);

INSERT INTO Products VALUES (1,'Laptop','Electronics',50000);
INSERT INTO Products VALUES (2,'Chair','Furniture',3000);
INSERT INTO Products VALUES (3,'Smartphone','Electronics',25000);
INSERT INTO Products VALUES (4,'Table','Furniture',4500);
INSERT INTO Products VALUES (5,'Headphones','Accessories',1500);



INSERT INTO Orders VALUES (1,1,'2024-03-01',55000);
INSERT INTO Orders VALUES (2,2,'2024-03-05',3500);
INSERT INTO Orders VALUES (3,3,'2024-03-10',25000);
INSERT INTO Orders VALUES (4,4,'2024-03-12',4500);
INSERT INTO Orders VALUES (5,5,'2024-03-15',2000);

INSERT INTO OrderItems VALUES (1,1,1,1);
INSERT INTO OrderItems VALUES (2,1,5,2);
INSERT INTO OrderItems VALUES (3,2,2,1);
INSERT INTO OrderItems VALUES (4,3,3,1);
INSERT INTO OrderItems VALUES (5,4,4,1);
INSERT INTO OrderItems VALUES (6,5,5,1);






SELECT Quantity * 1000 AS EstimatedTotal FROM OrderItems;
SELECT Price + 500 AS PriceAfterAddition FROM Products;
SELECT Price - 200 AS PriceAfterSubtraction FROM Products;
SELECT Quantity * 2 AS DoubleQuantity FROM OrderItems;
SELECT TotalAmount / 2 AS HalfAmount FROM Orders;




SELECT * FROM Orders WHERE TotalAmount > 10000;
SELECT * FROM Products WHERE Price < 5000;
SELECT * FROM Orders WHERE TotalAmount >= 25000;
SELECT * FROM Products WHERE Price <= 8000;
SELECT * FROM Customers WHERE City = 'Chennai';
SELECT * FROM Customers WHERE City <> 'Delhi';





SELECT * FROM Customers WHERE City='Bangalore' AND CustomerName LIKE 'A%';
SELECT * FROM Products WHERE Category='Electronics' OR Category='Furniture';
SELECT * FROM Orders WHERE TotalAmount > 5000 AND TotalAmount < 70000;
SELECT * FROM Customers WHERE City <> 'Mumbai';
SELECT * FROM Products WHERE Category <> 'Accessories';

SELECT * FROM Products WHERE Category IN ('Electronics','Furniture');
SELECT * FROM Customers WHERE City NOT IN ('Chennai','Bangalore');
SELECT * FROM Orders WHERE TotalAmount BETWEEN 5000 AND 60000;
SELECT * FROM Orders WHERE TotalAmount NOT BETWEEN 5000 AND 60000;
SELECT * FROM Customers WHERE CustomerName LIKE '%a';
SELECT * FROM Products WHERE ProductName LIKE 'M%';
SELECT * FROM Customers WHERE Email IS NULL;
SELECT * FROM Customers WHERE Email IS NOT NULL;





SELECT * FROM Customers WHERE City='Chennai';
SELECT * FROM Orders WHERE OrderDate > '2024-02-01';
SELECT * FROM Products WHERE Price > 10000;
SELECT * FROM OrderItems WHERE Quantity = 1;
SELECT * FROM Customers WHERE Email IS NULL;

SELECT * FROM Orders ORDER BY TotalAmount DESC;
SELECT * FROM Customers ORDER BY CustomerName ASC;
SELECT * FROM Products ORDER BY Price DESC;
SELECT * FROM Orders ORDER BY OrderDate ASC;

SELECT CustomerId, COUNT(*) AS TotalOrders FROM Orders GROUP BY CustomerId;
SELECT CustomerId, SUM(TotalAmount) AS TotalRevenue FROM Orders GROUP BY CustomerId;
SELECT CustomerId, AVG(TotalAmount) AS AverageOrderAmount FROM Orders GROUP BY CustomerId;
SELECT ProductId, SUM(Quantity) AS TotalQuantity FROM OrderItems GROUP BY ProductId;
SELECT Category, COUNT(*) AS ProductCount FROM Products GROUP BY Category;







SELECT CustomerId, SUM(TotalAmount) AS TotalRevenue FROM Orders GROUP BY CustomerId HAVING SUM(TotalAmount) > 50000;
SELECT CustomerId, COUNT(*) AS OrderCount FROM Orders GROUP BY CustomerId HAVING COUNT(*) > 1;
SELECT ProductId, SUM(Quantity) AS TotalSold FROM OrderItems GROUP BY ProductId HAVING SUM(Quantity) > 1;
SELECT Category, COUNT(*) AS CategoryCount FROM Products GROUP BY Category HAVING COUNT(*) > 1;
SELECT CustomerId, AVG(TotalAmount) AS AvgAmount FROM Orders GROUP BY CustomerId HAVING AVG(TotalAmount) > 20000;









SELECT CustomerId, SUM(TotalAmount) AS TotalRevenue FROM Orders GROUP BY CustomerId HAVING SUM(TotalAmount) > 50000;
SELECT CustomerId, COUNT(*) AS OrderCount FROM Orders GROUP BY CustomerId HAVING COUNT(*) > 1;
SELECT ProductId, SUM(Quantity) AS TotalSold FROM OrderItems GROUP BY ProductId HAVING SUM(Quantity) > 1;
SELECT Category, COUNT(*) AS CategoryCount FROM Products GROUP BY Category HAVING COUNT(*) > 1;
SELECT CustomerId, AVG(TotalAmount) AS AvgAmount FROM Orders GROUP BY CustomerId HAVING AVG(TotalAmount) > 20000;



SELECT c.CustomerName, SUM(o.TotalAmount) AS TotalAmount FROM Customers c JOIN Orders o ON c.CustomerId = o.CustomerId GROUP BY c.CustomerName;
SELECT p.ProductName, SUM(oi.Quantity) AS QuantitySold FROM Products p JOIN OrderItems oi ON p.ProductId = oi.ProductId GROUP BY p.ProductName;
SELECT c.CustomerName, o.OrderDate, o.TotalAmount FROM Customers c JOIN Orders o ON c.CustomerId = o.CustomerId;
SELECT oi.OrderId, p.ProductName, oi.Quantity FROM OrderItems oi JOIN Products p ON oi.ProductId = p.ProductId;
SELECT o.OrderId, c.CustomerName, p.ProductName, oi.Quantity, o.TotalAmount FROM Orders o JOIN Customers c ON o.CustomerId = c.CustomerId JOIN OrderItems oi ON o.OrderId = oi.OrderId JOIN Products p ON oi.ProductId = p.ProductId;







SELECT c.CustomerName, SUM(o.TotalAmount) AS TotalRevenue FROM Customers c JOIN Orders o ON c.CustomerId = o.CustomerId GROUP BY c.CustomerName ORDER BY TotalRevenue DESC;
SELECT p.ProductName, SUM(oi.Quantity) AS TotalSold FROM Products p JOIN OrderItems oi ON p.ProductId = oi.ProductId GROUP BY p.ProductName ORDER BY TotalSold DESC;
SELECT * FROM Customers WHERE Email IS NULL;
SELECT DATE_FORMAT(OrderDate,'%Y-%m') AS Month, SUM(TotalAmount) AS MonthlyRevenue FROM Orders GROUP BY Month;
SELECT * FROM Orders WHERE TotalAmount > 20000;
SELECT p.ProductName FROM Products p LEFT JOIN OrderItems oi ON p.ProductId = oi.ProductId WHERE oi.ProductId IS NULL;
SELECT * FROM Customers c LEFT JOIN Orders o ON c.CustomerId = o.CustomerId WHERE o.OrderId IS NULL;
SELECT c.CustomerName, SUM(o.TotalAmount) AS TotalRevenue FROM Customers c JOIN Orders o ON c.CustomerId = o.CustomerId GROUP BY c.CustomerName ORDER BY TotalRevenue DESC LIMIT 3;
SELECT p.Category, SUM(oi.Quantity * p.Price) AS CategorySales FROM Products p JOIN OrderItems oi ON p.ProductId = oi.ProductId GROUP BY p.Category;
SELECT c.CustomerName, AVG(o.TotalAmount) AS AverageOrderValue FROM Customers c JOIN Orders o ON c.CustomerId = o.CustomerId GROUP BY c.CustomerName;