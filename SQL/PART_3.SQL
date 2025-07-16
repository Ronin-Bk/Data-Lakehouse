-- CREATED BY: BALAKUMARAN SIVANESAN
-- CREATION DATE: 08/28/2024
-- DESCRIPTION: PART 3: DATA ANALYSIS

--1.	What are the 3 most viewed videos for each country in the Gamingse category for the trending_date = ‘'2024-04-011. Order the result by country and the rank

SELECT country, title, channeltitle, view_count,
    RANK() OVER (PARTITION BY country ORDER BY view_count DESC) AS RK
FROM
    assignment_1.assignment_1schema.table_youtube_final
WHERE
    category_title = 'Gaming'
    AND trending_date = '2024-04-01'
QUALIFY
    RK <= 3
ORDER BY
    country,
    RK;

-- 2.	For each country, count the number of distinct video with a title containing the word “BTSa” (case insensitive) and order the result by count in a descending order.

SELECT COUNTRY, COUNT(DISTINCT VIDEO_ID) AS CT
FROM
    ASSIGNMENT_1.ASSIGNMENT_1SCHEMA.TABLE_YOUTUBE_FINAL
WHERE
    lower(TITLE) LIKE '%bts%'
GROUP BY
    country
ORDER BY
    CT DESC;

--3. For each country, year and month (in a single column) and only for the yearefore2024, which video is the most viewed and what is its likes_ratio (defined as the percentage of likes against view_count) truncated to 12 decimals. Order the result by year_month and country. The output should like this:

WITH ranked_videos AS (
    SELECT 
        country,
        video_id,
        title,
        channeltitle,
        category_title,
        view_count,
        likes,
        trending_date,
        DATE_TRUNC('month', trending_date)::DATE AS year_month,
        ROW_NUMBER() OVER (PARTITION BY country, TO_CHAR(trending_date, 'YYYY-MM') ORDER BY view_count DESC) AS rank
    FROM assignment_1.assignment_1schema.table_youtube_final
    WHERE EXTRACT(YEAR FROM trending_date) = 2024
)
SELECT 
    country,
    year_month,
    title,
    channeltitle,
    category_title,
    view_count,
    ROUND((likes / view_count) * 100, 2) AS likes_ratio -- Truncated to 2 decimals
FROM ranked_videos
WHERE rank = 1
ORDER BY year_month, country;

--4. For each country, which category_title has the most distinct videos and what is its percentage (2 decimals) out of the total distinct number of videos of that country? Only look at the data from 2022. Order the result by category_title and country. The output should like this:

WITH country_category_video_count AS (
    SELECT 
        country,
        category_title,
        COUNT( DISTINCT video_id) AS total_category_video
    FROM assignment_1.assignment_1schema.table_youtube_final
    WHERE YEAR(trending_date) >= 2022 -- EXTRACT(YEAR FROM trending_date) >= 2022  -- Data from 2022
    GROUP BY category_title,country
    ORDER BY total_category_video
),
country_video_count AS (
    SELECT 
        country,
        COUNT(DISTINCT video_id) AS total_country_video
    FROM assignment_1.assignment_1schema.table_youtube_final
    WHERE EXTRACT(YEAR FROM trending_date) >= 2022  -- Data from 2022
    GROUP BY country
),
category_percentage AS (
    SELECT
        cc.country,
        cc.category_title,
        cc.total_category_video,
        cv.total_country_video,
        ROUND((cc.total_category_video / cv.total_country_video) * 100, 2) AS percentage  -- Truncate to 2 decimals
    FROM country_category_video_count cc
    JOIN country_video_count cv
    ON cc.country = cv.country
 ),
ranked_categories AS (
    SELECT
        cp.*,
        rank() OVER (PARTITION BY cp.country ORDER BY cp.total_category_video DESC) AS rn  -- Rank categories by distinct video count
    FROM category_percentage cp
)

SELECT
    country,
    category_title,
    total_category_video,
    total_country_video,
    percentage
FROM ranked_categories
WHERE rn = 1  -- Select the top-ranked category for each country
ORDER BY category_title, country;

--5. Which channeltitle has produced the most distinct videos and what is this number ?

SELECT 
    channeltitle,
    COUNT(DISTINCT video_id) AS distinct_video_count
FROM assignment_1.assignment_1schema.table_youtube_final
GROUP BY channeltitle
ORDER BY distinct_video_count DESC
LIMIT 1;





