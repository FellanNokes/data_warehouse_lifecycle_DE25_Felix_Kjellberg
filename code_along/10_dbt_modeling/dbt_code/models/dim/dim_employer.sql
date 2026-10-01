with src_employer as (select * from {{ ref('src_employer') }})

select distinct
    {{ dbt_utils.generate_surrogate_key([
    'employer_workplace',
    'workplace_address__municipality',
    'workplace_street_address',
    'workplace_city']) 
    }} as employer_id,
    employer_name,
    employer_workplace,
    employer_organization_number,
    workplace_address__municipality,
    workplace_street_address,
    workplace_region,
    workplace_postcode,
    coalesce(
        {{ capitlize_first_letter('workplace_city') }},
        'Stad ej specificerad'
    ) as workplace_city,
    workplace_country
from src_employer