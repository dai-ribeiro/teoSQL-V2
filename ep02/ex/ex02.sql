-- Ex2. Faça uma query que apresente o tamanho médio, 
-- máximo e mínimo do nome do objeto por categoria.

SELECT product_category_name AS categoria_produto,
        avg(product_name_lenght) AS tamanho_medio_nome,
        max(product_name_lenght) AS tamanho_maximo_nome,
        min(product_name_lenght) AS tamanho_minimo_nome
FROM tb_products
GROUP BY product_category_name