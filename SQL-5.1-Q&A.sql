-- Company: Spotify

-- You're assigned to analyze a Spotify-like dataset that records user listening habits. 
-- For each user, compute the total listening time and the count of unique songs they've listened to.
-- Round the total listening duration to the nearest whole minute.

select user_id, count(distinct song_id) as unique_song_count, 
round(sum(listen_duration))
from listening_habits
group by 1

-- output
-- for each user compute the total listening time
-- for each user count of unique songs
-- round the total listening duration to the nearest whole minute 

---------------------------------------------------------------------------------------------------------

-- Company: Google
  
-- Establish the email activity rank for each user, considering the total number of emails sent. 
-- The user sending the most emails secures rank 1 and so on. 
-- Output includes user, total emails, and their activity rank. 
-- Records are organized by total emails in descending order, and for users with the same email count, alphabetical sorting is applied.

select 
from_user, 
count(from_user), 
row_number() over(order by count(from_user) desc, from_user asc) as rank
from google_gmail_emails
group by from_user
order by 2 desc
-- output
-- user, total_emails, activity_rank

---------------------------------------------------------------------------------------------------------

-- Company: Yelp
  
-- Identify the review_text with the highest count of 'cool' votes. In case of a tie, select the first occurrence. 
-- Output both the business name and the review text associated with the highest number of 'cool' votes

with cte as(
  select business_name, review_text,max(cool) as cool
  from yelp_reviews
  group by business_name, review_text
  
)
select * 
from cte
order by cool desc
limit 1

---------------------------------------------------------------------------------------------------------

-- Company: ESPN

-- Identify the top 10 quarterbacks with the highest points in a single game in 2016.
-- Output the quarterback along with the corresponding game points. 
-- Organize records based on game points in descending order and present only the top 10 rows, 
-- without considering any ties in game points that might result in more than 10 quarterbacks in the output.

select qb, game_points
from qbstats_2015_2016 
where year = 2016
order by game_points desc
limit 10


-- output 
-- top 10 qb with the highest points in a single game in 2016

-- output -> qb and game_points
-- order by game_points desc and limit 10 
-- without considering any ties in game_points -> rank()

---------------------------------------------------------------------------------------------------------

-- Company: Amazon

-- Calculate the total number of orders each week, considering only those received during the first quarter of 2023.

select week, sum(quantity)
from orders_analysis
where stage_of_order = 'received' and 
week between '2023-01-01' and '2023-03-31'
group by week
order by 1
-- calculate total orders each week
-- only those RECEIVED during the first quarter of 2023

-- STATEMENTS
-- TOTAL NUMBER EACH WEEK 
-- stage_of_order = 'received'
-- week BETWEEN 01-01-2023 AND 01-03-2023

---------------------------------------------------------------------------------------------------------


