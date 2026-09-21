SHOW ROLES;

USE ROLE JOB_ADS_DLT_ROLE;

USE SCHEMA job_ads.staging;

SHOW TABLES;

DESC TABLE data_field_job_ads;

USE WAREHOUSE dev_wh;

SELECT * FROM data_field_job_ads;

SELECT
    relevance,
    workplace_address__street_address,
    workplace_address__postcode,
    workplace_address__municipality,
    publication_date
    webpage_url,
    source_type,
FROM data_field_job_ads
WHERE workplace_address__municipality = 'Stockholm'
LIMIT 10;

SELECT
    scope_of_work__max,
    scope_of_work__min,
    salary_type__label,
    duration__label,
    logo_url,
    employer__name,
    employer__workplace,
    employer__url
FROM data_field_job_ads;

SELECT DISTINCT
FROM data_field_job_ads