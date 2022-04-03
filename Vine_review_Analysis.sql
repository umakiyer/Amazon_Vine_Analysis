-- vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

--- READ the data file
SELECT * from vine_table

--- STEP 1 Deliverable 2 ----
SELECT * 
INTO vine_20
FROM vine_table
WHERE total_votes >= 20;

-- STEP 2 Deliverable 2 ----
SELECT * 
INTO vine_20_50
from vine_20
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5 

-- STEP 3 Deliverable 2 ---
SELECT * 
INTO vine_20_50_y
from vine_20_50
WHERE vine = 'Y' 

SELECT count(*) as total_start_count_vine_y
INTO vine_20_50_y_count
from vine_20_50
WHERE vine = 'Y'

-- STEP 4 Deliverable 2 ---
SELECT * 
INTO vine_20_50_n
from vine_20_50
WHERE vine = 'N'

SELECT count(*) as total_star_count_vine_N
INTO vine_20_50_n
from vine_20_50
WHERE vine = 'N'

--- STEP 5 
--- 5 star rating for VINE = Y
select count(*) as Five_Star_Vine_Y
INTO vine_20_50_y_5
from vine_20_50_y
where star_rating = 5

--- 5 star rating for VINE = N
select count(*) as five_star_vine_n
INTO vine_20_50_n_5
from vine_20_50_n
where star_rating = 5

--- Percentage for Vine - Y
with
T1 as (select count as NumA from vine_20_50_y_5),
T2 as (select count as NumB from vine_20_50_y_count)
SELECT CAST(T1.NumA AS FLOAT) / CAST(T2.NumB AS FLOAT) * 100 as PctVineY
FROM T1, T2

--- Percentage for Vine - N
with
T1 as (select count as NumA from vine_20_50_n_5),
T2 as (select count as NumB from vine_20_50_n_count)
SELECT CAST(T1.NumA AS FLOAT) / CAST(T2.NumB AS FLOAT) * 100 as PctVineN
FROM T1, T2

--- STEP 5a 
--- 1 star rating for VINE = Y
select count(*) as one_star_vine_y
INTO vine_20_50_y_1
from vine_20_50_y
where star_rating = 1

--- 1 star rating for VINE = N
select count(*) as one_star_vine_n
INTO vine_20_50_n_1
from vine_20_50_n
where star_rating = 1

--- Percentage for Vine - Y
with
T1 as (select one_star_vine_y as NumA from vine_20_50_y_1),
T2 as (select count as NumB from vine_20_50_y_count)
SELECT CAST(T1.NumA AS FLOAT) / CAST(T2.NumB AS FLOAT) * 100 as PctVineY1
FROM T1, T2

--- Percentage for Vine - N
with
T1 as (select one_star_vine_n as NumA from vine_20_50_n_1),
T2 as (select count as NumB from vine_20_50_n_count)
SELECT CAST(T1.NumA AS FLOAT) / CAST(T2.NumB AS FLOAT) * 100 as PctVinen1
FROM T1, T2
