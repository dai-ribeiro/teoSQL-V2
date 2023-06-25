-- Ex2. Faça uma query que apresente o tamanho médio, máximo e mínimo do nome do objeto por categoria

SELECT product_category_name,
        avg(product_name_lenght) AS media,
        max(product_name_lenght) AS maximo,
        min(product_name_lenght) AS minimo
        
FROM tb_products

GROUP BY product_category_name