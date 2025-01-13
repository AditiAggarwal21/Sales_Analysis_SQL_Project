-- 1. What is the total sales value for all orders?
SELECT SUM(sales) AS total_sales 
FROM sales_data;

-- 2. What is the average profit per order?
SELECT AVG(profit_per_order) AS avg_profit_per_order 
FROM sales_data;

-- 3. How many orders had a profit per order greater than $500?
SELECT COUNT(*) AS orders_with_high_profit 
FROM sales_data 
WHERE profit_per_order > 500;

-- 4. What is the total sales amount for all items (order_item_total_amount * order_item_quantity)?
SELECT SUM(order_item_total_amount) AS total_sales_value 
FROM sales_data;

-- 5. What is the average order profit per order across all orders?
SELECT AVG(order_profit_per_order) AS avg_order_profit 
FROM sales_data;

-- 6. What is the total quantity of items sold across all orders?
SELECT SUM(order_item_quantity) AS total_quantity_sold 
FROM sales_data;

-- 7. What is the highest total amount for any item (order_item_total_amount)?
SELECT MAX(order_item_total_amount) AS max_total_amount 
FROM sales_data;

-- 8. What is the total profit for all items (order_item_profit_ratio * order_item_quantity)?
SELECT SUM(order_item_profit_ratio * order_item_quantity) AS total_profit 
FROM sales_data;

-- 9. What is the average sales value per customer across all orders?
SELECT AVG(sales_per_customer) AS avg_sales_per_customer 
FROM sales_data;

-- 10. What is the highest profit ratio across all orders (order_item_profit_ratio)?
SELECT MAX(order_item_profit_ratio) AS highest_profit_ratio 
FROM sales_data;

-- 11. What is the total sales amount for all items?
SELECT SUM(order_item_total_amount) AS total_sales_amount 
FROM sales_data;

-- 12. How many items generated a profit per order greater than $1000?
SELECT COUNT(*) AS high_profit_orders 
FROM sales_data 
WHERE profit_per_order > 1000;

-- 13. What is the total number of items sold across all orders?
SELECT SUM(order_item_quantity) AS total_items_sold 
FROM sales_data;

-- 14. What is the average product price across all items?
SELECT AVG(order_item_product_price) AS avg_product_price 
FROM sales_data;

-- 15. What is the total profit for all orders combined?
SELECT SUM(order_profit_per_order) AS total_profit 
FROM sales_data;
