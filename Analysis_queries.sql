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
