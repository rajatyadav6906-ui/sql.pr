## E-commerce Management System (SQL Project)
 # Project Overview

This project implements an E-commerce Management System using SQL.
It manages products, customers, orders, payments, and shipping details in a structured relational database.

# Database Structure

Database Name: ecommerce_management

# Tables Included:
Categories
category_id (Primary Key)
category_name
Products
product_id (Primary Key)
product_name
price
category_id (Foreign Key)
stock_quantity
added_date
Customers
customer_id (Primary Key)
name
email (UNIQUE)
phone_number (UNIQUE)
registration_date
Orders
order_id (Primary Key)
customer_id (Foreign Key)
order_date
total_amount
Order_items
order_item_id (Primary Key)
order_id (Foreign Key)
product_id (Foreign Key)
quantity
subtotal
Payments
payment_id (Primary Key)
order_id (Foreign Key)
payment_date
payment_method
payment_status
Shipping
shipping_id (Primary Key)
order_id (Foreign Key)
delivery_date
shipping_date
shipping_status

# Key Features
Relational database design using Primary and Foreign Keys
CRUD operations (Create, Read, Update, Delete)
Real-world E-commerce data modeling
Advanced SQL queries
Use of Window Functions for analytics

# Operations Performed
 Create
Database and tables creation
Data insertion into all tables

 Read
Data retrieval using SELECT queries
Joins and Subqueries

Update
Can be extended for updating records
 Delete
 
DELETE FROM Shipping 
WHERE shipping_status = "Cancelled"
AND shipping_date < DATE_SUB(CURDATE(), INTERVAL 30 DAY);

Important Queries
1. Orders from the last 6 months
SELECT * 
FROM Orders
WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

 3. Top 5 highest-priced products
SELECT product_name, price
FROM Products
ORDER BY price DESC

LIMIT 5;
 3. Customers with more than 3 orders
SELECT customer_id, COUNT(order_id)
FROM Orders
GROUP BY customer_id
HAVING COUNT(order_id) > 3;

 4. Total Revenue
SELECT SUM(subtotal) AS total_revenue
FROM Order_items;

 6. Best Selling Product
SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM Products p
JOIN Order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 1;

# Joins Used
INNER JOIN
LEFT JOIN
RIGHT JOIN
Example:
SELECT o.order_id, c.name, p.product_name
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Order_items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id;
 Advanced SQL Features
Window Function (RANK)
SELECT customer_id,
SUM(total_amount),
RANK() OVER (ORDER BY SUM(total_amount) DESC)
FROM Orders
GROUP BY customer_id;
## Running Total
SELECT order_id, order_date,
COUNT(order_id) OVER (ORDER BY order_date)
FROM Orders;
## Business Insights
Customer segmentation (Gold / Silver / Bronze)
Product performance analysis
Monthly revenue tracking
Payment and shipping status tracking
## Use Cases
Online shopping platforms
Inventory management systems
Customer analytics
Sales tracking systems

This project demonstrates a complete E-commerce database system that efficiently handles:

Data storage
Data analysis
Business insights
