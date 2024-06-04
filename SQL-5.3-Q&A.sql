-- Day 3 - 5 SQL Company Questions

----------------------------------------------------------------------------------------------------------------------

-- Company: Google

-- You're given a dataset from Google called google_salaries containing information about various individuals, including their education levels and salaries.

-- Your goal is to calculate the average salary for each level of education. Round your results to 1 decimal points.

select education, round(avg(salary),1) as avg_salary
from google_salaries
group by 1


-- output
-- calc avg salary for each level education
-- round 1 decimal

----------------------------------------------------------------------------------------------------------------------

-- Company: Deloitte

-- Write a query to display the number of employees hired during the months of February to August 2023 (including August).

select count(*) as hired_employees
from employees
where extract(year from joining_date) = 2023
and extract(month from joining_date) between 2 and 8


-- output
-- date between Feb and Aug(including)

----------------------------------------------------------------------------------------------------------------------

-- Company: Dataford

-- Write a query to retrieve the list of unique worker IDs who logged in between January 10th and January 25th, 2023.

select distinct worker_id
from user_logins
where extract(year from login_timestamp) = 2023
and extract(month from login_timestamp) = 01
and extract(day from login_timestamp) between 10 and 25

-- output
-- unique worker ID
-- where 2023-01-10 and 2023-01-25

----------------------------------------------------------------------------------------------------------------------

-- Company: Uber

-- Uber has a database table called trips that stores information about each trip taken by customers. 
-- You've been asked to find the top 3 drivers with the highest revenue. 
-- Assume that Uber takes a 20% cut on each trip. Round your results to 0 decimals.

-- For this interview question, assume there are no ties in drivers' revenue.

select driver_id, round(sum(cost*0.8)) as revenue
from trips
group by 1
order by 2 desc
limit 3

-- output
-- find top 3 drivers with the highest revenue
-- Uber takes a 20% cut on each trip ---> sum(cost*0.8) as revenue_per_driver
-- round 0 decimals
-- assume there are no ties in drivers' revenue

----------------------------------------------------------------------------------------------------------------------

-- Company: Alibaba

-- Write a SQL query to calculate the average number of items per order on Alibaba's platform. The result should be rounded to 1 decimal place.

select round(1.00*sum(item_count*order_occurrences)/sum(order_occurrences),1)
from items_per_order


