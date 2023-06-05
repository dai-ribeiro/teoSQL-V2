-- Ex1: Quantos produtos temos da categoria 'artes'?

SELECT product_category_name AS categoria,
       count(*) AS total
FROM tb_products
WHERE product_category_name = 'artes'