with

source as (

    select * from {{ source('urn:datacontract:project:jaffle-shop:dbt-seed:raw-model:customers', 'raw_customers') }}

),

renamed as (

    select

        ----------  ids
        id as customer_id,

        ---------- text
        name as customer_name

    from source

)

select * from renamed
