import mysql.connector

# Conexión a la base de datos
def conectar():
    return mysql.connector.connect(
        host="localhost",
        user="Admin",
        password="1010",
        database="serviciostecnicos"
    )

# Mostrar los resultados de una vista
def mostrar_vista(nombre_vista):
    conn = conectar()
    cursor = conn.cursor()
    cursor.execute(f"SELECT * FROM {nombre_vista};")
    filas = cursor.fetchall()

    print(f"\n📊 Resultados de {nombre_vista}:\n")
    for fila in filas:
        print(fila)

    cursor.close()
    conn.close()

# Menú de vistas
def menu_vistas():
    while True:
        print("\n📌 MENÚ DE VISTAS")
        print("1. Ver solicitudes con detalles")
        print("2. Ver pagos realizados por cliente")
        print("3. Salir")
        opcion = input("Elige una opción: ")

        if opcion == "1":
            mostrar_vista("v_SolicitudesDetalle")
        elif opcion == "2":
            mostrar_vista("v_PagosCliente")
        elif opcion == "3":
            print("👋 Saliendo del menú de vistas...")
            break
        else:
            print("❌ Opción no válida, intenta de nuevo.")

if __name__ == "__main__":
    menu_vistas()
