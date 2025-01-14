-- 1. How many categories are there in total?
SELECT COUNT(*) AS total_categories 
FROM category_data;

-- 2. What are the unique category names in the table?
SELECT DISTINCT category_name 
FROM category_data;

-- 3. Retrieve all category names.
SELECT category_name 
FROM category_data;

-- 4. What is the category ID for the category 'Electronics'?
SELECT category_id 
FROM category_data 
WHERE category_name = 'Electronics';

-- 5. Retrieve the category names in alphabetical order.
SELECT category_name 
FROM category_data 
ORDER BY category_name ASC;

-- 6. How many categories have names containing the word 'Home'?
SELECT COUNT(*) AS home_categories 
FROM category_data 
WHERE category_name LIKE '%Home%';

-- 7. Retrieve the category name with the highest category ID.
SELECT category_name 
FROM category_data 
WHERE category_id = (SELECT MAX(category_id) FROM category_data);

-- 8. How many categories have names shorter than 10 characters?
SELECT COUNT(*) AS short_named_categories 
FROM category_data 
WHERE LENGTH(category_name) < 10;

-- 9. What is the category name with the smallest category ID?
SELECT category_name 
FROM category_data 
WHERE category_id = (SELECT MIN(category_id) FROM category_data);

-- 10. Retrieve all category IDs and names where the category name contains 'Food'.
SELECT category_id, category_name 
FROM category_data 
WHERE category_name LIKE '%Water Sports%';
