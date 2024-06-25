{% macro transform_best_figure(Best_Figure) %}
    PARSE_JSON('{"wicket": ' || SPLIT_PART({{ Best_Figure }}, '/', 1) || ', "run": ' || SPLIT_PART({{ Best_Figure }}, '/', 2) || '}')::VARIANT AS {{ Best_Figure }}
{% endmacro %}
