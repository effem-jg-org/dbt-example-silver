
    select
        sku, name, type, price, description
    from {{ source('urn:datacontract:project:jaffle-shop:dbt-seed:raw-model:products', 'raw_products') }}
