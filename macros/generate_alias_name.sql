{% macro alias(table_name) %}
    {{ return(adapter.dispatch('alias', 'vinski')(table_name)) }}
{% endmacro %}

{% macro default__alias(table_name) %}
    {{ table_name | lower | replace("stg_", "") }}
{% endmacro %}
