-- qual a receita de cada categora de produto?
-- e o total de vendas?
-- em unidades e em pedidos?

SELECT  t2.product_category_name,
        round(sum(t1.price), 2) AS receita,
        count(*) AS total_itens_vendidos,
        count(DISTINCT t1.order_id) AS qtde_pedidos,
        round(count(*) / cast(count(DISTINCT t1.order_id) AS float), 2) AS avg_item_pedido 
FROM tb_order_items AS t1

LEFT JOIN tb_products AS t2
ON t1.product_id = t2.product_id

GROUP BY t2.product_category_name

ORDER BY avg_item_pedido DESC