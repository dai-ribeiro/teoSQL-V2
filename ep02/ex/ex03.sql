-- Ex3. Faça uma query que apresente o tamanho médio, 
-- máximo e mínimo do nome do objeto por categoria. 
-- Considere apenas os objetos que tenham a descrição 
-- maior que 100.

SELECT product_category_name,
        avg(product_name_lenght) AS tamanho_medio_nome,
        max(product_name_lenght) AS tamanho_maximo_nome,
        min(product_name_lenght) AS tamanho_minimo_nome
FROM tb_products
WHERE product_description_lenght >= 100
GROUP BY product_category_name
