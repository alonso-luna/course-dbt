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