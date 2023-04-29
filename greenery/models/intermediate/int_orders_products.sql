{{
    config(
        materialized = 'table'
    )
}}

with orders as (
    select * from {{ ref('stg_postgres__orders')}}
)

, order_items as (
    select * from {{ ref('stg_postgres__order_items')}}
)

, final as (
    select
        orders.order_guid
        , orders.user_guid
        , orders.promo_guid
        , orders.address_guid
        , orders.tracking_guid
        , orders.created_at
        , orders.order_cost
        , orders.shipping_cost
        , orders.order_total
        , orders.shipping_service
        , orders.estimated_delivery_at
        , orders.delivered_at
        , orders.status
        , order_items.product_guid
    from orders
    left join order_items
        on orders.order_guid = order_items.order_guid
)

select * from final