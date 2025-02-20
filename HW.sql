create database RetailStoreDB;
use RetailStoreDB;

create table Customers(
CustomerID INT PRIMARY KEY IDENTITY, 
FirstName NVARCHAR(100), 
LastName NVARCHAR(100),
Email NVARCHAR(100),
RegistrationDate DATE
)

create table Products(
ProductID INT PRIMARY KEY IDENTITY, 
ProductName NVARCHAR(100), 
Category NVARCHAR(100),
Price FLOAT,
StockQuantity INT
)

create table Orders(
OrderID INT PRIMARY KEY IDENTITY, 
CustomerID INT,
ProductID  INT,
OrderDate Date, 
Quantity INT,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
)

INSERT INTO Customers (FirstName, LastName, Email, RegistrationDate) VALUES
('John', 'Doe', 'johndoe@email.com', '2023-01-15'),
('Jane', 'Smith', 'janesmith@email.com', '2023-02-20'),
('Michael', 'Brown', 'michaelbrown@email.com', '2023-03-05'),
('Emily', 'Davis', 'emilydavis@email.com', '2023-04-10'),
('David', 'Wilson', 'davidwilson@email.com', '2023-05-18');

INSERT INTO Products (ProductName, Category, Price, StockQuantity) VALUES
('Laptop', 'Electronics', 899.99, 15),
('Smartphone', 'Electronics', 599.99, 30),
('Headphones', 'Accessories', 49.99, 50),
('Backpack', 'Bags', 39.99, 20),
('Coffee Maker', 'Home Appliances', 79.99, 25);

INSERT INTO Orders (CustomerID, ProductID, OrderDate, Quantity) VALUES
(1, 1, '2024-01-05', 1),  
(2, 2, '2024-01-07', 2),  
(3, 3, '2024-01-10', 1), 
(4, 4, '2024-01-15', 3),  
(5, 5, '2024-01-20', 1);

select * 
from Customers;

select * 
from Products;

select * 
from Orders;

select * 
from Customers
where RegistrationDate > '2023-03-05';

select Top 3*
from Products
order by Price Desc;

select orders.CustomerID, orders.ProductID, OrderDate, Quantity, concat(FirstName,' ', LastName) as CustomerName,ProductName, Category, Price
from orders
inner join Customers
on orders.CustomerID=Customers.CustomerID
inner join Products
on orders.ProductID=Products.ProductID;

select  concat(FirstName,' ', LastName) as CustomerName, (Quantity*Price) as Amount
from orders
inner join Customers
on orders.CustomerID=Customers.CustomerID
inner join Products
on orders.ProductID=Products.ProductID;

INSERT INTO Orders (CustomerID, ProductID, OrderDate, Quantity) VALUES
(1, 2, '2024-09-05', 3)

select count(orders.OrderID) as numberoforders , concat(FirstName,' ', LastName) as CustomerName
from orders,Customers
where Orders.CustomerID=Customers.CustomerID
group by FirstName,LastName;

select ProductName, sum(Quantity*Price) as totalsales
from orders,products
where Orders.ProductID = products.ProductID
group by ProductName;