# conexion_test.py
import mysql.connector
from mysql.connector import Error
from db_config import DB_CONFIG

def test_connection():
    try:
        conn = mysql.connector.connect(**DB_CONFIG)
        if conn.is_connected():
            print("✅ Conectado a:", conn.get_server_info())
            cursor = conn.cursor()
            cursor.execute("SELECT DATABASE();")
            print("Base de datos usada:", cursor.fetchone()[0])
    except Error as e:
        print("❌ Error de conexión:", e)
    finally:
        if 'cursor' in locals():
            cursor.close()
        if 'conn' in locals() and conn.is_connected():
            conn.close()

if __name__ == "__main__":
    test_connection()
