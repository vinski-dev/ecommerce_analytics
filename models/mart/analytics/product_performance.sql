{{ config(
    materialized='table'
) }}


SELECT
    product_id,
    SUM(unit_price) AS total_sales,
    AVG(margin) AS avg_margin
FROM {{ ref('fact_orders') }}
GROUP BY product_id
