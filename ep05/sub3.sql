-- receita por estado, por produto da categoria mais vendida

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

INNER JOIN (
    SELECT  t2.product_category_name
    FROM tb_order_items as t1
    LEFT JOIN tb_products as t2
    ON t1.product_id = t2.product_id
    GROUP BY t2.product_category_name
    ORDER BY count(*) DESC
    LIMIT 3
) AS t4
ON t3.product_category_name = t4.product_category_name

GROUP BY t2.seller_state,
         t1.product_id,
         t3.product_category_name
