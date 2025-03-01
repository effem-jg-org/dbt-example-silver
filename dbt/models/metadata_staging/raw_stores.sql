
    select
        id, name, opened_at, tax_rate
    from {{ source('urn:datacontract:project:jaffle-shop:dbt-seed:raw-model:stores', 'raw_stores') }}
