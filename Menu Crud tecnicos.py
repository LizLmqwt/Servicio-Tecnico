import mysql.connector

def conectar():
    return mysql.connector.connect(
        host="localhost",
        user="Admin",        #
        password="1010",
        database="serviciostecnicos"
    )

# ------------------ CRUD Técnicos ------------------

def listar_tecnicos(conn):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Tecnico;")
    for row in cursor.fetchall():
        print(row)
    cursor.close()

def insertar_tecnico(conn):
    nombre = input("Nombre: ")
    ci = input("CI: ")
    telefono = input("Teléfono: ")
    email = input("Email: ")

    sql = "INSERT INTO Tecnico (nombre, ci, telefono, email) VALUES (%s, %s, %s, %s)"
    cursor = conn.cursor()
    cursor.execute(sql, (nombre, ci, telefono, email))
    conn.commit()
    print("✅ Técnico insertado correctamente")
    cursor.close()

def actualizar_tecnico(conn):
    id_tecnico = input("ID del técnico a actualizar: ")
    nuevo_telefono = input("Nuevo teléfono: ")
    nuevo_email = input("Nuevo email: ")

    sql = "UPDATE Tecnico SET telefono = %s, email = %s WHERE idTecnico = %s"
    cursor = conn.cursor()
    cursor.execute(sql, (nuevo_telefono, nuevo_email, id_tecnico))
    conn.commit()
    print("✅ Técnico actualizado correctamente")
    cursor.close()

def eliminar_tecnico(conn):
    id_tecnico = input("ID del técnico a eliminar: ")
    sql = "DELETE FROM Tecnico WHERE idTecnico = %s"
    cursor = conn.cursor()
    cursor.execute(sql, (id_tecnico,))
    conn.commit()
    print("✅ Técnico eliminado correctamente")
    cursor.close()

# ------------------ Menú Principal ------------------

def menu_tecnicos():
    conn = conectar()
    while True:
        print("\n🔧 MENÚ TÉCNICOS")
        print("1. Listar técnicos")
        print("2. Insertar técnico")
        print("3. Actualizar técnico")
        print("4. Eliminar técnico")
        print("5. Salir")
        opcion = input("Elige una opción: ")

        if opcion == "1":
            listar_tecnicos(conn)
        elif opcion == "2":
            insertar_tecnico(conn)
        elif opcion == "3":
            actualizar_tecnico(conn)
        elif opcion == "4":
            eliminar_tecnico(conn)
        elif opcion == "5":
            conn.close()
            print("👋 Saliendo del sistema de técnicos...")
            break
        else:
            print("❌ Opción no válida")

# Ejecutar menú
if __name__ == "__main__":
    menu_tecnicos()
