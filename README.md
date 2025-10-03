# Sistema de Gestión de Servicio Técnico a Domicilio

**Autor:** <Richard Nelson>   
**Asignatura:** <BASE_DE_DATOS_II_>  
**Fecha:** <2025-10-03>

---

## Enunciado
Se desarrolla una solución para la gestión de un servicio técnico a domicilio que permita registrar clientes, técnicos, servicios, solicitudes, pagos y retroalimentación. La solución incluye el modelado UML, la implementación física en MySQL (DDL), datos de prueba, procedimientos, funciones, triggers, vistas y consultas SQL de ejemplo. También se incluye un cliente de prueba en Python para conectarse a la base de datos.

---

## Contenido del repositorio (estructura sugerida)
```
ServicioTecnico/
│
├─ README.md                      <- este archivo (rellena tus datos)
├─ diagramas/
│   └─ diagrama_clases.png        <- diagrama UML (PNG/JPG)
│
├─ sql/
│   ├─ 01-Crear Tablas Servicio Tecnico.sql           <- script DDL (CREATE DATABASE; CREATE TABLE ...)
│   ├─ 02-Insertar Valores Servico Tecnico.sql             <- INSERTS (datos de prueba)
│   ├─ 03-Servicio tecnico_Procedimientos.sql          <- PROCEDURES
│   ├─ 04-Servicio Tecnico_Funciones.sql          <-  FUNCTIONS
│   ├─ 05-Servicio Tecnico_Trigger.sql      <- TRIGGERs 
│   ├─ 06-Servicio Tecnico Vistas.sql      <- Views
│   ├─ 07-Servicio Tecnico_Alias y clausulas.sql      <- Alias y Clausulas
│   ├─ 08-Servicio tecnico_Operadores Logicos.sql      <- LOGIC OPERATORS
│   ├─ 09-triggers_views.sql      <- TRIGGERs y CREATE VIEW
│   ├─ 10-Servicio tecnico_Vistas.sql      <- EXTRA VIEWS
│   └─ 11-Servicio tecnico_Encriptación de datos.sql             <- ENCRIPTACIÓN DE DATOS
│   └─ 12-Servicio Tecnico_Busqueda de patrones.sql             <- SEARCHS
│   └─ 13-Servicio Tecnico_Consultas.sql             <- Consultas de ejemplo
│
├─ python/
│   ├─ conexion_test.py
│   ├─ db_config.py
│   ├─ Menu Crud.py
│   ├─ Menu Crud tecnicos.py
│   ├─ Menu Crod vistas.py
│   │
├─ docs/
│   └─ Servico Tecnico Proyecto.docx
│
├─ presentacion/
│   └─ exposicion ver 2.pptx
│
└─ .gitignore
```

---

## Instrucciones de despliegue (rápidas)

1. **Crear la base de datos y tablas (DDL)**
```bash
mysql -u TU_USUARIO -p < sql/01-create-db.sql
```

2. **Cargar datos de prueba**
```bash
mysql -u TU_USUARIO -p servicio_tecnico < sql/02-inserts.sql
```

3. **Cargar procedures, functions y vistas**
```bash
mysql -u TU_USUARIO -p servicio_tecnico < sql/03-procedures.sql
mysql -u TU_USUARIO -p servicio_tecnico < sql/04-triggers_views.sql
```

4. **Ejecutar consultas de ejemplo**
```bash
mysql -u TU_USUARIO -p servicio_tecnico < sql/05-queries.sql
```

5. **Probar cliente Python (opcional)**
```bash
cd python
python app_demo.py
```

---

## Consultas destacadas (resumen)
- JOINs entre SolicitudServicio, Cliente, Tecnico y Servicio.  
- Búsquedas por patrón con `LIKE` y `REGEXP`.  
- Operadores lógicos `AND`, `OR`, `NOT`, `XOR`.  
- Agregaciones y `GROUP BY` (ingresos por técnico, solicitudes por estado).

---

## Seguridad
- Contraseñas: ejemplo de almacenamiento con `SHA2(..., 256)` (no guardar contraseñas en texto plano).  
- Ejemplo de `AES_ENCRYPT` / `AES_DECRYPT` para datos recuperables (tarjetas), usar con clave segura.

---

## Cómo subir el repositorio a GitHub (paso a paso)
> A continuación se muestran dos métodos: **A) Interfaz web** y **B) Línea de comandos (git / gh)**. Puedes usar cualquiera.

### A) Crear repo desde la web (rápido)
1. Entra a https://github.com y crea una nueva cuenta o inicia sesión.  
2. Click **New repository** → pon nombre (ej. `ServicioTecnico`) → **Create repository**.  
3. En tu máquina local: copia la estructura de archivos en una carpeta `ServicioTecnico`.  
4. Abre terminal en esa carpeta y ejecuta:
```bash
git init
git add .
git commit -m "Initial commit: proyecto Servicio Tecnico"
git branch -M main
git remote add origin https://github.com/TU_USUARIO/ServicioTecnico.git
git push -u origin main
```

### B) Crear repo con GitHub CLI (`gh`)
(Si tienes `gh` instalado y autenticado):
```bash
cd /ruta/a/ServicioTecnico
gh repo create TU_USUARIO/ServicioTecnico --public --source=. --remote=origin --push
```

---

## Recomendaciones antes de subir
- Reemplaza los campos `<TU_NOMBRE_AQUI>`, `<TU_MATRICULA_AQUI>`, `<BASE_DE_DATOS_II_O_SIMILAR>` y la fecha.  
- Inserta `diagramas/diagrama_clases.png` (exporta en buena resolución desde ArgoUML).  
- Verifica que `sql/01-create-db.sql` crea la DB sin errores (usa `DROP TABLE IF EXISTS` al inicio de cada tabla si quieres ser idempotente).  
- Añade capturas de Workbench en `presentacion/` o `docs/` como evidencia.  
- Sube el archivo `.sql` separado por secciones (DDL, INSERTS, procedures, triggers/views, queries).

---

## Ejemplo de mensaje de entrega (para pegar en la plataforma de la materia)
> Repositorio: `https://github.com/TU_USUARIO/ServicioTecnico`  
> Contiene: enunciado, diagrama de clases (png), scripts SQL (DDL, inserts, procedures, triggers, views), consultas y código Python de demostración.

---

## Licencia (opcional)
Este proyecto puede ser distribuido bajo la licencia MIT (o la que prefieras).

---

Si quieres, puedo también generar por ti los archivos `.md` y `.sql` listos para descargar o puedo añadir tus datos personales al README antes de guardarlo. 
