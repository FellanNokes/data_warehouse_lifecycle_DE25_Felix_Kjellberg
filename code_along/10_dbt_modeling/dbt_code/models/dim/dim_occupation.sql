with src_occupation as (select * from {{ ref('src_occupation') }})

select distinct
    {{ occupation_key() }} as occupation_id,
    occupation_group__concept_id as occupation_group_id,
    occupation_field__concept_id as occupation_field_id,
    occupation__label as occupation,
    occupation_group__label as occupation_group,
    occupation_field__label as occupation_field
from src_occupation