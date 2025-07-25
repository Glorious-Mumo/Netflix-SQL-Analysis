CREATE SCHEMA netflix_analysis;
USE netflix_analysis;

 -- I first imported the netflix dataset .
SELECT * FROM Netflix ;

 -- count of unique titles in the dataset
 SELECT COUNT(DISTINCT title) AS unique_titles FROM Netflix;
  -- or
select count(distinct title) from Netflix ;

 -- How many are movies and how many are Tv shows
SELECT type, COUNT(*) AS total FROM Netflix GROUP BY type;

 -- Average rating of all shows
 Select AVG(rating) AS average_rating from Netflix ;

 -- Genre with the highest number of titles
 SELECT genre, COUNT(*) AS count_genre FROM Netflix GROUP BY genre ORDER BY count_genre DESC limit 3;
 
  -- country with the most netflix content production 
  Select country , COUNT(*) AS country_count from Netflix group by country order by country_count DESC ;
  
   -- Which 5 years had the most releases?
   Select release_year , count(*) as count_years from Netflix group by release_year order by count_years desc limit 5 ;
  
 -- average cast count for each genre
 SELECT genre, AVG(cast_count) AS avg_cast FROM Netflix GROUP BY genre;
 
  -- the highest-rated show in each country
SELECT country, title, rating FROM (SELECT country, title, rating, RANK() OVER (PARTITION BY country ORDER BY rating DESC) AS rk FROM Netflix
) ranked
WHERE rk = 1;

 -- Rank all shows by rating within each country.
 SELECT title, country, rating, RANK() OVER (PARTITION BY country ORDER BY rating DESC) AS rating_rank
FROM Netflix;

 -- Classifing content as "Old" if released before 2015, otherwise "Modern"
SELECT *, CASE WHEN release_year < 2015 THEN 'Old'ELSE 'Modern'END AS content_classification FROM Netflix;

 -- Extracting number of minutes/seasons from the duration
SELECT *, CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) AS duration_value FROM Netflix;

 -- The country whose TV Shows have the highest average rating.
SELECT country, AVG(rating) AS avg_rating FROM Netflix WHERE type = 'TV Show' GROUP BY country ORDER BY avg_rating DESC LIMIT 1;

 -- genre with the most diverse language usage
 select genre , count(Distinct language) as language_use from Netflix group by genre order by language_use DESC limit 1 ;
 
 

 
 
 