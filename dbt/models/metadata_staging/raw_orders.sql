
    select
        id, customer, ordered_at, store_id, subtotal, tax_paid, order_total
    from {{ source('urn:datacontract:project:jaffle-shop:dbt-seed:raw-model:orders', 'raw_orders') }}
