
    select
        id, name, cost, perishable, sku
    from {{ source('urn:datacontract:project:jaffle-shop:dbt-seed:raw-model:supplies', 'raw_supplies') }}
