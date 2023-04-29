# Project Week 2

## PART 1. Models

**What is our overall conversation rate?**

Overall conversion rate is 62.4%

```sql
WITH PAGE_VIEWS as ( 
      SELECT COUNT(DISTINCT CASE WHEN PAGE_VIEWS > 0 THEN SESSION_GUID END) AS PAGE_VIEW_TOTAL
      FROM DEV_DB.DBT_ALONSOLUNASONYCOM.FCT_PAGE_VIEWS
), 
CONVERSION_RATE as (
     SELECT COUNT(DISTINCT CASE WHEN CHECKOUTS > 0 THEN SESSION_GUID END) AS CHECKOUT_TOTAL
     from DEV_DB.DBT_ALONSOLUNASONYCOM.FCT_PRODUCT_CONVERSION_RATE
     
)
SELECT CONVERSION_RATE.CHECKOUT_TOTAL / PAGE_VIEWS.PAGE_VIEW_TOTAL as OVERALL_CONVERSION_RATE
FROM CONVERSION_RATE
CROSS JOIN PAGE_VIEWS
```

**What is our conversation rate by product**

```sql
WITH PAGE_VIEWS AS ( 
      SELECT
          PRODUCT_GUID
          , PRODUCT_NAME
          , COUNT(DISTINCT CASE WHEN PAGE_VIEWS > 0 THEN SESSION_GUID END) AS PAGE_VIEW_TOTAL
      FROM DEV_DB.DBT_ALONSOLUNASONYCOM.FCT_PAGE_VIEWS
      GROUP BY 1, 2
), 
PRODUCT_CONVERSION_RATE as (
     SELECT 
     PRODUCT_GUID
     , PRODUCT_NAME
     , COUNT(DISTINCT CASE WHEN CHECKOUTS > 0 THEN SESSION_GUID END) AS CHECKOUT_TOTAL
     FROM DEV_DB.DBT_ALONSOLUNASONYCOM.FCT_PRODUCT_CONVERSION_RATE
     GROUP BY 1, 2
)
SELECT PRODUCT_CONVERSION_RATE.PRODUCT_NAME, DIV0(PRODUCT_CONVERSION_RATE.CHECKOUT_TOTAL, page_views.PAGE_VIEW_TOTAL) AS CONVERSION_RATE
FROM PRODUCT_CONVERSION_RATE
JOIN PAGE_VIEWS
ON PRODUCT_CONVERSION_RATE.PRODUCT_GUID = PAGE_VIEWS.PRODUCT_GUID
ORDER BY CONVERSION_RATE DESC
```

## PART 2. Models


**Create a macro to simplify part of a model(s).**

```
{% macro agg_types(table_name, column_name) %}

    {% set types = dbt_utils.get_column_values(
      table =ref(table_name)
      , column=column_name
     )
    %}

    {% for type in types %}
    , sum(case when event_type = '{{ type }}' then 1 else 0 end) as {{ type }}s
    {% endfor %}
    
{% endmacro %}
```
## PART 3. Create a macro to simplify part of a model(s).

```
post-hook:
    - "GRANT SELECT ON {{ this }} TO reporting"

on-run-end:
    - "GRANT USAGE ON SCHEMA {{ schema }} TO reporting"

```

## PART 4. Dbt packages

I used the dbt_utils in the above macro.

```
packages:
  - package: dbt-labs/dbt_utils
    version: 0.9.2
  - package: dbt-labs/codegen
    version: 0.8.1
```

## PART 5. Dbt packages

For both models 'fct_page_views' and 'fct_product_conversion_rate' I implemented the same macro, the difference between both of them is the granularity.

- fct_page_views : product, date, session
- fct_product_conversion_rate: order, product, session.  

Note: I will add date in conversion_rate for future

![alt text](https://github.com/alonso-luna/course-dbt/blob/main/greenery/DBT_Week_3_Project.png?raw=true)

## PART 6. Dbt snapshots

Bamboo 
Monstera 
Philodendron 
Pothos 
String of Pearls 
ZZ Plant