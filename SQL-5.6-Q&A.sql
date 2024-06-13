Day 6 solving 5 SQL Questions

------------------------------------------------------------------------------------------------

-- Often when you're working with customer information you'll want to sell that data to a third party. 
-- Sometimes it is illegal to give away sensitive information such as a full name.

-- Here you are given a table that contains a customer ID and their full name.

-- Return the customer ID with only the first name of each customer.

SELECT
  customer_id,
  LEFT(full_name, position(' ' IN full_name) - 1) as first_name
  -- TRIM(SUBSTRING("full_name", 1, POSITION(' ' IN "full_name"))) as first_name 
  -- ALTERNATIVE 
FROM customers

-- important functions 
-- position() -- it will get the index for specific char
-- left() -- will get the targeted string


------------------------------------------------------------------------------------------------

-- Herschel's Manufacturing Plant has hit some hard times with the economy and unfortunately they need to let some people go.

-- They figure the younger employees need their jobs more as they are growing families so they decide to let go of their 3 oldest employees. 
-- They have more experience and will be able to land on their feet easier (and they had to pay them more).

-- Write a query to identify the ids of the three oldest employees.

-- Order output from oldest to youngest.

SELECT employee_id
FROM employees
ORDER BY birth_date 
limit 3

------------------------------------------------------------------------------------------------

-- I love chocolate and only want delicious baked goods that have chocolate in them!

-- Write a Query to return bakery items that contain the word "Chocolate".

SELECT * FROM bakery_items
where product_name like '%Chocolate%'

------------------------------------------------------------------------------------------------

-- A Computer store is offering a 25% discount for all new customers over the age of 65 or customers that spend more than $200 on their first purchase.

-- The owner wants to know how many customers received that discount since they started the promotion.

-- Write a query to see how many customers received that discount.

SELECT count(*) FROM customers
where total_purchase >= 200 or age >= 65

------------------------------------------------------------------------------------------------

-- After about 10,000 miles, Electric bike batteries begin to degrade and need to be replaced.

-- Write a query to determine the amount of bikes that currently need to be replaced.

SELECT COUNT(*) FROM bikes
where miles >= 10000

