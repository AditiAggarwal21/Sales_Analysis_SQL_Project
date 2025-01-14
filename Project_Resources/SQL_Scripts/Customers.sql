-- 1. What are all the customer segments present in the table?
SELECT DISTINCT customer_segment 
FROM customers;

-- 2. Which state has the largest number of customers?
SELECT customer_state, COUNT(*) AS customer_count 
FROM customers 
GROUP BY customer_state 
ORDER BY customer_count DESC 
LIMIT 1;

-- 3. How many customers are in each customer segment?
SELECT customer_segment, COUNT(*) AS customer_count 
FROM customers 
GROUP BY customer_segment;

-- 4. How many unique customer segments exist in each state?
SELECT customer_state, COUNT(DISTINCT customer_segment) AS unique_segments 
FROM customers 
GROUP BY customer_state;

-- 5. How many customers are there in each city, grouped by state?
SELECT customer_state, customer_city, COUNT(*) AS customer_count 
FROM customers 
GROUP BY customer_state, customer_city 
ORDER BY customer_state, customer_city;

-- 6. How many customers are missing zip codes?
SELECT COUNT(*) AS missing_zipcodes 
FROM customers 
WHERE customer_zipcode IS NULL OR customer_zipcode = '';

-- 7. Which countries have customers, and how many customers are in each country?
SELECT customer_country, COUNT(*) AS customer_count 
FROM customers 
GROUP BY customer_country;

-- 8. Retrieve all customer details for those in the 'Corporate' segment.
SELECT * 
FROM customers 
WHERE customer_segment = 'Corporate';

-- 9. What is the average number of customers per city in each state?
SELECT customer_state, AVG(customer_count) AS avg_customers_per_city
FROM (
    SELECT customer_state, customer_city, COUNT(*) AS customer_count 
    FROM customers 
    GROUP BY customer_state, customer_city
) AS state_city_counts 
GROUP BY customer_state;

-- 10. Retrieve all customers who live in 'Caguas'.
SELECT * 
FROM customers 
WHERE customer_city = 'Caguas';

-- 11. Which city has the highest number of unique zip codes?
SELECT customer_city, COUNT(DISTINCT customer_zipcode) AS unique_zipcodes 
FROM customers 
GROUP BY customer_city 
ORDER BY unique_zipcodes DESC 
LIMIT 1;

-- 12. How many customers live in 'Puerto Rico'?
SELECT COUNT(*) AS customer_count 
FROM customers 
WHERE customer_country = 'Puerto Rico';
