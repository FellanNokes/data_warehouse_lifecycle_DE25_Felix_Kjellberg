with src_job_details as (select * from {{ ref('src_job_details') }})

select distinct
    {{ job_details_key() }} as job_details_id,
    headline as headline,
    description__text as description_text,
    description__text_formatted as description_html_formatted,
    employment_type__label as employment_type,
    duration__label as duration,
    salary_type__label as salary_type,
    scope_of_work__min as scope_of_work_min,
    scope_of_work__max as scope_of_work_max
from src_job_details