CREATE DATABASE retail_analytics;
USE retail_analytics;

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(100),
  age INT,
  city VARCHAR(100)
);

CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(150),
  category VARCHAR(100),
  price DECIMAL(10,2)
);

CREATE TABLE sales (
  sale_id INT PRIMARY KEY,
  customer_id INT,
  product_id INT,
  quantity INT,
  sale_date DATE
);

INSERT INTO customers VALUES
(1,'Arun',28,'Chennai'),
(2,'Priya',32,'Pondicherry'),
(3,'Karthik',24,'Chennai'),
(4,'Sowmiya',29,'Coimbatore');

INSERT INTO products VALUES
(101,'Laptop','Electronics',55000),
(102,'Headphones','Electronics',1500),
(103,'Chair','Furniture',2300);

INSERT INTO sales VALUES
(1,1,101,1,'2025-01-12'),
(2,2,102,2,'2025-02-10'),
(3,3,103,1,'2025-03-05'),
(4,1,102,1,'2025-03-25'); 

select * from customers;

-- Total customers
SELECT COUNT(*) AS total_customers FROM customers;

-- Total revenue
SELECT SUM(p.price * s.quantity) AS total_revenue
FROM sales s JOIN products p ON s.product_id = p.product_id;

-- Top selling products
SELECT p.product_name, SUM(s.quantity) AS total_sold
FROM sales s JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

-- Monthly revenue
SELECT DATE_FORMAT(s.sale_date, '%Y-%m') AS month,
       SUM(p.price * s.quantity) AS monthly_revenue
FROM sales s JOIN products p ON s.product_id = p.product_id
GROUP BY month
ORDER BY month;
