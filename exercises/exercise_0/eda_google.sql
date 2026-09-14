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





