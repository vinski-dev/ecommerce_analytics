{% snapshot customers_snapshot %}
{{
    config(
        target_schema='snapshots',
        unique_key='customer_id',
        strategy='timestamp',
        updated_at='updated_at'
     
    )
}}
select 
    customer_id,
    first_name,
    last_name,
    email,
    phone,
    customer_updated_at as updated_at
    
from {{ ref('stg_customers') }} 

{% endsnapshot %}
   