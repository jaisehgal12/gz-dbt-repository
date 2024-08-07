
select
    op.date_date,
    count(op.orders_id) as nb_transactions,
    round(sum(op.revenue), 2) as revenue,
    round(sum(op.revenue) / count(op.orders_id), 2) as average_basket,
    round(sum(op.margin), 2) as margin,
    sum(op.operational_margin) as operational_margin
from {{ ref("int_orders_operational") }} as op
group by op.date_date


