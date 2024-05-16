SELECT Product PRODUCTO,
       Sub_product SUBPRODUCTO,
       QUARTER(Data_received) AS TRIMESTRE,
       COUNT(*) AS CANTIDAD_QUEJAS
FROM complaints
WHERE YEAR(Data_received) = 2023
GROUP BY ROLLUP(Product, Sub_product, Quarter)
ORDER BY Product, Sub_product;



