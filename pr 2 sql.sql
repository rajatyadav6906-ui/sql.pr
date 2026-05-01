create table Customers1 (
customer_id int primary key,
first_name varchar (50) not null,
last_name varchar(50) not null,
email varchar(50) unique,
registration_date date
);

insert into Customers1 (customer_id ,first_name, last_name, email ,registration_date)
values (1, 'John', 'Smith', 'john.smith@gmail.com', '2024-01-10'),
(2, 'Emma', 'Johnson', 'emma.johnson@gmail.com', '2024-02-15'),
(3, 'Michael', 'Brown', 'michael.brown@gmail.com', '2024-03-20'),
(4, 'Olivia', 'Davis', 'olivia.davis@gmail.com', '2024-04-05'),
(5, 'James', 'Wilson', 'james.wilson@gmail.com', '2024-05-12'),
(6, 'Sophia', 'Taylor', 'sophia.taylor@gmail.com', '2024-06-18'),
(7, 'William', 'Anderson', 'william.anderson@gmail.com', '2024-07-22'),
(8, 'Ava', 'Thomas', 'ava.thomas@gmail.com', '2024-08-30'),
(9, 'Benjamin', 'Moore', 'benjamin.moore@gmail.com', '2024-09-10'),
(10, 'Isabella', 'Martin', 'isabella.martin@gmail.com', '2024-10-25');

create table Orders1 (
order_id int primary key,
customer_id int ,
order_date date,
total_ammount decimal(10,2),
foreign key (customer_id) references Customers1(customer_id)
);

insert into Orders1 (order_id ,customer_id ,order_date ,total_ammount)
values (101, 1, '2024-01-15', 1200.50),
(102, 2, '2024-02-18', 850.00),
(103, 3, '2024-03-25', 2300.75),
(104, 1, '2024-04-10', 499.99),
(105, 5, '2024-05-05', 1500.00),
(106, 4, '2024-06-12', 999.00),
(107, 6, '2024-07-20', 2750.25),
(108, 2, '2024-08-08', 640.40),
(109, 7, '2024-09-14', 1800.00),
(110, 3, '2024-10-01', 2200.10);

select * from Customers1;
select * from Orders1;

select *
from Customers1 as c
inner join Orders1 as o
on c.customer_id = o.customer_id;

select * 
from Customers1 as c 
left join Orders1 as o
on c.customer_id = o.customer_id;

select * 
from Customers1 as c
right join Orders1 as o
on c.customer_id = o.customer_id;

select * 
from Customers1 as c
left join Orders1 as o
on c.customer_id = o.customer_id
union
select * 
from Customers1 as c
right join Orders1 as o
on c.customer_id = o.customer_id;

#Find customers who have placed orders worth more than the average amount”
select c.customer_id, c.first_name, o.total_ammount
from Customers1 c
join Orders1 o
on c.customer_id = o.customer_id
where o.total_ammount > (
    select avg(total_ammount)
    from Orders1
);

create table Employees1 (
emp_id int primary key,
first_name varchar(50),
last_name varchar(50),
department varchar(50),
hire_date date,
salary decimal(10,2)
);

insert into Employees1 (emp_id,first_name,last_name,department,hire_date,salary)
values(1, 'John', 'Smith', 'HR', '2020-01-15', 55000.00),
(2, 'Emma', 'Johnson', 'IT', '2019-03-22', 72000.00),
(3, 'Michael', 'Brown', 'Finance', '2021-07-10', 65000.00),
(4, 'Olivia', 'Davis', 'Marketing', '2018-11-05', 60000.00),
(5, 'James', 'Wilson', 'IT', '2022-02-18', 50000.00),
(6, 'Sophia', 'Taylor', 'HR', '2020-06-30', 58000.00),
(7, 'William', 'Anderson', 'Finance', '2017-09-12', 80000.00),
(8, 'Ava', 'Thomas', 'Marketing', '2021-04-25', 62000.00),
(9, 'Benjamin', 'Moore', 'IT', '2019-12-01', 75000.00),
(10, 'Isabella', 'Martin', 'HR', '2023-01-10', 48000.00);

#Employees with salaries above the avrage salary find using subquery
select first_name, last_name, salary 
from employees1
where salary > (select avg(salary)
				from Employees1);

#Extracting the year and month from the orderdate
select order_id,
year(order_date) as year, month(order_date) as month
from Orders1;

select order_id, order_date,
DATEDIFF(current_date, order_date) as days_difference
from Orders1;

select replace(first_name,'John', 'Jonathan') as update_name
from Customers1;


select order_id,
date_format(order_date, '%d-%b-%Y') as date
from Orders1;

select concat(first_name, ' ', last_name) as Full_Name
from Customers1;

select  upper(first_name) as first_name,
lower(last_name) as last_name
from Customers1;

select trim(email)
from Customers1;

select order_id, total_ammount,
SUM(total_ammount) over (order by order_id) as running_total
from Orders1;

select order_id, total_ammount,
rank() over (order by total_ammount desc) as rank_order
from Orders1;

select order_id, total_ammount,
case
	when total_ammount > 1000 then '10% Discount'
	when total_ammount > 500 then '5% Discount'
	else 'No Discount'
	end as discount
from Orders1;

select emp_id, first_name, salary,
    case
        when salary > 70000 then 'High'
        when salary >= 50000 then 'Medium'
        else 'Low'
    end as salary_category
from Employees1;