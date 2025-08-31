{{ config(
    materialized='table',
    description='A dimension table for customers with aggregated order data',
    tags=['dimension', 'customer']
) }}

SELECT
    sc.customer_id as customer_id,
    trim(sc.first_name) as first_name,
    trim(sc.last_name) as last_name,
    lower(trim(sc.email))as email,
    sc.phone as phone,
  
   cs.dbt_scd_id,
    cs.dbt_updated_at,
    cs.dbt_valid_from,
   cs.dbt_valid_to
FROM {{ ref('stg_customers') }} sc
join {{ ref('customers_snapshot') }} cs
    on sc.customer_id = cs.customer_id

