DROP TABLE IF EXISTS tb_audiencia_venda;

CREATE TABLE tb_audiencia_venda AS 
WITH tb_marcacao_seller AS (

SELECT  t2.seller_id,
        max(t1.order_approved_at) AS dt_ultima_venda,
        '2018-07-01' AS dt_atual,
        julianday('2018-07-01') - julianday(max(t1.order_approved_at)) AS tp_ult_venda,
        
        /* O que marketing quer */
        CASE 
            WHEN
                julianday('2018-07-01') - julianday(max(t1.order_approved_at)) > 90
            THEN 1 ELSE 0
        END AS flag_venda_90_dias,
        
        /* Nossa proposta -> relativisa o tempo dado o perfil da pessoa */
        t3.tempo_media_venda,
        CASE 
            WHEN
                julianday('2018-07-01') - julianday(max(t1.order_approved_at)) > t3.tempo_media_venda
            THEN 1 ELSE 0
        END AS flag_avg_tempo

FROM tb_orders AS t1

LEFT JOIN tb_order_items AS t2
ON t1.order_id = t2.order_id

LEFT JOIN tb_avg_compra_seller AS t3
ON t2.seller_id = t3.seller_id

WHERE t1.order_status = 'delivered'

GROUP BY t2.seller_id
)

SELECT  seller_id,
    CASE WHEN 
            abs(random() % 1000) / 1000. <= 0.1
        THEN 1 ELSE 0
    END AS flag_controle
FROM tb_marcacao_seller
WHERE flag_avg_tempo = 1;