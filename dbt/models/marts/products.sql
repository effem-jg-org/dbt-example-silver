with

products as (

    select * from {{ ref('raw_products') }}

)

select * from products
