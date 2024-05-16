import pandas as pd
import mysql.connector

# Funcion para validar y luego ingesta de CSV a MySQL
def ingesta_csv_a_mysql(csv_file, mysql_host, mysql_user, mysql_password, mysql_database, mysql_table):
    try:
        # Validar si el archivo CSV se puede leer
        df = pd.read_csv(csv_file)

        # Conexion a la base de datos MySQL
        conn = mysql.connector.connect(host=mysql_host,
                                       user=mysql_user,
                                       password=mysql_password,
                                       database=mysql_database)
        cursor = conn.cursor()

        # Ingesta de los datos del DataFrame a la tabla MySQL
        df.to_sql(name=mysql_table, con=conn, if_exists='append', index=False)

        # Confirmación de cambios y cierre de la conexión
        conn.commit()
        cursor.close()
        conn.close()

        print("Ingesta exitosa del CSV en MySQL.")
    except Exception as e:
        print("Error durante la ingesta del CSV en MySQL:", e)

# Configuración de la conexión MySQL
mysql_host = 'MacBook-Pro-de-Mac.local'
mysql_user = 'root@localhost'
mysql_password = 'password'
mysql_database = 'arkanos'
mysql_table = 'complaints'

# Ruta del archivo CSV
csv_file_path = 'complaints.csv'

# Validar y luego ingesta del CSV a MySQL
ingesta_csv_a_mysql(csv_file_path, mysql_host, mysql_user, mysql_password, mysql_database, mysql_table)





