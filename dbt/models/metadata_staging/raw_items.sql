
    select
        id, order_id, sku
    from {{ source('urn:datacontract:project:jaffle-shop:dbt-seed:raw-model:items', 'raw_items') }}
