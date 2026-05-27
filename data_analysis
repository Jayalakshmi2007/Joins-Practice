CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Product VARCHAR(50),
    Category VARCHAR(50),
    Amount DECIMAL(10,2),
    Order_Date DATE
);

INSERT INTO Customers VALUES
(1, 'Ravi', 'Hyderabad'),
(2, 'Sita', 'Vijayawada'),
(3, 'Arun', 'Chennai'),
(4, 'Meena', 'Bangalore');

INSERT INTO Orders VALUES
(101, 1, 'Laptop', 'Electronics', 55000, '2026-01-10'),
(102, 2, 'Mobile', 'Electronics', 20000, '2026-01-15'),
(103, 1, 'Shoes', 'Fashion', 3000, '2026-02-05'),
(104, 3, 'Watch', 'Accessories', 5000, '2026-02-12'),
(105, 2, 'Laptop', 'Electronics', 60000, '2026-03-01'),
(106, 4, 'Bag', 'Fashion', 2500, '2026-03-08'),
(107, 1, 'Mobile', 'Electronics', 18000, '2026-03-15');

-- 3. Total Sales by Category--

SELECT Category,
       SUM(Amount) AS Total_Sales
FROM Orders
GROUP BY Category
ORDER BY Total_Sales DESC;

-- 4. Monthly Sales--

SELECT MONTH(Order_Date) AS Month,
       SUM(Amount) AS Monthly_Sales
FROM Orders
GROUP BY MONTH(Order_Date)
ORDER BY Month;

-- 5. Top Customers by Sales--

SELECT C.Customer_Name,
       SUM(O.Amount) AS Total_Purchase
FROM Customers C
JOIN Orders O
ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_Name
ORDER BY Total_Purchase DESC;

-- 6. Average Order Value by Category

SELECT Category,
       AVG(Amount) AS Average_Order_Value
FROM Orders
GROUP BY Category;

-- 7. Customers with More Than One Order

SELECT C.Customer_Name,
       COUNT(O.Order_ID) AS Number_Of_Orders
FROM Customers C
JOIN Orders O
ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_Name
HAVING COUNT(O.Order_ID) > 1;
