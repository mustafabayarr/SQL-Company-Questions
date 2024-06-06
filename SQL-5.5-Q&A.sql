Day 5 - 5 Questions

------------------------------------------------------------------------------------------------

-- Company: Airbnb

-- As part of your role as a Data Analyst at Airbnb, you are given an interesting challenge.
-- The team is interested in identifying the top 3 hosts who have generated the highest average revenue per booking in the year 2022. 
-- Round your results to 2 decimal points.

with cte as (
  select h.host_name, round(avg(b.booking_revenue),2) as avg_revenue
  from bookings b
  join hosts h on b.host_id = h.host_id
  where date_trunc('year',booking_date) = '2022-01-01'
  group by 1)
  
select *
from cte
order by avg_revenue desc
limit 3

------------------------------------------------------------------------------------------------

-- Company: Dataford

-- You are working for Instagram Shop and your team wants to know what is the most popular product. 
-- Write a SQL query to find the 1 product with the highest number of orders. 
-- In case of a tie in order counts, select the product that comes first in alphabetical order.

with cte as(
  select p.name, count(*) as cnt_product
  from orders o
  join products p on o.product_id = p.id
  group by 1)  
  
select name
from cte
order by cnt_product desc
limit 1 

------------------------------------------------------------------------------------------------

-- Company: Airbnb

-- Write a query to find matching hosts and guests pairs in a way that they are both of the same gender and nationality. 
-- Output the host id and the guest id of matched pairs.

select h.host_id, g.guest_id
from airbnb_hosts h
join airbnb_guests g on h.nationality = g.nationality and h.gender = g.gender

-- output
-- same gender and nationality between hosts and guests

------------------------------------------------------------------------------------------------

-- Company: Yelp

-- Write a query to find the top 3 states with the most 5-star reviews. 
-- Your output should include the state name and the number of 5-star reviews they received. 
-- In case of a tie between states, you should rank them by their alphabetical order.

-- Hint: Your final result should only include 3 states.

select b.state, count(r.rating) as cnt
from businesses b 
join reviews r on b.business_id = r.business_id
where r.rating = 5
group by b.state
order by cnt desc
limit 3

------------------------------------------------------------------------------------------------

-- Company: Robinhood

-- Write a SQL query that lists the top 3 cities that have the most completed trade orders. 
-- The output should include the city and the number of completed orders for that city. 
-- Assume that all cities have a different total order count.

select u.city, count(*) as comp_orders
from users u
join trades t on u.user_id = t.user_id
where status = 'Completed'
group by 1
order by comp_orders desc
limit 3

-- output
-- top 3 cities that have the most completed trade orders
-- output ---> city and the number of compeleted orders for each city
-- assume all cities have a different total order count

