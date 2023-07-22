-- receita por estado, por produto da categoria mais vendida
-- use apenas vendas entregues

WITH tb_best_categoria AS (

    SELECT  t2.product_category_name
    
    FROM tb_order_items as t1
    
    LEFT JOIN tb_products as t2
    ON t1.product_id = t2.product_id
   
    GROUP BY t2.product_category_name
    
    ORDER BY count(*) DESC
    
    LIMIT 3
),

tb_venda AS (
    SELECT *
    FROM tb_orders AS t1
    WHERE t1.order_status = 'delivered'
),

tb_receita_estado_produto AS (

    SELECT  t2.seller_state,
            t1.product_id,
            t1.price,
            t3.product_category_name,
            sum(t1.price) AS receita_total

    FROM tb_order_items AS t1

    LEFT JOIN tb_sellers AS t2
    ON t1.seller_id = t2.seller_id

    LEFT JOIN tb_products AS t3
    ON t1.product_id = t3.product_id

    INNER JOIN tb_venda AS t4
    ON t1.order_id = t4.order_id

    GROUP BY t2.seller_state,
            t1.product_id,
            t3.product_category_name
)


SELECT * 
FROM tb_receita_estado_produto AS t1
INNER JOIN tb_best_categoria AS t2
ON t1.product_category_name = t2.product_category_name