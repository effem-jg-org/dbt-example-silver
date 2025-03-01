
    select
        id, name
    from {{ source('urn:datacontract:project:jaffle-shop:dbt-seed:raw-model:customers', 'raw_customers') }}
