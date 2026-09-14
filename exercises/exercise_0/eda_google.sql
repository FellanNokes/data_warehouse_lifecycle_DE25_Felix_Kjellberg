SHOW DATABASES;

SHOW SCHEMAS IN DATABASE google_keywords;

SHOW TABLES IN SCHEMA google_keywords.datafeeds;

USE WAREHOUSE COMPUTE_WH;
USE DATABASE google_keywords;
USE SCHEMA datafeeds;

SELECT * FROM google_keywords LIMIT 10;

ALTER WAREHOUSE COMPUTE_WH SET AUTO_SUSPEND = 60;

SELECT 
    COUNT(*) as total_rows
FROM google_keywords;

SELECT 
    MIN(date) as min_search_date,
    MAX(date) as max_search_date
FROM google_keywords;

SELECT
    keyword,
    COUNT(*) AS search_count
FROM google_keywords
GROUP BY keyword
ORDER BY search_count DESC
LIMIT 10;


SELECT 
    COUNT(DISTINCT keyword) as unique_keywords
FROM google_keywords;

SELECT 
    platform,
    COUNT(*) AS num_rows,
    SUM(CALIBRATED_USERS) AS total_users
FROM google_keywords
GROUP BY platform
ORDER BY total_users DESC;

SELECT 
    KEYWORD,
    COUNT(*) AS search_count
FROM google_keywords
WHERE COUNTRY = 752
GROUP BY KEYWORD
ORDER BY search_count DESC
LIMIT 20;

SELECT 
    COUNTRY,
    COUNT(*) AS search_count
FROM google_keywords
WHERE KEYWORD = 'spotify'
GROUP BY COUNTRY
ORDER BY search_count DESC
LIMIT 10;