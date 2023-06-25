SELECT 

CASE WHEN product_category_name IS NULL
        THEN 'outros'
        ELSE product_category_name 
        END AS categoria_fillna

FROM tb_products
GROUP BY categoria_fillna