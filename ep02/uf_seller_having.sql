SELECT  seller_state,
        count(*) as qtde_sellers

FROM tb_sellers

-- filtro pré agregaçao
WHERE seller_state IN ('SP', 'RJ', 'PR', 'AC')

-- agg
GROUP BY seller_state

-- filtro pós agg
HAVING qtde_sellers > 10