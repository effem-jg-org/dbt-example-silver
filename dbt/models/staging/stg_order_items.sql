with

source as (

    select * from {{ source('urn:datacontract:project:jaffle-shop:dbt-seed:raw-model:items', 'raw_items') }}

),

renamed as (

    select

        ----------  ids
        id as order_item_id,
        order_id,
        sku as product_id

    from source

)

select * from renamed
