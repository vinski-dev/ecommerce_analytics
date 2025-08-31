{{ config(
    materialized='table'
    
) }}


select o.order_id as order_id,
       o.order_date as  order_date, 
       o.customer_id as customer_id,
       oi.product_id as product_id,
       oi.quantity as quantity,
       oi.unit_price as unit_price,
       p.cost as cost,
       (oi.unit_price- p.cost) as margin

from {{ ref('stg_orders') }} o
left join {{ ref('stg_order_items') }} oi on o.order_id = oi.order_id
left join {{ ref('stg_products')}} p on p.product_id = oi.product_id


