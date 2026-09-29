with job_ads as (select * from {{ ref('src_job_ads') }})

select 
    job_id,
    job_details_id,
    occupation_id,
    auxilliary_attributes_id,
    employer_id,
    vacancies,
    relevance,
    application_deadline
from job_ads