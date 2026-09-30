with stg_job_ads as (select * from {{ source('job_ads', 'stg_ads') }})

select
    id as job_id,
    {{ job_details_key() }} as job_details_id,
    {{ occupation_key() }} as occupation_id,
    {{ employer_key() }} as employer_id,
    {{ auxilliary_attributes_key() }} as auxilliary_attributes_id,
    number_of_vacancies as vacancies,
    cast(relevance as float) as relevance,
    cast(application_deadline as timestamp) as application_deadline
from stg_job_ads
order by application_deadline