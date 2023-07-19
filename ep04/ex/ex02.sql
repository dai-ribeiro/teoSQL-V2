-- Qual o valor total de receita gerada por sellers de cada estado? 
-- Considere a base completa, com apenas pedidos entregues

SELECT  t3.seller_state,
        ROUND(SUM(t2.price), 2) AS receita_total,
        ROUND(SUM(t2.price) / COUNT(DISTINCT t2.seller_id), 2) AS avg_receita_seller,
        COUNT(DISTINCT t2.seller_id) AS qtde_seller

FROM tb_orders AS t1

LEFT JOIN tb_order_items AS t2
ON t1.order_id = t2.order_id

LEFT JOIN tb_sellers AS t3
ON t2.seller_id = t3.seller_id

WHERE t1.order_status = 'delivered'

GROUP BY t3.seller_state