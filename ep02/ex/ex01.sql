-- Ex1. Faça uma query que apresente o tamanho médio, 
-- máximo e mínimo da descrição do objeto por categoria.

SELECT product_category_name AS categoria_produto,
        avg(product_description_lenght) AS tamanho_medio_desc,
        max(product_description_lenght) AS tamanho_maximo_desc,
        min(product_description_lenght) AS tamanho_minimo_desc
FROM tb_products
GROUP BY product_category_name
