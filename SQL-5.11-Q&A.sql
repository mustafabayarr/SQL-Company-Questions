--Amazon
-- You have a transactional dataset from Amazon, detailing sales across various products and marketplaces. 
-- Your objective is to identify and list the top 3 sellers in each product category for the month of January.

with cte as
  (select *
  from sales_data
  where month = '2024-01'),
  rnk as(select 
  *,
  dense_rank() over(partition by product_category order by total_sales desc) as rn
  from cte)

select 
  seller_id,
  total_sales,
  product_category,
  market_place,
  month
from rnk
where rn <=3

------------------------------------------------------------------------------------------------------------
-- Siemens
-- You're tasked with finding employees with the highest and lowest salaries. 
-- Your output should feature the employee's ID, salary, and department.

-- Additionally, include a column named 'salary_type' categorizing the results 
-- as either 'Highest Salary' or 'Lowest Salary' based on their respective salary rankings.

with cte as 
  (select *,
  rank() over(order by salary) as lowest_sal,
  rank() over(order by salary desc) as highest_sal
  from worker)
  
select 
    worker_id,
    salary,
    department,
    case
      when highest_sal = 1 then 'Highest Salary'
      when lowest_sal = 1 then 'Lowest Salary'
      end as salary_type
from cte
where lowest_sal = 1 or highest_sal = 1

------------------------------------------------------------------------------------------------------------
-- Deloitte
-- The sales team is keen on identifying the months with the highest sales. 
-- Using the provided sales data, your task is to determine the top three year-month combinations for sales.

-- Your output should feature the top three monthly sales in the format YYYY-MM, along with the corresponding cumulative sales.

select TO_CHAR(order_date, 'YYYY-MM') AS sales_month,
sum(order_value)
from fct_customer_sales
group by 1
order by 2 desc
limit 3

-- to_char(): convert date to specific char yyyy or mm whatever you select 
------------------------------------------------------------------------------------------------------------
-- IBM
-- IBM is developing a new feature to analyze user purchasing behavior for all Fridays in the first quarter of the year. 
-- For each Friday separately, calculate the average amount users have spent per order. 
-- The output should include the week number of that Friday and the average amount spent, rounded to two decimal places.

select 
  extract(week from date) as week_number,
  round(avg(amount_spent),2) as mean_amount
from user_purchases
where day_name = 'Friday' and extract(quarter from date) = 1
group by 1

------------------------------------------------------------------------------------------------------------
-- Amazon
-- You've been tasked with identifying the job titles of the highest-paid employees.

-- Your output should list the job title or titles with the highest salary, considering the possibility of multiple titles sharing the same salary.
with cte as 
  (select *,
  dense_rank() over(order by w.salary desc) as rnk
  from worker w
  join title t on t.worker_ref_id = w.worker_id)
  
select worker_title
from cte
where rnk <=1

