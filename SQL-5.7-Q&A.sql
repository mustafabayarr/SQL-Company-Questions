Day 7 - Solving 5 SQL Question along with answers

------------------------------------------------------------------------------------------------
-- Costco is known for their rotisserie chickens they sell, not just because they are delicious, but because they are a loss leader in this area.

-- This means they actually lose money in selling the chickens, but they are okay with this because they make up for that in other areas.

-- Using the sales table, calculate how much money they have lost on their rotisserie chickens this year. Round to the nearest whole number.

SELECT round(sum(lost_revenue_millions))
FROM sales

-- output 
-- total lost revenue 
-- round the nearest whole number

------------------------------------------------------------------------------------------------

-- Write a query that returns all of the stores whose average yearly revenue is greater than one million dollars.

-- Output the store ID and average revenue. Round the average to 2 decimal places.

-- Order by store ID.

SELECT store_id, round(avg(revenue),2) as rvn FROM stores
GROUP BY store_id
HAVING rvn > 1000000
order by store_id

------------------------------------------------------------------------------------------------

-- Data was input incorrectly into the database. The ID was combined with the First Name.

-- Write a query to separate the ID and First Name into two separate columns.

-- Each ID is 5 characters long.

SELECT LEFT(id,5) as id, substring(id,6) as first_name
FROM bad_data

------------------------------------------------------------------------------------------------

-- Write a query to report the IDs of low quality YouTube videos.

-- A video is considered low quality if the like percentage of the video (number of likes divided by the total number of votes) is less than 55%.

-- Return the result table ordered by ID in ascending order.

SELECT video_id
FROM youtube_videos
where thumbs_up / (thumbs_up + thumbs_down) < 0.55
group by video_id
order by video_id
-- output
-- low_q = thumbs_up / (thumbs_up + thumbs_down) < 0.55

------------------------------------------------------------------------------------------------

-- Tesla just provided their quarterly sales for their major vehicles.

-- Determine which Tesla Model has made the most profit.

-- Include all columns with the "profit" column at the end.

SELECT 
  tesla_model,
  car_price,
  cars_sold,
  production_cost,
  (car_price - production_cost) * cars_sold  as profit
FROM tesla_models
group by tesla_model
order by profit desc
limit 1

-- output
-- profit = (car_price * cars_sold) - production_cost
-- which model has made the most profit










