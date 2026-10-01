with job_ads as (select * from {{ ref('src_job_ads') }})

select 
    id as job_id,
    {{ dbt_utils.generate_surrogate_key(['occupation__label']) }} as occupation_id,
    {{ dbt_utils.generate_surrogate_key([
    'employer__workplace',
    'workplace_address__municipality',
    'workplace_address__street_address',
    'workplace_address__city']) 
    }} as employer_id,
    {{ dbt_utils.generate_surrogate_key(['id']) }} as job_details_id,
    {{ dbt_utils.generate_surrogate_key(['id']) }} as auxilliary_attributes_id,
    vacancies,
    relevance,
    application_deadline
from job_ads