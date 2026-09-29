with src_occupation as (select * from {{ ref('src_occupation') }})

select distinct
    occupation_id,
    occupation,
    occupation_group_id,
    occupation_group,
    occupation_field_id,
    occupation_field
from src_occupation