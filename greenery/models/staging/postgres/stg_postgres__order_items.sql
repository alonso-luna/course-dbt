{{
  config(
    materialized = 'table'
  )
}}

with source as (
  select * from {{ source('postgres', 'order_items') }}
)

, renamed_recast as (
  select
    order_id as order_guid
    , product_id as product_guid
    , quantity
  from source
)

select * from renamed_recast