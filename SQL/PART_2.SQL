-- CREATED BY: BALAKUMARAN SIVANESAN
-- CREATION DATE: 08/28/2024
-- DESCRIPTION: PART 2: DATA CLEANING


-- QUESTION 1: In “table_youtube_category” which category_title has duplicates if we don’t take into account the categoryid (return only a single row) ?
SELECT * FROM assignment_1.assignment_1schema.table_youtube_category;

SELECT category_title FROM assignment_1.assignment_1schema.table_youtube_category
GROUP BY category_title
HAVING COUNT(DISTINCT categoryId) > 1
LIMIT 1;

-- QUESTION 2: In “table_youtube_category” which category_title only appears in one country ?
SELECT category_title FROM assignment_1.assignment_1schema.table_youtube_category
GROUP BY category_title
HAVING COUNT(DISTINCT country) = 1;

-- Question 3: In “table_youtube_final”, what is the categoryid of the missing category_title?
SELECT * FROM ASSIGNMENT_1.ASSIGNMENT_1SCHEMA.TABLE_YOUTUBE_FINAL;

SELECT categoryid FROM ASSIGNMENT_1.ASSIGNMENT_1SCHEMA.TABLE_YOUTUBE_FINAL
WHERE category_title IS NULL; --1,563 NULL in category_title

-- Question 4: Update the table_youtube_final to replace the NULL values in category_title with the answer from the previous question.
UPDATE assignment_1.assignment_1schema.table_youtube_final
SET category_title = (
    SELECT CATEGORY_TITLE FROM assignment_1.assignment_1schema.table_youtube_category 
    GROUP BY CATEGORY_TITLE
    HAVING COUNT(DISTINCT COUNTRY)=1
)
WHERE category_title IS NULL;

SELECT DISTINCT categoryId FROM assignment_1.assignment_1schema.table_youtube_final WHERE category_title IS null;

SELECT * FROM assignment_1.assignment_1schema.table_youtube_final;

-- Question 5: In “table_youtube_final”, which video doesn’t have a channeltitle (return only the title)?
SELECT title FROM assignment_1.assignment_1schema.table_youtube_final
WHERE channeltitle IS NULL;

-- Question 6: Delete from “table_youtube_final“, any record with video_id = “#NAME?”
SELECT video_id FROM assignment_1.assignment_1schema.table_youtube_final
WHERE video_id = '#NAME?'; --32081 RECORDS

DELETE FROM assignment_1.assignment_1schema.table_youtube_final 
WHERE video_id = '#NAME?';

SELECT * FROM assignment_1.assignment_1schema.table_youtube_final;

-- Question 7: Create a new table called “table_youtube_duplicates”  containing only the “bad” duplicates by using the row_number() function.
CREATE OR REPLACE TABLE assignment_1.assignment_1schema.table_youtube_duplicates AS
SELECT * 
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY video_id, country, trending_date ORDER BY view_count DESC) AS row_num
    FROM assignment_1.assignment_1schema.table_youtube_final
) AS Duplicates
WHERE row_num > 1;  -- Keeping only the duplicates

select * from assignment_1.assignment_1schema.table_youtube_duplicates;

-- Question 8: Delete the duplicates in “table_youtube_final“ by using “table_youtube_duplicates”.
DELETE FROM assignment_1.assignment_1schema.table_youtube_final
WHERE ID IN (SELECT ID FROM assignment_1.assignment_1schema.table_youtube_duplicates);

-- Question 9:	Count the number of rows in “table_youtube_final“ and check that it is equal to 2,597,494 rows.SELECT COUNT(*) AS total_rows
SELECT COUNT(*) AS total_rows
FROM assignment_1.assignment_1schema.table_youtube_final; --2597494 RECORDS


