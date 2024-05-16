# arkano


# Explicacion ingesta
Este script primero lee el archivo CSV usando pandas,
intentamos leer el archivo CSV dentro de un bloque try. 
Si la lectura tiene éxito, procedemos con la ingesta de datos en MySQL como antes. 
Si la lectura falla, capturamos la excepción y mostramos un mensaje de error...

luego establece una conexión con el servidor MySQL local usando mysql-connector-python. 
Posteriormente, ingesta los datos del DataFrame en la tabla MySQL usando el método to_sql. 
Finalmente, confirma los cambios y cierra la conexión.



# Explicación de la consulta:

GROUP BY CUBE(Product, Sub_product,  Quarter) nos va a devolver todas las combinaciones posibles de los valores de las columnas especificadas,
 lo que produce subtotales y totales para diferentes niveles de agrupación. ej: totales por año,Q,producto y subproducto + totales por año y Q + totales por año.
La función YEAR(Data_received) extrae el año de la fecha en la columna Data_received.
La función QUARTER(Data_received) extrae el trimestre de la fecha en la columna Data_received.
ORDER BY Product, Sub_product, Year, Quarter ordena los resultados alfabéticamente por Producto, Sub-producto y trimestre.