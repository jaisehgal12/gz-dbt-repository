with
    sales as (select * from {{ ref("stg_raw__sales") }}),

    product as (select * from {{ ref("stg_raw__product") }})

select
    s.orders_id,
    s.date_date,
    s.revenue,
    s.quantity,
    p.purchase_price * s.quantity as purchase_cost,
    ROUND(s.revenue - (p.purchase_price * s.quantity),2) as margin
    
    
from sales s
left join product p on s.products_id = p.products_id
