Day 4 - Solving 5 SQL company questions

------------------------------------------------------------------------------------------------

-- Company: Dataford

-- Write a query to calculate the click-through rate (CTR %) of an app in 2022. 
-- The CTR is defined as the percentage of clicks out of all impressions made in the year 2022.

-- Output the results in percentages rounded to 2 decimal places.

-- Notes:

-- The percentage of click-through rate = 100.0 * Number of clicks / Number of impressions
-- To avoid integer division, you should multiply the click-through rate by 100.0, not 100.

with cte as (
  select app_id,
  count(case when event_type = 'click' then 1 end) as number_of_clicks,
  count(case when event_type = 'impression' then 1 end) as number_of_impressions
from events
where DATE_TRUNC('year',timestamp) = '2022-01-01' 
--extract(year from timestamp) = 2022  -- both work
group by 1)

select app_id,round(100.0*number_of_clicks / number_of_impressions,2) as CTR
from cte

------------------------------------------------------------------------------------------------

-- Company: Tiktok

-- Assuming that the emails table contains information about the email addresses of new TikTok users 
-- and the texts table contains information about the text confirmation received by each user, 
-- write a SQL query that retrieves the IDs of the users who did not confirm on the first day of sign-up, but confirmed on the second day.

select distinct user_id
from emails em
join texts txt on em.email_id = txt.email_id
where txt.signup_action = 'Confirmed'
      and txt.action_date = em.signup_date + INTERVAL '1 day'


-- output 
-- signup_action = 'Confirmed'
-- action_date = signup_date + INTERVAL '1 day'

------------------------------------------------------------------------------------------------

-- Company: Microsoft

-- Write a SQL query to find the top 2 power users who sent the most messages on 
-- Microsoft Teams in August 2022. Display the IDs of these 2 users along with the total number of messages they sent.

select sender_id, count(message_id) as message_count
from messages
where date_trunc('month',sent_date) = '2022-08-01'
group by 1
order by message_count desc
limit 2

-- output
-- top 2 power users
-- in August 2022 
-- displat ID of these 2 users along with total messages

------------------------------------------------------------------------------------------------

-- Company: Amazon

-- You are given a reviews table containing reviews of various products. 
-- Write a query to find the average stars for each product every month.

-- Additional requests:

-- The month should be in numerical value.
-- The star rating should be rounded to two decimal places.
-- The output should be sorted by month followed by the product id.

select product_id,
extract(month from submit_date), round(avg(stars),2)
from reviews
group by 1,2


-- output
-- average stars for each product every month
-- the month should be numerical
-- star rating should be rounded 2 decimal
-- sorted by month followed by the product_id

------------------------------------------------------------------------------------------------

-- Company: Tesla

-- Write a query to find all the parts that have been initiated for assembly but remain unfinished.

select part
from parts_assembly
where finish_date is null








