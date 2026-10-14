import os
import mysql.connector

mis_herramientas = [
    {
        "type": "function",
        "function": {
            "name": "consultar_disponibilidad_db",
            "description": "Busca en la base de datos el precio y stock disponible de un producto o modelo específico.",
            "parameters": {
                "type": "object",
                "properties": {
                    "modelo_producto": {
                        "type": "string",
                        "description": "El nombre o modelo del celular a buscar (ejemplo: 'iPhone 13', 'Samsung Galaxy')."
                    }
                },
                "required": ["modelo_producto"]
            }
        }
    }
]

def ejecutar_consulta_disponibilidad(modelo_producto: str) -> str:
    """Se conecta a MySQL y busca un modelo específico."""
    try:
        conexion = mysql.connector.connect(
            host=os.getenv("DB_HOST", "localhost"),
            user=os.getenv("DB_USER", "root"),
            password=os.getenv("DB_PASS", "Amir11022013"),
            database=os.getenv("DB_NAME", "nexcell_db"),
            port=int(os.getenv("DB_PORT", 3306))
        )
        cursor = conexion.cursor(dictionary=True)
        
        query = "SELECT marca, nombre, precio, stock FROM productos WHERE nombre LIKE %s AND stock > 0 AND estado = 1"
        cursor.execute(query, (f"%{modelo_producto}%",))
        productos = cursor.fetchall()
        conexion.close()
        
        if not productos:
            return f"No hay stock disponible para la búsqueda: {modelo_producto}."
            
        texto_inventario = f"Resultados para '{modelo_producto}':\n"
        for p in productos:
            texto_inventario += f"- {p['marca']} {p['nombre']}: ${p['precio']} (Stock: {p['stock']})\n"
            
        return texto_inventario
        
    except Exception as e:
        print(f"Error de BD: {e}")
        return "Error interno: No se pudo consultar la base de datos en este momento."