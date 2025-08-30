{{ config(
    materialized = 'view',
    schema = 'staging'
) }}
select *
from {{ source('raw', 'orders_items') }}