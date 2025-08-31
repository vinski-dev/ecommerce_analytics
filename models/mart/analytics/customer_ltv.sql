{{ config(materialized='table') }}

with customer_orders as (
    select
        c.customer_id,
        c.full_name,
        c.email,
        c.customer_created_at,
        
        count(distinct o.order_id) as total_orders,
        sum(o.total_amount) as total_revenue,
        avg(o.total_amount) as avg_order_value,
        min(o.order_date) as first_order_date,
        max(o.order_date) as last_order_date,
        
        datediff('day', min(o.order_date), max(o.order_date)) as customer_lifetime_days
        
    from {{ ref('stg_customers') }} c
    left join {{ ref('stg_orders') }} o
        on c.customer_id = o.customer_id
    where o.status = 'completed'
    group by 1, 2, 3, 4
)

select
    *,
    
    -- Calculate LTV metrics
    case 
        when customer_lifetime_days > 0 
        then total_revenue / (customer_lifetime_days / 365.0)
        else total_revenue
    end as annual_revenue_rate,
    
    case
        when total_revenue >= 500 then 'High Value'
        when total_revenue >= 200 then 'Medium Value'
        when total_revenue >= 50 then 'Low Value'
        else 'New/Inactive'
    end as customer_segment,
    
    case
        when total_orders = 1 then 'One-time Buyer'
        when total_orders between 2 and 5 then 'Repeat Buyer'
        when total_orders > 5 then 'Loyal Customer'
    end as loyalty_segment

from customer_orders
