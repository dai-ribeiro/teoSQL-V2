-- Qual o valor total de receita gerada por clientes de cada estado? 
-- Considere a base completa, com apenas pedidos entregues

SELECT  t3.customer_state,
        ROUND(SUM(t2.price), 2) AS receita_total_estado,
        ROUND(SUM(t2.price) / COUNT(DISTINCT t1.customer_id), 2) AS avg_receuta_cliente        

FROM tb_orders AS t1

LEFT JOIN tb_order_items AS t2
ON t1.order_id = t2.order_id

LEFT JOIN tb_customers AS t3
ON t1.customer_id = t3.customer_id

WHERE t1.order_status = 'delivered'

GROUP BY t3.customer_state