CREATE DATABASE social_media_analysis;
 USE social_media_analysis;
show TABLES;
SELECT COUNT(*) AS total_rows
FROM social_media_cleaned;

SELECT *
FROM social_media_cleaned
LIMIT 20;

#Q1-Which platform generated the highest total engagement?
SELECT 
    Platform,
    SUM(Total_Engagements) AS Total_Engagement
FROM social_media_cleaned
GROUP BY Platform
ORDER BY Total_Engagement DESC;
 
#Q2-Which social media platform has the highest average engagement rate?
SELECT
    Platform,
    ROUND(AVG(`Engagement_Rate_%`), 2) AS Avg_Engagement_Rate
FROM social_media_cleaned
GROUP BY Platform
ORDER BY Avg_Engagement_Rate DESC;

# Q3-Which content type generates the highest total engagement?
SELECT
    Content_Type,
    SUM(Total_Engagements) AS Total_Engagement
FROM social_media_cleaned
GROUP BY Content_Type
ORDER BY Total_Engagement DESC;

#Q4-Which country generates the highest total engagement?
SELECT
    Country,
    SUM(Total_Engagements) AS Total_Engagement
FROM social_media_cleaned
GROUP BY Country
ORDER BY Total_Engagement DESC;

#Q5-Which age group generates the highest total engagement?
SELECT
    Age_Group,
    SUM(Total_Engagements) AS Total_Engagement
FROM social_media_cleaned
GROUP BY Age_Group
ORDER BY Total_Engagement DESC;

#Q6- Which are the TOP 10 posts with the highest total engagement?
SELECT
    Post_ID,
    Platform,
    Content_Type,
    Content_Category,
    Total_Engagements
FROM social_media_cleaned
ORDER BY Total_Engagements DESC
LIMIT 10;

#Q7-Among the Top 10 highest-engagement posts, which Platform + Content Type + Content Category combinations appear, and how much engagement do they generate?
SELECT
    Platform,
    Content_Type,
    Content_Category,
    COUNT(*) AS Number_of_Top_Posts,
    SUM(Total_Engagements) AS Total_Engagement
FROM (
    SELECT *
    FROM social_media_cleaned
    ORDER BY Total_Engagements DESC
    LIMIT 10
) AS Top10
GROUP BY Platform, Content_Type, Content_Category
ORDER BY Total_Engagement DESC;

#Q7 - Which platform and content type combination generates the highest total engagement?

SELECT
    Platform,
    Content_Type,
    SUM(Total_Engagements) AS Total_Engagement
FROM social_media_cleaned
GROUP BY Platform, Content_Type
ORDER BY Total_Engagement DESC;

#Q8_Which content category generates the highest total engagement?
SELECT
    Content_Category,
    SUM(Total_Engagements) AS Total_Engagement
FROM social_media_cleaned
GROUP BY Content_Category
ORDER BY Total_Engagement DESC;