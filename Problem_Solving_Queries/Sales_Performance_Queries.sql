-- Query to find the most profitable product categories
SELECT 
    c.category_name,
    SUM(sd.profit_per_order) AS Total_Profit
FROM 
    Sales_Data sd
JOIN 
    Products p ON sd.order_item_product_price = p.product_card_id                                           
JOIN 
    Category_Data c ON p.product_category_id = c.category_id
GROUP BY 
    c.category_name
ORDER BY 
    Total_Profit DESC;

------------------------------------------------------------------------------------------------------------------------------------------------

-- Query to calculate total sales and profit per customer
SELECT 
    o.order_customer_id,
    SUM(sd.order_item_total_amount) AS total_sales,
    SUM(sd.order_profit_per_order) AS total_profit                                                         
FROM 
    orders_data o
JOIN 
    sales_data sd ON o.order_customer_id = sd.order_item_quantity 
GROUP BY 
    o.order_customer_id;

--------------------------------------------------------------------------------------------------------------------------------------------------

-- Query to calculate total sales and profit by month
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS order_month,
    SUM(sd.order_item_total_amount) AS total_sales,
    SUM(sd.order_profit_per_order) AS total_profit
FROM 
    orders_data o
JOIN 
    sales_data sd ON o.order_customer_id = sd.order_item_quantity                                  
GROUP BY 
    order_month
ORDER BY 
    order_month;

-------------------------------------------------------------------------------------------------------------------------------------------------

-- Query to find the products with the highest profit margins
SELECT 
    p.product_name,
    (SUM(sd.order_item_total_amount) - SUM(sd.order_profit_per_order)) / SUM(sd.order_item_total_amount * 1.0) AS profit_margin
FROM 
    sales_data sd
JOIN 
    products p ON sd.order_item_product_price = p.product_price                          
GROUP BY 
    p.product_name
ORDER BY 
    profit_margin DESC;

--------------------------------------------------------------------------------------------------------------------------------------------------

-- Query to calculate sales and profits distribution by state and city
SELECT 
    o.order_state,
    o.order_city,
    SUM(sd.order_item_total_amount) AS total_sales,
    SUM(sd.order_profit_per_order) AS total_profit
FROM                                                                                                              
    orders_data o
JOIN 
    sales_data sd ON o.order_customer_id = sd.order_item_quantity
GROUP BY 
    o.order_state, o.order_city;

---------------------------------------------------------------------------------------------------------------------------------------------------

-- Query to calculate how many unique products each customer purchases
SELECT 
    o.order_customer_id,
    COUNT(DISTINCT sd.order_item_product_price) AS unique_products_purchased
FROM 
    orders_data o
JOIN 
    sales_data sd ON o.order_customer_id = sd.order_item_quantity                                      
GROUP BY 
    o.order_customer_id;

------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query to find customers purchasing a wider variety of products
SELECT 
    o.order_customer_id,
    COUNT(DISTINCT sd.order_item_product_price) AS unique_products_purchased
FROM 
    orders_data AS o
JOIN 
    sales_data AS sd ON o.order_customer_id = sd.order_item_quantity                             
GROUP BY 
    o.order_customer_id;

-------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query to calculate the percentage of customers who made repeat purchases
SELECT 
    COUNT(DISTINCT o.order_customer_id) AS total_customers,
    COUNT(DISTINCT CASE WHEN order_count > 1 THEN o.order_customer_id END) AS repeat_customers,
    (COUNT(DISTINCT CASE WHEN order_count > 1 THEN o.order_customer_id END) / COUNT(DISTINCT o.order_customer_id) * 100) AS repeat_customer_percentage                 
FROM ( 
    SELECT 
        order_customer_id,
        COUNT(order_customer_id) AS order_count
    FROM 
        orders_data
    GROUP BY 
        order_customer_id
) AS o;

--------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query to count delayed or late processed orders
SELECT 
    COUNT(*) AS delayed_orders
FROM 
    orders_data
WHERE 
    shipping_date > order_date; -- Assuming order_date is the date the order was placed

--------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query to calculate the percentage of profitable orders
SELECT 
    (COUNT(CASE WHEN sd.order_profit_per_order > 0 THEN 1 END) / COUNT(*)) * 100 AS profitable_order_percentage
FROM 
    sales_data sd
JOIN 
    orders_data o ON o.order_customer_id = sd.order_item_quantity; 

---------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query to find the top 10 products by total sales
SELECT 
    p.product_name,
    SUM(sd.order_item_total_amount) AS total_sales
FROM 
    sales_data sd
JOIN 
    products p ON sd.order_item_product_price = p.product_price                                     
GROUP BY 
    p.product_name
ORDER BY 
    total_sales DESC
LIMIT 10;

------------------------------------------------------------------------------------------------------------------------------------------------------
 
--  queries to find the product which have the highest sales volume
SELECT 
    p.product_name,
    SUM(sd.order_item_quantity) AS total_quantity_sold
FROM 
    sales_data sd
JOIN 
    products p ON sd.order_item_product_price = p.product_price
GROUP BY 
    p.product_name
ORDER BY 
    total_quantity_sold DESC;

-------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query to count the total number of orders per customer segment
SELECT 
    c.customer_segment,
    COUNT(o.order_customer_id) AS total_orders
FROM 
    customers c
JOIN 
    orders_data o ON c.customer_id = o.order_customer_id                                  
GROUP BY 
    c.customer_segment;

-------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query to calculate the average sales amount for each customer segment
SELECT 
    c.customer_segment,
    AVG(sd.order_item_total_amount) AS avg_sales_amount
FROM 
    customers c
JOIN 
    orders_data o ON c.customer_id = o.order_customer_id
JOIN 
    sales_data sd ON o.order_customer_id = sd.order_item_quantity                                        
GROUP BY 
    c.customer_segment;

-------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query to find the average order size and profit per shipping mode
SELECT 
    o.shipping_mode,
    AVG(sd.order_item_total_amount) AS average_order_size,
    AVG(sd.order_profit_per_order) AS average_profit
FROM 
    orders_data o
JOIN 
    sales_data sd ON o.order_customer_id = sd.order_item_quantity -- Adjust this join condition as necessary
GROUP BY 
    o.shipping_mode;
    
--------------------------------------------------------------------------------------------------------------------------------------------------------
 
 -- query to fiind the number of orders with respect to each shipping mode
SELECT 
    o.shipping_mode,
    COUNT(o.order_id) AS total_orders_shipped
FROM 
    orders_data o
GROUP BY 
    o.shipping_mode;

-------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query to find the month with the highest sales or profit
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS order_month,
    SUM(sd.order_item_total_amount) AS total_sales,
    SUM(sd.order_profit_per_order) AS total_profit
FROM 
    orders_data o
JOIN 
    sales_data sd ON o.order_customer_id = sd.order_item_quantity -- Adjust this join condition as necessary
GROUP BY 
    order_month
ORDER BY 
    total_sales DESC
LIMIT 1; -- For highest sales

------------------------------------------------------------------------------------------------------------------------------------------------------

-- Query to show the sales trends over time by month
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS order_month,
    SUM(sd.order_item_total_amount) AS total_sales
FROM 
    orders_data o
JOIN 
    sales_data sd ON o.order_customer_id = sd.order_item_quantity 
GROUP BY 
    order_month
ORDER BY 
    order_month;
