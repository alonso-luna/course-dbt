{{
    config(
        materialized = 'table'
    )
}}

with orders as (
    select * from {{ ref('stg_postgres__orders')}}
)

, order_items as (
    select
        order_guid
        , count(distinct product_guid) as order_quantity
    from {{ ref('stg_postgres__order_items')}}
    group by 1
)

, final as (
    select
        orders.order_guid
        , orders.user_guid
        , orders.promo_guid
        , orders.address_guid
        , orders.created_at
        , orders.order_cost
        , orders.shipping_cost
        , orders.order_total
        , orders.tracking_guid
        , orders.shipping_service
        , orders.estimated_delivery_at
        , orders.delivered_at
        , orders.status
        , order_items.order_quantity
    from orders
    left join order_items
        on orders.order_guid = order_items.order_guid
)

select * from final