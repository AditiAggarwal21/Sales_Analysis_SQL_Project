-- 1. How many departments are there in total?
SELECT COUNT(*) AS total_departments 
FROM department_data;

-- 2. What are the unique department names in the table?
SELECT DISTINCT department_name 
FROM department_data;

-- 3. How many departments have the word 'Sales' in their name?
SELECT COUNT(*) AS sales_departments 
FROM department_data 
WHERE department_name LIKE '%Sales%';

-- 4. Retrieve all department names.
SELECT department_name 
FROM department_data;

-- 5. How many departments have names longer than 10 characters?
SELECT COUNT(*) AS long_named_departments 
FROM department_data 
WHERE LENGTH(department_name) > 10;

-- 6. Retrieve the department name with the highest department ID.
SELECT department_name 
FROM department_data 
WHERE department_id = (SELECT MAX(department_id) FROM department_data);

-- 7. Retrieve the department names in alphabetical order.
SELECT department_name 
FROM department_data 
ORDER BY department_name ASC;

-- 8. How many departments start with the letter 'A'?
SELECT COUNT(*) AS departments_starting_with_A 
FROM department_data 
WHERE department_name LIKE 'A%';

-- 9. What is the total number of characters in all department names?
SELECT SUM(LENGTH(department_name)) AS total_chars_in_names 
FROM department_data;

-- 10. What is the department name for the department ID 5?
SELECT department_name 
FROM department_data 
WHERE department_id = 5;

-- 11. Retrieve all department IDs and names where the department name contains 'Tech'.
SELECT department_id, department_name 
FROM department_data 
WHERE department_name LIKE '%Tech%';

-- 12. How many departments have the word 'Operations' in their name?
SELECT COUNT(*) AS operations_departments 
FROM department_data 
WHERE department_name LIKE '%Operations%';

-- 13. Retrieve the department name with the smallest department ID.
SELECT department_name 
FROM department_data 
WHERE department_id = (SELECT MIN(department_id) FROM department_data);
