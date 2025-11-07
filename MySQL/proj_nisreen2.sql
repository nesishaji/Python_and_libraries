create database OnlineShopping2;
use OnlineShopping2;
create table Products(
ProductID int primary key,
Name varchar(100) not null,
Price int not null,
Stock int,
category varchar(100));
create table Customers(
CustomerID int primary key,
Cust_Name varchar(100) not null,
Cust_Email varchar(100) unique,
Cust_Phone int unique);
create table Orders(
OrderID int primary key,
CustomerID int, foreign key(CustomerID) references Customers(CustomerID),
OrderDate date,
Total_Amount int not null);
create table OrderDetails(
Order_detailID int,
OrderID int,foreign key(OrderID) references Orders(OrderID),
ProductID int, foreign key(ProductID) references Products(ProductID),
Quantity int);
insert into Products(ProductID, Name, Price, Stock, category) values
(001, "Wireless Mouse",	25.99, 120, "Electronics"),
(002, "Laptop Backpack", 45.50, 80,	"Accessories"),
(003, "Bluetooth Speaker", 60.00, 60,	"Electronics"),
(004, "Coffee Mug",	12.75,	150,	"Home & Kitchen"),
(005, "USB-C Cable", 8.99, 300,	"Electronics");
insert into Customers(CustomerID, Cust_Name, Cust_Email, Cust_Phone) values
(101, "Alice Johnson", "alice.johnson@email.com", 04940143),
(102, "Brian Smith", "brian.smith@email.com", 04940176),
(103,	"Catherine Lee", "catherine.lee@email.com", 04940112),
(104, "David Martinez", "david.martinez@email.com", 04940198),
(105, "Emily Thompson", "emily.thompson@email.com", 04940134);
insert into Orders(OrderID, CustomerID, OrderDate, Total_Amount) values
(1001, 101,	"2025-10-15", 250.75),
(1002, 102,	"2025-10-18", 480.50),
(1003, 103,	"2025-10-20", 120.00),
(1004, 104,	"2025-11-01", 310.25),
(1005, 105,	"2025-11-05", 890.90);
insert into OrderDetails(Order_detailID, OrderID, ProductID, Quantity) values
(01, 1001, 001, 2),
(02, 1001, 005, 3),
(03, 1002, 002, 1),
(04, 1003, 003, 2),
(05, 1005, 004, 5);
use onlineshopping2;
select * from orderdetails order by Quantity asc;
select * from orderdetails order by Quantity desc;
select * from Products cross join OrderDetails;
select Products.Name, OrderDetails.Quantity from Products left outer join Orderdetails on Products.ProductID = Orderdetails.ProductID;
 select Products.Name, OrderDetails.Quantity from Products left outer join Orderdetails on Products.ProductID = Orderdetails.ProductID order by Quantity desc;
 select Products.Name, Price, OrderDetails.Quantity from Products left outer join Orderdetails on Products.ProductID = Orderdetails.ProductID;
select sum(Total_Amount) as Total_Revenue from Orders;
select * from Orders where OrderDate between "2025-10-07" and "2025-11-07";