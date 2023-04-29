{{
  config(
    materialized='table'
  )
}}

with order_products as (
    select * from {{ ref('int_orders_products')}}
)

, final as (
    select 
    user_guid
    , count(distinct product_guid) as orders_quantity
    , sum(order_total) as order_total
    , min(created_at) as first_order_at
    , max(created_at) as latest_order_at
    from order_products
        group by 1
)

select * from final