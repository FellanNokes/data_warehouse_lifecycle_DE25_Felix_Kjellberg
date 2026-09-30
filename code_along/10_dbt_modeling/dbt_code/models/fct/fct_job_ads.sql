with job_ads as (select * from {{ ref('src_job_ads') }})

select 
    {{ occupation_key() }} as occupation_id,
    {{ employer_key() }} as employer_id,
    {{ job_details_key() }} as job_details_id,
    {{ auxilliary_attributes_key() }} as auxilliary_attributes_id,
    vacancies,
    relevance,
    application_deadline
from job_ads