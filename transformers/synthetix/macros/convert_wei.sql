{% macro convert_wei(column_name) %}
    {{ column_name }} / 10e18
{% endmacro %}
