{% macro job_details_key() %}
    {{ dbt_utils.generate_surrogate_key([
        'headline',
        'description__text',
        'description__text_formatted',
        'employment_type__label',
        'duration__label',
        'salary_type__label',
        'scope_of_work__min',
        'scope_of_work__max'
    ]) }}
{% endmacro %}


{% macro occupation_key() %}
    {{ dbt_utils.generate_surrogate_key([
        'occupation__label',
        'occupation_group__concept_id',
        'occupation_group__label',
        'occupation_field__concept_id',
        'occupation_field__label'
    ]) }}
{% endmacro %}


{% macro employer_key() %}
    {{ dbt_utils.generate_surrogate_key([
        'employer__name',
        'employer__workplace',
        'employer__organization_number',
        'workplace_address__street_address',
        'workplace_address__region',
        'workplace_address__postcode',
        'workplace_address__city',
        'workplace_address__country'
    ]) }}
{% endmacro %}


{% macro auxilliary_attributes_key() %}
    {{ dbt_utils.generate_surrogate_key([
        'experience_required',
        'driving_license_required',
        'access_to_own_car'
    ]) }}
{% endmacro %}