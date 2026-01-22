SELECT id, SUM(total) AS total_pedidos FROM {{ ref('stg_orders') }} GROUP BY id
