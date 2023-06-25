SELECT *
FROM (

SELECT  seller_state,
        count(*) as qtde_sellers
FROM tb_sellers
GROUP BY seller_state
)

WHERE qtde_sellers > 10