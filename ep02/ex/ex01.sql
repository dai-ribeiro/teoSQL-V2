-- Ex1. Faça uma query que apresente o tamanho médio, máximo e mínimo da descrição do objeto por categoria

SELECT product_category_name,
        avg(product_description_lenght) AS media,
        max(product_description_lenght) AS maximo,
        min(product_description_lenght) AS minimo
        
FROM tb_products

GROUP BY product_category_name
