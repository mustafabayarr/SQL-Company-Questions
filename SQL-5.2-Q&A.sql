-- 5 more questions and answers 
---------------------------------------------------------------------------------------------------------

-- Company: Airbnb
  
-- Create a query to find out how many times each room has been booked and 
-- calculate the total revenue generated from those reservations, considering the number of nights booked. 
-- Display the results with the room having the highest bookings at the top, followed by descending 
-- order based on the booking frequency.

select rm.name,rm.description, count(rm.name) as number_of_bookings, 
sum(rm.price * rh.number_nights) as revenue
from rooms rm
join rentalhistory rh on rh.room_id = rm.room_id
group by 1,2
order by 3 desc

-- statements
-- 1. number_of_bookings
-- 2. total revenue for each reservation

-- output
-- 1. display the highest bookings by descending order 

---------------------------------------------------------------------------------------------------------

-- Company: Meta

-- How many users from Canada have made calls to at least 3 people.

with cte as (
  select us.user_id, count(us.user_id) as NB_FREQUENT_CALLERS
  from users us
  join calls ca on us.user_id = ca.caller_id
  where country = 'Canada'
  group by 1
  having count(us.user_id) >= 3)

select count(*) as NB_FREQUENT_CALLERS
from cte 

-- statements
-- 1. join two tables users.users_id = calls.caller_id
-- 2. choose Canada as country where country = 'Canada'
-- 3. count users have made calls to at least three people. 

---------------------------------------------------------------------------------------------------------

-- Company: Instachart
  
-- Write an SQL query to report all customers who never order anything. Order all the names by alphabetical order.

SELECT
  c.name
FROM customers c 
left join orders o on  c.id = o.customerId
WHERE o.customerId IS NULL
ORDER BY 1 
-- statements
-- 1. find all customers who never order anything
-- 2. join two tables cus.id = or.customerId
-- 3. order by asc 

-- output
-- 1. join orders or on cus.id = or.customeId
-- 2. order by name asc

---------------------------------------------------------------------------------------------------------

-- Company: Github
  
-- How many issues are currently open in the avocado-toast repository, and were created on the month of October 2020?

-- The issues table is a list of issues is from AvocadoCorp's open source project, avocado-toast. Below describes what each column of the dataset contains:

-- created_at: the day the issue was created
-- number: the issue number
-- state: whether the issue is open or closed
-- label_bug: true if the "bug" label was applied to the issue
-- label_more_info_needed: true if the "more info needed" label was applied to the issue
-- label_feature_request: true if the "feature request" label was applied to the issue
-- label_help_wanted: true if the "help wanted" label was applied to the issue, indicating the issue is a good one for an outside contributor to work on
-- num_comments: the number of comments on the issue
-- num_commenters: the number of people commenting on the issue
-- reaction_eyes: the number of people who have added the eyes emoji reaction to the issue
-- reaction_rocket: the number of people who have added the rocket emoji reaction to the issue
-- reaction_thinking_face: the number of people who have added the thinking face emoji reaction to the issue
-- reaction_thumbs_up: the number of people who have added the thumbs up emoji reaction to the issue
-- reaction_heart: the number of people who have added the heart emoji reaction to the issue
-- reaction_tada: the number of people who have added the tada/party emoji reaction to the issue
-- reaction_thumbs_down: the number of people who have added the thumbs down emoji reaction to the issue
-- reaction_smile: the number of people who have added the smile emoji reaction to the issue

select 
  count(*) as nb_open_issues
from issues
where 
  state = 'open' 
  and DATE_TRUNC('month',created_at) = '2020-10-01'

-- output
-- currently open issuses  -- state = open
-- date october 2020

---------------------------------------------------------------------------------------------------------

-- Company: Airbnb

-- Imagine you're a Data Analyst at Airbnb. The product manager wants you to figure out 
-- if a guest's gender affects the average review score they give. 
-- You'll use the "from_type" column to identify guest reviews. "from_user" is the user_id that made the review and "to_user" is the user_id that received the review.

-- Your job is to show which gender tends to give higher review scores. 
-- The end result will be a clear list of genders and their average review scores. 
-- Round your results to 3 decimal points.

select gu.gender, round(avg(review_score),3) as avg_score
from guests gu
left join reviews re on gu.guest_id = re.from_user
where from_type = 'guest'
group by 1
order by 2 desc
limit 1

-- infos
-- reviews table
-- from_type --> guest reviews
-- from_user --> user_id who made the review
-- to_user --> user_id who received the review
-- from_user and guest_id are joins id

-- output
-- which gender tend to give higher review
-- list of genders and their average review scores
-- round the result to 3 decimal 

---------------------------------------------------------------------------------------------------------
