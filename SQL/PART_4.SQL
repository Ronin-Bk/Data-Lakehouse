-- CREATED BY: BALAKUMARAN SIVANESAN
-- CREATION DATE: 08/28/2024
-- DESCRIPTION: PART 4: BUSINESS QUESTION

--If you were to launch a new Youtube channel tomorrow, which category (excluding “Music” and “Entertainment”) of video will you be trying to create to have them appear in the top trend of Youtube ? 

WITH trending_categories AS (
    SELECT 
        category_title,
        country,
        COUNT(DISTINCT video_id) AS video_count
    FROM assignment_1.assignment_1schema.table_youtube_final   
    WHERE category_title NOT IN ('Music', 'Entertainment')
    GROUP BY category_title, country
    ORDER BY video_count DESC
)
SELECT 
    category_title,
    video_count
FROM trending_categories
ORDER BY video_count DESC
LIMIT 1;

--Will this strategy work in every country?

-- TESTING THE STRATERGY ON COUNTRY 'BRAZIL'
WITH trending_categories AS (
    SELECT 
        category_title,
        country,
        COUNT(DISTINCT video_id) AS video_count
    FROM assignment_1.assignment_1schema.table_youtube_final
    WHERE country = 'BR'
        AND category_title NOT IN ('Music', 'Entertainment')
    GROUP BY category_title, country
    ORDER BY video_count DESC
)
SELECT 
    category_title,
    video_count
FROM trending_categories
ORDER BY video_count DESC
LIMIT 1;

-- TESTING THE STRATERGY ON COUNTRY 'CANADA'
WITH trending_categories AS (
    SELECT 
        category_title,
        country,
        COUNT(DISTINCT video_id) AS video_count
    FROM assignment_1.assignment_1schema.table_youtube_final
    WHERE country = 'CA'
        AND category_title NOT IN ('Music', 'Entertainment')
    GROUP BY category_title, country
    ORDER BY video_count DESC
)
SELECT 
    category_title,
    video_count
FROM trending_categories
ORDER BY video_count DESC
LIMIT 1;

-- TESTING THE STRATERGY ON COUNTRY 'GERMANY'
WITH trending_categories AS (
    SELECT 
        category_title,
        country,
        COUNT(DISTINCT video_id) AS video_count
    FROM assignment_1.assignment_1schema.table_youtube_final
    WHERE country = 'DE'
        AND category_title NOT IN ('Music', 'Entertainment')
    GROUP BY category_title, country
    ORDER BY video_count DESC
)
SELECT 
    category_title,
    video_count
FROM trending_categories
ORDER BY video_count DESC
LIMIT 1;

-- TESTING THE STRATERGY ON COUNTRY 'FRANCE'
WITH trending_categories AS (
    SELECT 
        category_title,
        country,
        COUNT(DISTINCT video_id) AS video_count
    FROM assignment_1.assignment_1schema.table_youtube_final
    WHERE country = 'FR'
        AND category_title NOT IN ('Music', 'Entertainment')
    GROUP BY category_title, country
    ORDER BY video_count DESC
)
SELECT 
    category_title,
    video_count
FROM trending_categories
ORDER BY video_count DESC
LIMIT 1;

-- TESTING THE STRATERGY ON COUNTRY 'GREAT BRITIAN'
WITH trending_categories AS (
    SELECT 
        category_title,
        country,
        COUNT(DISTINCT video_id) AS video_count
    FROM assignment_1.assignment_1schema.table_youtube_final
    WHERE country = 'GB'
        AND category_title NOT IN ('Music', 'Entertainment')
    GROUP BY category_title, country
    ORDER BY video_count DESC
)
SELECT 
    category_title,
    video_count
FROM trending_categories
ORDER BY video_count DESC
LIMIT 1;

-- TESTING THE STRATERGY ON COUNTRY 'INDIA'
WITH trending_categories AS (
    SELECT 
        category_title,
        country,
        COUNT(DISTINCT video_id) AS video_count
    FROM assignment_1.assignment_1schema.table_youtube_final
    WHERE country = 'IN'
        AND category_title NOT IN ('Music', 'Entertainment')
    GROUP BY category_title, country
    ORDER BY video_count DESC
)
SELECT 
    category_title,
    video_count
FROM trending_categories
ORDER BY video_count DESC
LIMIT 1;

-- TESTING THE STRATERGY ON COUNTRY 'JAPAN'
WITH trending_categories AS (
    SELECT 
        category_title,
        country,
        COUNT(DISTINCT video_id) AS video_count
    FROM assignment_1.assignment_1schema.table_youtube_final
    WHERE country = 'JP'
        AND category_title NOT IN ('Music', 'Entertainment')
    GROUP BY category_title, country
    ORDER BY video_count DESC
)
SELECT 
    category_title,
    video_count
FROM trending_categories
ORDER BY video_count DESC
LIMIT 1;

-- TESTING THE STRATERGY ON COUNTRY 'KOREA'
WITH trending_categories AS (
    SELECT 
        category_title,
        country,
        COUNT(DISTINCT video_id) AS video_count
    FROM assignment_1.assignment_1schema.table_youtube_final
    WHERE country = 'KR'
        AND category_title NOT IN ('Music', 'Entertainment')
    GROUP BY category_title, country
    ORDER BY video_count DESC
)
SELECT 
    category_title,
    video_count
FROM trending_categories
ORDER BY video_count DESC
LIMIT 1;

-- TESTING THE STRATERGY ON COUNTRY 'MEXICO'
WITH trending_categories AS (
    SELECT 
        category_title,
        country,
        COUNT(DISTINCT video_id) AS video_count
    FROM assignment_1.assignment_1schema.table_youtube_final
    WHERE country = 'MX'
        AND category_title NOT IN ('Music', 'Entertainment')
    GROUP BY category_title, country
    ORDER BY video_count DESC
)
SELECT 
    category_title,
    video_count
FROM trending_categories
ORDER BY video_count DESC
LIMIT 1;

-- TESTING THE STRATERGY ON COUNTRY 'UNITED STATES'
WITH trending_categories AS (
    SELECT 
        category_title,
        country,
        COUNT(DISTINCT video_id) AS video_count
    FROM assignment_1.assignment_1schema.table_youtube_final
    WHERE country = 'US'
        AND category_title NOT IN ('Music', 'Entertainment')
    GROUP BY category_title, country
    ORDER BY video_count DESC
)
SELECT 
    category_title,
    video_count
FROM trending_categories
ORDER BY video_count DESC
LIMIT 1;
