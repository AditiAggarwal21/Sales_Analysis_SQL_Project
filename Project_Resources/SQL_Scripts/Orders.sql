-- 1. How many orders are there in total?
SELECT COUNT(*) AS total_orders 
FROM orders_data;

-- 2. What are the unique order statuses in the table?
SELECT DISTINCT order_status 
FROM orders_data;

-- 3. How many orders belong to each shipping mode?
SELECT shipping_mode, COUNT(*) AS total_orders 
FROM orders_data 
GROUP BY shipping_mode;

-- 4. Retrieve details of all orders shipped to 'India'.
SELECT * 
FROM orders_data 
WHERE order_country = 'India';

-- 5. How many orders are there from each city?
SELECT order_city, COUNT(*) AS total_orders 
FROM orders_data 
GROUP BY order_city 
ORDER BY total_orders DESC;

-- 6. What is the total number of orders placed in 2016?
SELECT COUNT(*) AS total_orders_2016 
FROM orders_data 
WHERE YEAR(order_date) = 2016;

-- 7. List the top 5 months with the highest number of orders.
SELECT DATE_FORMAT(order_date, '%Y-%m') AS order_month, COUNT(*) AS total_orders 
FROM orders_data 
GROUP BY order_month 
ORDER BY total_orders DESC 
LIMIT 5;

-- 8. What is the average shipping time (in days) for all orders?
SELECT AVG(DATEDIFF(shipping_date, order_date)) AS avg_shipping_time 
FROM orders_data 
WHERE shipping_date IS NOT NULL;

-- 9. How many orders are shipped from each country?
SELECT order_country, COUNT(*) AS total_orders 
FROM orders_data 
GROUP BY order_country 
ORDER BY total_orders DESC;

-- 10. What is the percentage of orders shipped via each shipping mode?
SELECT shipping_mode, 
       COUNT(*) * 100.0 / (SELECT COUNT(*) FROM orders_data) AS percentage 
FROM orders_data 
GROUP BY shipping_mode;

-- 11. How many orders are still in 'Pending' status?
SELECT COUNT(*) AS pending_orders 
FROM orders_data 
WHERE order_status = 'Pending';

-- 12. (Fixed) What is the average number of orders placed by each customer?
SELECT order_customer_id, COUNT(*) AS total_orders 
FROM orders_data 
GROUP BY order_customer_id 
ORDER BY total_orders DESC;

-- 13. (Fixed) How many orders are shipped by 'Air' shipping mode from 'India'?
SELECT COUNT(*) AS air_shipping_from_india 
FROM orders_data 
WHERE shipping_mode = 'Air' AND order_country = 'India';

-- 14. (Fixed) What is the most common order status for orders placed in 'Delhi'?
SELECT order_status, COUNT(*) AS status_count 
FROM orders_data 
WHERE order_city = 'Delhi' 
GROUP BY order_status 
ORDER BY status_count DESC 
LIMIT 1;

-- 15. (Fixed) How many orders were shipped after 7 days of the order date?
SELECT COUNT(*) AS orders_shipped_after_7_days 
FROM orders_data 
WHERE DATEDIFF(shipping_date, order_date) > 7;

-- 16. What is the count of orders in each state, grouped by order status?
SELECT order_state, order_status, COUNT(*) AS total_orders 
FROM orders_data 
GROUP BY order_state, order_status 
ORDER BY total_orders DESC;
