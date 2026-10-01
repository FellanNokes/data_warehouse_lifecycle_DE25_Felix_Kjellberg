with src_occupation as (select * from {{ ref('src_occupation') }})

select distinct
    {{ dbt_utils.generate_surrogate_key(['occupation']) }} as occupation_id,
    occupation_group_id,
    occupation_field_id,
    occupation,
    occupation_group,
    occupation_field
from src_occupation