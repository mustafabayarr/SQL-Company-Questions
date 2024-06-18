-- If our company hits its yearly targets, every employee receives a salary increase depending on what level you are in the company.

-- Give each Employee who is a level 1 a 10% increase, level 2 a 15% increase, and level 3 a 200% increase.

-- Include this new column in your output as "new_salary" along with your other columns.

SELECT *, CASE
    WHEN pay_level = 1 THEN salary * 1.1
    WHEN pay_level = 2 THEN salary * 1.15
    WHEN pay_level = 3 THEN salary * 3
    ELSE salary
END as new_salary
FROM employees;

------------------------------------------------------------------------------------------------
-- Write a query to determine how many direct reports each Manager has.

-- Note: Managers will have "Manager" in their title.

-- Report the Manager ID, Manager Title, and the number of direct reports in your output.

SELECT m.employee_id AS manager_id, m.position AS manager_position, COUNT(*) AS direct_reports
FROM direct_reports e
JOIN direct_reports m ON e.managers_id = m.employee_id
WHERE m.position LIKE '%Manager%'
GROUP BY m.employee_id, m.position;

------------------------------------------------------------------------------------------------

-- Sarah's Bike Shop sells a lot of bikes and wants to know what the average sale price is of her bikes.

-- She sometimes gives away a bike for free for a charity event and if she does she leaves the price of the bike as blank, but marks it sold.

-- Write a query to show her the average sale price of bikes for only bikes that were sold, and not donated.

-- Round answer to 2 decimal places.

SELECT CAST(ROUND(AVG(CAST("bike_price" AS NUMERIC)), 3) AS NUMERIC(10, 2)) AS "average_sale_price"
FROM "inventory"
WHERE "bike_sold" = 'Y' AND "bike_price" IS NOT NULL;

------------------------------------------------------------------------------------------------

-- If a customer is 55 or above they qualify for the senior citizen discount. Check which customers qualify.

-- Assume the current date 1/1/2023.

-- Return all of the Customer IDs who qualify for the senior citizen discount in ascending order.

SELECT customer_id
FROM customers
where EXTRACT(year from age('2023-01-01',"birth_date")) >= 55
order by 1

------------------------------------------------------------------------------------------------

-- Kroger's is a very popular grocery chain in the US. They offer a membership card in exchange for a discount on select items. Customers can still shop at Krogers without the card.

-- Write a query to find the percentage of customers who shop at Kroger's who also have a Kroger's membership card. Round to 2 decimal places.

SELECT round(count(case when has_member_card = 'Y' then 1 end)::NUMERIC / count(*) * 100,2)
FROM customers

