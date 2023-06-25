SELECT  product_category_name,
        count(*),
        min(product_weight_g) AS menor_peso,
        max(product_weight_g) AS maior_peso,
        avg(product_weight_g) AS avg_peso

FROM tb_products

-- isso vem antes do group by (no processamento)
WHERE product_category_name is not null
AND product_category_name != 'alimentos'
AND product_category_name <> 'agro_industria_e_comercio'

GROUP BY product_category_name