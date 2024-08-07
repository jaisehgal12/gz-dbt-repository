with 

source as (

    select * from {{ source('raw', 'sales') }}

),

renamed as (

    select
        date_date,
        CONCAT (orders_id," - ",pdt_id) as order_product,
        orders_id,
        pdt_id AS products_id,
        revenue,
        quantity

    from source

)

select * from renamed
