with stg_job_ads as (select * from {{ source('job_ads', 'stg_ads') }})

select
    {{ auxilliary_attributes_key() }} as auxilliary_attributes_id,
    experience_required as experience_required,
    driving_license_required as driver_license,
    access_to_own_car as access_to_own_car
from stg_job_ads