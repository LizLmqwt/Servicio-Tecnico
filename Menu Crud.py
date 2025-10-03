import mysql.connector

def conectar():
    return mysql.connector.connect(
        host="localhost",
        user="Admin",
        password="1010",
        database="serviciostecnicos"
    )

def listar_clientes(conn):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Cliente;")
    for row in cursor.fetchall():
        print(row)
    cursor.close()

def insertar_cliente(conn):
    cursor = conn.cursor()
    nombre = input("Nombre: ")
    ci = input("ci: ")
    telefono = input("telefono: ")
    sql = "INSERT INTO Cliente (nombre, ci, telefono) VALUES (%s, %s, %s)"
    cursor.execute(sql, (nombre, ci, telefono))
    conn.commit()
    print("✅ Cliente insertado.")
    cursor.close()

def actualizar_cliente(conn):
    cursor = conn.cursor()
    id_cliente = input("ID del cliente a actualizar: ")
    nuevo_nombre = input("Nuevo nombre: ")
    sql = "UPDATE Cliente SET nombre = %s WHERE idCliente = %s"
    cursor.execute(sql, (nuevo_nombre, id_cliente))
    conn.commit()
    print("✅ Cliente actualizado.")
    cursor.close()

def eliminar_cliente(conn):
    cursor = conn.cursor()
    idCliente = input("ID del cliente a eliminar: ")
    sql = "DELETE FROM Cliente4 WHERE idCliente = %s"
    cursor.execute(sql, (idCliente,))
    conn.commit()
    print("✅ Cliente eliminado.")
    cursor.close()

def menu():
    conn = conectar()
    while True:
        print("\n📋 MENÚ SERVICIO TÉCNICO")
        print("1. Listar clientes")
        print("2. Insertar cliente")
        print("3. Actualizar cliente")
        print("4. Eliminar cliente")
        print("5. Salir")
        opcion = input("Elige una opción: ")

        if opcion == "1":
            listar_clientes(conn)
        elif opcion == "2":
            insertar_cliente(conn)
        elif opcion == "3":
            actualizar_cliente(conn)
        elif opcion == "4":
            eliminar_cliente(conn)
        elif opcion == "5":
            conn.close()
            print("👋 Saliendo del sistema...")
            break
        else:
            print("⚠️ Opción inválida.")

# Ejecutar el menú
if __name__ == "__main__":
    menu()
