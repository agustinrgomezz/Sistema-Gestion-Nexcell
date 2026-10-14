import mysql.connector
import os

def consultar_disponibilidad_db(modelo_producto: str):
    """Busca un producto en la base de datos y devuelve su stock y precio."""
    try:
        conexion = mysql.connector.connect(
            host=os.getenv("DB_HOST", "localhost"),
            user=os.getenv("DB_USER", "root"),
            password=os.getenv("DB_PASS", "Amir11022013"),
            database=os.getenv("DB_NAME", "nexcell_db"),
            port=int(os.getenv("DB_PORT", 3306))
        )
        cursor = conexion.cursor(dictionary=True)
        
        query = "SELECT nombre, precio, stock FROM nexcell_db_productos WHERE nombre LIKE %s AND stock > 0"
        cursor.execute(query, (f"%{modelo_producto}%",))
        resultados = cursor.fetchall()
        
        conexion.close()

        if not resultados:
            return f"No se encontraron unidades en stock para la búsqueda: {modelo_producto}."
        
        respuesta_ia = f"Resultados encontrados para '{modelo_producto}':\n"
        for prod in resultados:
            respuesta_ia += f"- {prod['nombre']}: Precio ${prod['precio']}, Stock: {prod['stock']} unidades.\n"
        
        return respuesta_ia

    except Exception as e:
        return f"Error al consultar la base de datos: {str(e)}"