{{
    config(
        materialized = 'table'
    )
}}

with users as (
    select * from {{ ref('stg_postgres__users')}}
)

, final as (
    select
    users.user_guid
    , users.first_name
    , users.last_name
    , users.email
    , users.phone_number
    , users.created_at
    , users.updated_at
    , users.address_guid
from users
)

select * from final