-- 1. How many rows are in the names table?

SELECT COUNT(*)
FROM names;

-- There are 1,957,046 rows in the table

-- 2. How many total registered people appear 
-- in the dataset?

SELECT SUM(num_registered) AS sum_total
FROM names;

-- There are 351,653,025 registered people

-- 3. Which name had the most appearances in 
-- a single year in the dataset?

SELECT *
FROM names
ORDER BY num_registered DESC
LIMIT 1;

-- The name Linda in 1947 occured 99,689 times

-- 4. What range of years are included?

SELECT MIN(year) AS first_year, 
MAX(year) AS last_year, 
MAX(year) - MIN(year) AS range_of_years
FROM names;

-- There are 138 years in the data,
-- ranging from 1880 to 2018

-- 5. What year has the largest number of registrations?

SELECT year, SUM(num_registered) AS total
FROM names
GROUP BY year
ORDER BY total DESC
LIMIT 1;

-- The year 1957 has 4,200,022 registrations

-- 6. How many different (distinct) names are 
-- contained in the dataset?

SELECT COUNT(DISTINCT name) AS number_of_unique_names
FROM names;

-- There are 98,400 unique names in the table

-- 7. Are there more males or more females registered?

SELECT COUNT(CASE WHEN gender = 'M' THEN 1 END) AS males,
COUNT(CASE WHEN gender = 'F' THEN 1 END) AS females
FROM names;

-- There are more females (1,156,527) 
--  than males (800,519), 69% of the females

-- 8. What are the most popular male and female names overall 
-- (i.e., the most total registrations)?

SELECT name, 
MAX(num_registered) AS total, 
COUNT(CASE WHEN gender = 'M' THEN 1 END) AS males,
COUNT(CASE WHEN gender = 'F' THEN 1 END) AS females
FROM names
GROUP BY name
ORDER BY total DESC
LIMIT 2;

-- Linda is the most popular girl name, and James is the most popular boy name

-- 9. What are the most popular boy and girl names 
-- of the first decade of the 2000s (2000 - 2009)?

SELECT Distinct name, 
year, 
MAX(num_registered) AS total, 
COUNT(CASE WHEN gender = 'M' THEN 1 END) AS males,
COUNT(CASE WHEN gender = 'F' THEN 1 END) AS females
FROM names
WHERE year BETWEEN 2000 AND 2009
GROUP BY name, year
ORDER BY total DESC;

-- 10. Which year had the most variety in names
-- (i.e. had the most distinct names)?

SELECT COUNT(DISTINCT name) AS name_count, year
FROM names
GROUP BY year
ORDER BY name_count DESC
LIMIT 1;

-- 11. What is the most popular name for a girl that starts with the letter X?

SELECT name, gender, SUM(num_registered) AS total
FROM names
WHERE name LIKE 'X%'
	AND gender = 'F'
GROUP BY name, gender
ORDER BY total DESC
LIMIT 1;

-- Ximena

-- 12. Write a query to find all (distinct) names that start with a 'Q' but whose second letter is not 'u'

SELECT DISTINCT name, gender, SUM(num_registered) AS total
FROM names
WHERE name LIKE 'Q%'
	AND name NOT LIKE '_u%'
GROUP BY name, gender
ORDER BY total DESC;

-- 13. Which is the more popular spelling between "Stephen" and "Steven"? 
-- Use a single query to answer this question. 

SELECT name, SUM(num_registered) AS total
FROM names
WHERE name LIKE 'Ste%en'
GROUP BY name
ORDER BY total DESC
LIMIT 2;

-- Steven is the more popular spelling

-- 14. Find all names that are "unisex" - 
-- that is all names that have been used both for boys and for girls.

SELECT name
FROM names
GROUP BY name
HAVING COUNT(DISTINCT gender) = 2  
ORDER BY name
LIMIT 5;

-- 15. Find all names that have made an appearance in every single year since 1880.

SELECT name
FROM names
WHERE year >=1880
GROUP BY name
HAVING COUNT(DISTINCT(year)) = (2019 - 1880)
LIMIT 5;

-- 16. Find all names that have only appeared in one year.

SELECT name, COUNT(name)
FROM names
GROUP BY name
HAVING COUNT(year) = 1;

-- 17. Find all names that only appeared in the 1950s.

SELECT name
FROM names
GROUP BY name
HAVING MIN(year) >= 1950 
	AND MAX(year) <= 1959;

-- 18. Find all names that made their first appearance in the 2010s.

SELECT name
FROM names
GROUP BY name
HAVING MIN(year)>=2010 
	AND MIN(year) < 2020;

-- 19. Find the names that have not been used in the longest.

SELECT name, MAX(year) AS oldest
FROM names
GROUP BY name
ORDER BY oldest
LIMIT 5;


-- 20. Come up with a question that you would like to answer using this dataset. 
-- Then write a query to answer this question.












