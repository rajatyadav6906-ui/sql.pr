# how this pr work every queries we will explain.
create database Ecommerce_dmart; 
use Ecommerce_dmart;

create table Customers (
Customer_id int primary key,
Name varchar(50) not null,
Email varchar(50) unique,
Address varchar(50)
);
insert into  Customers (Customer_id, Name, Email, Address) 
values
(1, 'John Smith', 'john.smith@gmail.com', 'New York, USA'),
(2, 'Emma Johnson', 'emma.johnson@gmail.com', 'London, UK'),
(3, 'Michael Brown', 'michael.brown@gmail.com', 'Toronto, Canada'),
(4, 'Sophia Davis', 'sophia.davis@gmail.com', 'Sydney, Australia'),
(5, 'Daniel Wilson', 'daniel.wilson@gmail.com', 'Chicago, USA');
 
select * from Customers;
# (select) means bring data from table..(*) all colums."Show me all the rows and all the columns from the Customers table." 

#Updating customer detail using customer id

update Customers  #update ka use hmm table mai change ment ke liye krte hai koi chij update  krni pde tb
set Address= 'California , USA'# set column ki value change krne ke liye use krte hai agr adress chnage krna hai to set ke age adrees dalo or set update mai hi use hoga bina eska nhi
where Customer_id = 1;# filteration ke liye use krte hai

#deleting Customers detail using id
delete from Customers 
where Customer_id = 5;
#finding customer name 'Alice'
select Name from Customers
where Name='Alice';

create table Orders (
Order_id int primary key,
Customer_id int,
Order_date date,
Total_Amount decimal(10,2),
foreign key (Customer_id) references Customers(Customer_id)# foreign key means unique value .. 
);
insert into Orders (Order_id, Customer_id, Order_date, Total_Amount) values
(101, 1, '2024-04-01', 250.50),
(102, 2, '2024-04-03', 120.00),
(103, 1, '2024-04-05', 75.99),
(104, 3, '2024-04-07', 300.75),
(105, 4, '2024-04-10', 450.00);

select * from Orders;
#trying to find Orders by Customer_id
select * from Orders
where Customer_id = 1;
#Increasing Total_Amount using update
UPDATE Orders
SET Total_Amount = Total_Amount +(Total_Amount  * 1.05)
WHERE Order_id > 0;


delete from Orders
where Order_id = 103;
select * from orders
where Order_date between '2024-04-01' and '2024-04-30';
select max(Total_Amount) as Higest_order,
min(Total_Amount) as Lowest_order,
avg(Total_Amount) as Avg_order
from Orders;

create table Products (
Product_id int primary key,
Product_Name varchar(50),
Price decimal(10,2),
Stock int 
);

insert into Products (Product_id, Product_Name,Price, Stock) values
(1, 'Laptop', 55000.00, 15),
(2, 'Mobile Phone', 20000.00, 30),
(3, 'Headphones', 1500.50, 50),
(4, 'Keyboard', 800.75, 25),
(5, 'Mouse', 500.00, 40);

select * from Products;
select * from Products
order by Price desc;

update Products
set price = 1000
where Product_id = 5;

select * from Products
where Price between 500 and 2000;

select * from Products
where price = (SELECT MAX(price) FROM products)
or price = (SELECT MIN(price) FROM products);

create table Order_Detail (
OrderDetail_id int primary key,
Order_id int,
Product_id int,
Quantity int,
Sub_Total decimal(10,2),
foreign key (Order_id)  references Orders(Order_id),
foreign key (Product_id) references Products(Product_id)
);

insert into Order_Detail (OrderDetail_id, Order_id, Product_id, Quantity, Sub_Total) 
values
(1, 101, 1, 1, 55000.00),
(2, 101, 5, 2, 1000.00),
(3, 102, 2, 1, 20000.00),
(4, 104, 3, 3, 4501.50),
(5, 105, 4, 2, 1601.50);

select * from Order_Detail;
select * from Order_Detail 
where Order_id = 101;

select sum(Sub_Total) as Total_revenue
from Order_Detail;


select Product_id, SUM(Quantity) as total_orders
from Order_Detail
group by Product_id
order by total_orders DESC
limit 3;