with job_ads as (select * from {{ ref('src_job_ads') }})

select 
    id as job_id,
    {{ job_details_key() }} as job_details_id,
    {{ occupation_key() }} as occupation_id,
    {{ employer_key() }} as employer_id,
    {{ auxilliary_attributes_key() }} as auxilliary_attributes_id,
    vacancies,
    cast(relevance as float) as relevance,
    cast(application_deadline as timestamp) as application_deadline
from job_ads