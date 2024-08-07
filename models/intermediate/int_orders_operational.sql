SELECT
    m.orders_id,
    m.date_date,
    ROUND(m.margin + sh.shipping_fee - sh.ship_cost - sh.logcost) AS operational_margin,
    m.quantity,
    m.revenue,
    m.margin,
    m.purchase_cost,
from
    {{ ref('int_orders_margin') }} AS m
LEFT join {{ ref('stg_raw__ship') }} AS sh
USING (orders_id)



