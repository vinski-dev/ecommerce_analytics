{{ config(
    materialized = 'view',
    schema = 'staging'
) }}
select *
from {{ source('raw', 'products') }}