-- objetivo
-- qual o produto mais caro que o seller já vendeu
-- considere pedidos entregues


WITH tb_seller_product AS (

    SELECT  seller_id,
            product_id,
            count(*) AS qtde_produto,
            sum(price) AS receita

    FROM tb_orders AS t1

    LEFT JOIN tb_order_items AS t2
    ON t1.order_id = t2.order_id

    WHERE order_status = 'delivered'

    GROUP BY seller_id, product_id

    ORDER BY seller_id
),

tb_seller_sort AS (

    SELECT  *,
            row_number() over(PARTITION BY seller_id 
                                ORDER BY qtde_produto DESC,
                                receita DESC) AS order_number

    FROM tb_seller_product
)


SELECT seller_id,
        product_id,
        qtde_produto

FROM tb_seller_sort

WHERE order_number = 1