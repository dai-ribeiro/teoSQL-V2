-- Tempo entre vendas dos sellers
-- apenas pedidos entregues


WITH tb_seller_order AS (

    SELECT  t1.order_id,
            date(t1.order_approved_at) AS data_venda,
            t2.seller_id

    FROM tb_orders AS t1

    LEFT JOIN tb_order_items AS t2
    ON t1.order_id = t2.order_id

    WHERE order_status = 'delivered'
),

tb_seller_order_sort AS (

    SELECT *,
            row_number() OVER (PARTITION BY seller_id, data_venda) AS order_number
    FROM tb_seller_order
),

tb_seller_lag_data AS (

    SELECT  order_id,
            seller_id,
            data_venda,
            lag(data_venda) OVER (PARTITION BY seller_id ORDER BY data_venda) AS lag_data_venda

    FROM tb_seller_order_sort

    WHERE order_number = 1
),

tb_tempo_venda_seller AS (

    SELECT  *,
            julianday(data_venda) - julianday(lag_data_venda) AS diff_data

    FROM tb_seller_lag_data

    WHERE lag_data_venda IS NOT NULL
)

SELECT  seller_id,
        ROUND(AVG(diff_data), 2)

FROM tb_tempo_venda_seller

GROUP BY seller_id