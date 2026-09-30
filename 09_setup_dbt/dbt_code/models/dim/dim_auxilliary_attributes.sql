with src_auxilliary_attributes as (select * from {{ ref('src_auxilliary_attributes') }})

select distinct
    auxilliary_attributes_id,
    experience_required,
    driver_license,
    access_to_own_car
from src_auxilliary_attributes