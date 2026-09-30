with stg_job_ads as (select * from {{ source('job_ads', 'stg_ads') }})

select
    occupation_group__concept_id,
    occupation_field__concept_id,
    occupation__label,
    occupation_group__label,
    occupation_field__label
from stg_job_ads