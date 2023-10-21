SELECT cliente_id, SUM(total) AS total_ventas
FROM orden
GROUP BY cliente_id;
--Ultima consulta