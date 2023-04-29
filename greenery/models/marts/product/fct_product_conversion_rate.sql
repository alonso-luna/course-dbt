{{
  config(
    materialized = 'table'
  )
}}

with events as (
  select * from {{ ref('stg_postgres__events') }}
)

, products as (
  select * from {{ ref('dim_products') }}
)

, orders_products as (
  select * from {{ ref('int_orders_products') }}
)

-- Previous code without Macros
/*
, final as (
    select
    products.product_guid
    , products.name as product_name
    , events.created_at as event_date
    , count(events.session_guid) as sessions
    , sum(case when events.event_type = 'add_to_cart' then 1 else 0 end) as add_to_carts
    , sum(case when events.event_type = 'checkout' then 1 else 0 end) as checkouts
    , sum(case when events.event_type = 'package_shipped' then 1 else 0 end) as package_shippeds
    , sum(case when events.event_type = 'page_view' then 1 else 0 end) as page_views
    from events 
    left join products
        on events.product_guid = products.product_guid
    group by 1, 2, 3
)
*/

, final as (
    select
    events.session_guid
    , orders_products.order_guid
    , orders_products.product_guid
    , products.name as product_name
    {{ agg_types('stg_postgres__events', 'event_type') }}
    from events
    left join orders_products
        on events.order_guid = orders_products.order_guid
    left join products
        on orders_products.product_guid = products.product_guid
    where events.order_guid is not null
    group by 1, 2, 3, 4
)

select * from final