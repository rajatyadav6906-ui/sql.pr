create database ecommerce_management;
use ecommerce_management;

CREATE TABLE Categories (
  category_id INT PRIMARY KEY,
  category_name VARCHAR(50)
);


CREATE TABLE Products (
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
price DECIMAL(10,2),
category_id INT,
stock_quantity int,
added_date date,
FOREIGN KEY (category_id) references Categories(category_id)
);

CREATE TABLE Customers (
customer_id INT PRIMARY KEY,
name VARCHAR(50),
email VARCHAR(100) UNIQUE,
phone_number VARCHAR(10) UNIQUE,
ragistration_date date
);

CREATE TABLE Orders (
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
total_amount DECIMAL(10,2),
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_items (
  order_item_id INT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  subtotal decimal(10,2),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE Payments (
  payment_id INT PRIMARY KEY,
  order_id INT,
  payment_date DATE,
  payment_method VARCHAR(100),
  payment_status VARCHAR(100),
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE Shipping (
  shipping_id INT PRIMARY KEY,
  order_id INT,
  delivery_date DATE,
  shipping_date DATE,
  shipping_status VARCHAR(50),
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO Categories VALUES
(1,'Electronics'),
(2,'Clothing'),
(3,'Books'),
(4,'Home'),
(5,'Beauty'),
(6,'Sports'),
(7,'Toys'),
(8,'Grocery'),
(9,'Furniture'),
(10,'Accessories');

INSERT INTO Products VALUES
(101,'Laptop',50000,1,10,'2026-05-01'),
(102,'Mobile',20000,1,25,'2026-05-02'),
(103,'T-Shirt',500,2,100,'2026-05-03'),
(104,'Jeans',1500,2,60,'2026-05-04'),
(105,'SQL Book',800,3,40,'2026-05-05'),
(106,'Chair',3000,9,15,'2026-05-06'),
(107,'Face Cream',700,5,80,'2026-05-07'),
(108,'Football',1200,6,50,'2026-05-08'),
(109,'Toy Car',900,7,70,'2026-05-09'),
(110,'Watch',2500,10,30,'2026-05-10');

INSERT INTO Customers VALUES
(1,'Amit Sharma','amit@gmail.com','9876543210','2026-04-01'),
(2,'Neha Patel','neha@gmail.com','9876543211','2026-04-02'),
(3,'Rahul Mehta','rahul@gmail.com','9876543212','2026-04-03'),
(4,'Priya Shah','priya@gmail.com','9876543213','2026-04-04'),
(5,'Karan Verma','karan@gmail.com','9876543214','2026-04-05'),
(6,'Sneha Iyer','sneha@gmail.com','9876543215','2026-04-06'),
(7,'Rohit Singh','rohit@gmail.com','9876543216','2026-04-07'),
(8,'Anjali Gupta','anjali@gmail.com','9876543217','2026-04-08'),
(9,'Vikas Jain','vikas@gmail.com','9876543218','2026-04-09'),
(10,'Pooja Nair','pooja@gmail.com','9876543219','2026-04-10');

INSERT INTO Orders VALUES
(1001,1,'2026-05-01',51000),
(1002,2,'2026-05-02',20000),
(1003,3,'2026-05-03',1500),
(1004,4,'2026-05-04',1500),
(1005,5,'2026-05-05',1600),
(1006,6,'2026-05-06',3000),
(1007,7,'2026-05-07',1400),
(1008,8,'2026-05-08',1200),
(1009,9,'2026-05-09',2700),
(1010,10,'2026-05-10',2500);

INSERT INTO Order_items VALUES
(1,1001,101,1,50000),
(2,1010,103,2,1000),
(3,1002,102,1,20000),
(4,1003,103,3,1500),
(5,1004,104,1,1500),
(6,1005,105,2,1600),
(7,1006,106,1,3000),
(8,1007,107,2,1400),
(9,1008,108,1,1200),
(10,1009,109,3,2700);

INSERT INTO Payments VALUES
(1,1001,'2026-05-01','Credit Card','Completed'),
(2,1002,'2026-05-02','UPI','Completed'),
(3,1003,'2026-05-03','Debit Card','Completed'),
(4,1004,'2026-05-04','Net Banking','Completed'),
(5,1005,'2026-05-05','UPI','Pending'),
(6,1006,'2026-05-06','Credit Card','Completed'),
(7,1007,'2026-05-07','Cash on Delivery','Pending'),
(8,1008,'2026-05-08','Debit Card','Completed'),
(9,1009,'2026-05-09','UPI','Failed'),
(10,1010,'2026-05-10','Net Banking','Completed');

INSERT INTO Shipping VALUES
(1,1001,'2026-05-05','2026-05-02','Delivered'),
(2,1002,'2026-05-06','2026-05-03','Delivered'),
(3,1003,'2026-05-07','2026-05-04','In Transit'),
(4,1004,'2026-05-08','2026-05-05','Delivered'),
(5,1005,'2026-05-09','2026-05-06','Pending'),
(6,1006,'2026-05-10','2026-05-07','Delivered'),
(7,1007,'2026-05-11','2026-05-08','In Transit'),
(8,1008,'2026-05-12','2026-05-09','Delivered'),
(9,1009,'2026-05-13','2026-05-10','Cancelled'),
(10,1010,'2026-05-14','2026-05-11','Delivered');

#CRUD Operations
INSERT INTO Products VALUES 
(111,'Tablet',30000,1,20,'2026-05-11'),
(112,'Bluetooth Speaker',2500,1,35,'2026-05-12'),
(113,'Shirt',1200,2,80,'2026-05-13'),
(114,'Jacket',3000,2,40,'2026-05-14'),
(115,'Python Book',900,3,50,'2026-05-15'),
(116,'Sofa',15000,9,10,'2026-05-16'),
(117,'Perfume',2000,5,60,'2026-05-17'),
(118,'Cricket Bat',1800,6,25,'2026-05-18'),
(119,'Puzzle Game',700,7,45,'2026-05-19'),
(120,'Sunglasses',2200,10,30,'2026-05-20');

INSERT INTO Customers VALUES 
(11,'Arjun Kapoor','arjun@gmail.com','9876543220','2026-04-11'),
(12,'Meera Joshi','meera@gmail.com','9876543221','2026-04-12'),
(13,'Sanjay Desai','sanjay@gmail.com','9876543222','2026-04-13'),
(14,'Kavita Nair','kavita@gmail.com','9876543223','2026-04-14'),
(15,'Ramesh Gupta','ramesh@gmail.com','9876543224','2026-04-15'),
(16,'Divya Sharma','divya@gmail.com','9876543225','2026-04-16'),
(17,'Manoj Kumar','manoj@gmail.com','9876543226','2026-04-17'),
(18,'Pallavi Shah','pallavi@gmail.com','9876543227','2026-04-18'),
(19,'Deepak Verma','deepak@gmail.com','9876543228','2026-04-19'),
(20,'Nikita Singh','nikita@gmail.com','9876543229','2026-04-20');

INSERT INTO Orders VALUES
(1011,11,'2026-05-11',30000),
(1012,12,'2026-05-12',2500),
(1013,13,'2026-05-13',1200),
(1014,14,'2026-05-14',3000),
(1015,15,'2026-05-15',900),
(1016,16,'2026-05-16',15000),
(1017,17,'2026-05-17',2000),
(1018,18,'2026-05-18',1800),
(1019,19,'2026-05-19',700),
(1020,20,'2026-05-20',2200);

select * from Shipping;
delete from Shipping 
where shipping_status = "Cancelled"
and  shipping_date < date_sub(curdate(), interval 30 day)
and shipping_id > 0;

#Find all orders placed in the last 6 months
SELECT *
FROM Orders
WHERE order_date >= DATE_SUB(CURDATE(), interval 6 MONTH);

#Get the top 5 highest-priced products.
select product_name ,price
from Products
order by price desc
limit 5;

#find customers who have placed more than 3 orders.
select customer_id, count(order_id) as total_orders
from Orders
group by customer_id
having count(order_id) > 3;

show tables;
select  * from Order_items;

SELECT o.*
FROM Orders o
JOIN Payments p ON o.order_id = p.order_id
WHERE p.payment_status IN ('Pending', 'Completed');

SELECT *
FROM Products
WHERE stock_quantity > 0;

SELECT *
FROM Customers
WHERE ragistration_date > '2022-12-31'
   OR customer_id IN (
       SELECT customer_id
       FROM Orders
       WHERE total_amount > 10000
   );
   
select * from Products
order by price desc;

select customer_id , count(order_id) as total_orders
from Orders
group by customer_id;

SELECT c.category_name, SUM(oi.subtotal) AS total_revenue
FROM Categories c
JOIN Products p ON c.category_id = p.category_id
JOIN Order_items oi ON p.product_id = oi.product_id
GROUP BY c.category_name;

SELECT SUM(subtotal) AS total_revenue
FROM Order_items;

SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM Products p
JOIN Order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 1;

SELECT AVG(total_amount) AS avg_order_value
FROM Orders;

SELECT o.order_id, c.name, p.product_name, oi.quantity
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Order_items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id;

SELECT o.order_id, p.payment_id, p.payment_status
FROM Orders o
JOIN Payments p ON o.order_id = p.order_id;

select p.product_name, c.category_name
from Products p
inner join categories c 
on p.category_id = c.category_id;

SELECT o.order_id, c.name, o.order_date, o.total_amount
FROM Orders o
LEFT JOIN Customers c 
ON o.customer_id = c.customer_id;

SELECT o.order_id, s.shipping_status
FROM Shipping s
RIGHT JOIN Orders o 
ON s.order_id = o.order_id
WHERE s.shipping_id IS NULL;

SELECT c.customer_id, c.name
FROM Customers c
LEFT JOIN Orders o 
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

SELECT *
FROM Orders
WHERE customer_id IN (
    SELECT customer_id
    FROM Customers
    WHERE ragistration_date > '2022-12-31'
);

SELECT customer_id, SUM(total_amount) AS total_spent
FROM Orders
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 1;

SELECT product_name
FROM Products
WHERE product_id NOT IN (
    SELECT product_id FROM Order_items
);

SELECT MONTH(order_date) AS month, COUNT(*) AS total_orders
FROM Orders
GROUP BY MONTH(order_date);

SELECT order_id, 
DATEDIFF(delivery_date, shipping_date) AS delivery_days
FROM Shipping;

SELECT order_id, 
DATE_FORMAT(order_date, '%d-%m-%Y') AS formatted_date
FROM Orders;

SELECT UPPER(product_name) AS product_name
FROM Products;

SELECT TRIM(name) 
FROM Customers;

SELECT name, 
IFNULL(email, 'Not Provided') AS email
FROM Customers;

SELECT customer_id, 
SUM(total_amount) AS total_spent,
RANK() OVER (ORDER BY SUM(total_amount) DESC) AS rnk
FROM Orders
GROUP BY customer_id;

SELECT MONTH(order_date) AS month,
SUM(total_amount) AS monthly_revenue,
SUM(SUM(total_amount)) OVER (ORDER BY MONTH(order_date)) AS cumulative_revenue
FROM Orders
GROUP BY MONTH(order_date);

SELECT order_id, order_date,
COUNT(order_id) OVER (ORDER BY order_date) AS running_total_orders
FROM Orders;

SELECT c.customer_id, c.name,
SUM(o.total_amount) AS total_spent,
CASE
    WHEN SUM(o.total_amount) > 50000 THEN 'Gold'
    WHEN SUM(o.total_amount) BETWEEN 20000 AND 50000 THEN 'Silver'
    ELSE 'Bronze'
END AS loyalty_status
FROM Customers c
LEFT JOIN Orders o 
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

SELECT p.product_name,
SUM(oi.quantity) AS total_sold,
CASE
    WHEN SUM(oi.quantity) > 500 THEN 'Best Seller'
    WHEN SUM(oi.quantity) BETWEEN 200 AND 500 THEN 'Popular'
    ELSE 'Regular'
END AS product_status
FROM Products p
LEFT JOIN Order_items oi 
ON p.product_id = oi.product_id
GROUP BY p.product_name;


