-- Write a SQL query to find the number of companies that have posted duplicate job listings. 
-- Duplicate job listings refer to two jobs at the same company with the same title and description.

with cte as  (
  SELECT company_id, title,description, COUNT(*)
  FROM job_listings
  GROUP BY 1,2,3
  HAVING COUNT(*) > 1)
  
select count(*)
from cte

-- output is the list of all duplicate jobs
-- with cte as  (select a.*
--   from job_listings a
--   join(SELECT company_id, title,description, COUNT(*)
--   FROM job_listings
--   GROUP BY 1,2,3
--   HAVING COUNT(*) > 1)
--   b on a.company_id = b.company_id
--   and a.title = b.title
--   and a.description = b.description)

------------------------------------------------------------------------------------------------

-- Amazon has partnered with multiple airlines to enhance their in-flight entertainment systems. As part of this initiative, 
-- you are tasked with developing a feature that suggests movies from Amazon's content database.

-- For flight 101, suggest movies with runtimes less than or equal to the flight's duration.


SELECT
    fs.flight_id,
    ec.movie_id,
    ec.duration AS movie_duration
FROM flight_schedule fs
INNER JOIN entertainment_catalog ec ON ec.duration <= fs.flight_duration
where fs.flight_id = 101

------------------------------------------------------------------------------------------------

-- Identify doctors with the last name 'Johnson' in the employee list. The output should include both their first and last names.

SELECT first_name, last_name
FROM employee_list
where last_name = 'Johnson' and profession = 'Doctor'

------------------------------------------------------------------------------------------------

-- Write a query to determine the popularity of a post on LinkedIn

-- Popularity is defined by number of actions (likes, comments, shares, etc.) divided by the number impressions the post received * 100.

-- If the post receives a score higher than 1 it was very popular.

-- Return all the post IDs and their popularity where the score is 1 or greater.

-- Order popularity from highest to lowest.

SELECT post_id,round((actions::NUMERIC / impressions) * 100,4) as score
FROM linkedin_posts
where (actions::NUMERIC / impressions) * 100 >= 1
group by 1,2
order by 2 desc
-- popularity = (actions / impressions) * 100
-- if score >= 1 

-- output
-- post_id,score
-- order by post_id desc

------------------------------------------------------------------------------------------------

-- Write a query to identify products that have undergone shrink-flation over the last year. Shrink-flation is defined as a reduction in product size while maintaining or increasing the price.

-- Include a flag for Shrinkflation. This should be a boolean value (True or False) indicating whether the product has undergone shrink-flation

-- The output should have the columns Product_Name, Size_Change_Percentage, Price_Change_Percentage, and Shrinkflation_Flag.

-- Round percentages to the nearest whole number and order the output on the product names alphabetically.

SELECT product_name,
  round((new_size::NUMERIC - original_size::NUMERIC) / original_size::NUMERIC * 100) as size_change_percentage,
  round((new_price::NUMERIC - original_price::NUMERIC) / original_price::NUMERIC * 100) as price_change_percentage,
  case 
  when original_price <= new_price and original_size > new_size then 'True'
  else 'false'
  end case as shrinkflation_flag
FROM products
order by product_name ASC

-- size_change_percentage = (new_size - original_size) / original_size * 100

