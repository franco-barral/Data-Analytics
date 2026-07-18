SELECT
    EXTRACT(MONTH FROM fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY EXTRACT(MONTH FROM fecha_venta)
ORDER BY mes;

-- Consulta 2
SELECT
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC
LIMIT 5;

-- Consulta 3
SELECT
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY total_gastado DESC;

-- Consulta 4
SELECT
    mes,
    total_facturado,
    CASE
        WHEN total_facturado >
        (
            SELECT AVG(total_mes)
            FROM
            (
                SELECT
                    SUM(cantidad * precio_unitario) AS total_mes
                FROM ventas
                GROUP BY EXTRACT(MONTH FROM fecha_venta)
            ) AS promedios
        )
        THEN 'Por encima'
        ELSE 'Por debajo'
    END AS estado
FROM
(
    SELECT
        EXTRACT(MONTH FROM fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM ventas
    GROUP BY EXTRACT(MONTH FROM fecha_venta)
) AS resumen
ORDER BY mes;

-- Hallazgo 1: El mes 03 fue el de mayor facturación con $1.985, representando aproximadamente el 48,8% de la facturación total del período ($4.080).

-- Hallazgo 2: El producto con ID 1 fue el más rentable, generando $2.400, equivalente al 58,8% de la facturación total.

-- Hallazgo 3: El cliente con ID 1 fue el de mayor valor, realizando 3 pedidos y gastando $1.970, lo que representa cerca del 48,3% del total facturado.
