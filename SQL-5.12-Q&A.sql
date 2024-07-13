-- Doordash
-- Write a SQL query to calculate the % of high-frequency customers for January 2023. 
-- A high-frequency customer is defined as someone who places more than 5 orders in a month. 
-- Your output should only include the % of these high-frequency customers.

-- Round your results to 2 decimal points.
WITH my_high_frequency AS (
    SELECT 
        customer_id
    FROM delivery_order
    WHERE DATE_TRUNC('month', order_timestamp) = '2023-01-01' 
    GROUP BY 1
    HAVING COUNT(*) > 5)
    
SELECT
    round(1.00*COUNT(DISTINCT mhf.customer_id)/COUNT(DISTINCT d.customer_id),2)
FROM delivery_order d
LEFT JOIN my_high_frequency mhf ON mhf.customer_id = d.customer_id
WHERE DATE_TRUNC('month', order_timestamp) = '2023-01-01' 

-----------------------------------------------------------------------------------
-- L&T
-- Write a query to to find the names of the employees with the highest and lowest salaries in each department. 
-- For this question, let's assume that everyone at the company has different salaries.
with salaries as
  (select *,
  rank() over(partition by dep_id order by salary) as lowest_sal,
  rank() over(partition by dep_id order by salary desc) as highest_sal
  from employee)

SELECT
dep_id,
max(CASE WHEN highest_sal = 1 THEN employee_name END) AS max_sal_emp,
max(CASE WHEN lowest_sal = 1 THEN employee_name END) AS min_sal_emp
FROM salaries
GROUP BY 1
  
-----------------------------------------------------------------------------------
-- Tinder
-- Write a query to find the names of employees who were still employed as of January 2, 2016.

select e.name
from employees e
left join terminations t on t.emp_id = e.id
where e.hire_date <= '2016-01-02' and t.term_date >= '2016-01-02'
or t.emp_id is null

-----------------------------------------------------------------------------------
