{{
  config(
    materialized = 'table'
  )
}}

with session_events_agg as (
  select * from {{ ref('int_session_events_agg') }}
)

, users as (
    select * from {{ ref('stg_postgres__users')}}
)

select 
    