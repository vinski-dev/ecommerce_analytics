{{ config( materialized = 'view', schema = 'staging') }}


select
    customer_id,
    trim(first_name) as first_name,
    trim(last_name) as last_name,
    lower(trim(email)) as email,
    phone,
    created_at::timestamp_ntz as customer_created_at,
    updated_at::timestamp_ntz as customer_updated_at,
    
    -- Derived fields
    concat(trim(first_name), ' ', trim(last_name)) as full_name,
    case 
        when email like '%@gmail.com' then 'Gmail'
        when email like '%@yahoo.com' then 'Yahoo'
        when email like '%@hotmail.com' then 'Hotmail'
        else 'Other'
    end as email_domain_category

from {{ source('raw', 'customers') }}
