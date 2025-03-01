with

supplies as (

    select * from {{ ref('raw_supplies') }}

)

select * from supplies
