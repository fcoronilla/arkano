SELECT Product PRODUCTO,
       Sub_product SUBPRODUCTO,
     --  YEAR(Data_received) AÑO,
       QUARTER(Data_received) AS TRIMESTRE,
       COUNT(*) AS CANTIDAD_QUEJAS
FROM complaints
WHERE YEAR(Data_received) = 2023
GROUP BY ROLLUP(Product, Sub_product, Year, Quarter)
ORDER BY Product, Sub_product;



Explicación de la consulta:

GROUP BY CUBE(Product, Sub_product, Year, Quarter) nos va a devolver todas las combinaciones posibles de los valores de las columnas especificadas,
 lo que produce subtotales y totales para diferentes niveles de agrupación. ej: totales por año,Q,producto y subproducto + totales por año y Q + totales por año.
La función YEAR(Data_received) extrae el año de la fecha en la columna Data_received.
La función QUARTER(Data_received) extrae el trimestre de la fecha en la columna Data_received.
ORDER BY Product, Sub_product, Year, Quarter ordena los resultados alfabéticamente por Producto, Sub-producto, año y trimestre.