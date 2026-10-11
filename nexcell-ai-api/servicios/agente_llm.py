import os
import mysql.connector
from openai import OpenAI
from typing import List, Dict

class AgenteNexcell:
    def __init__(self) -> None:
        self.cliente = OpenAI(
            api_key=os.getenv("GROQ_API_KEY"),
            base_url="https://api.groq.com/openai/v1"
        )
        self.modelo: str = "qwen/qwen3.8-27b"
        # Tipado estricto: Una lista que contiene diccionarios con strings
        self.historial: List[Dict[str, str]] = []
        self._inicializar_contexto()

    def _obtener_inventario_db(self) -> str:
        """Se conecta a MySQL y devuelve el inventario formateado en texto."""
        try:
            conexion = mysql.connector.connect(
                host=os.getenv("DB_HOST", "localhost"),
                user=os.getenv("DB_USER", "root"),
                password=os.getenv("DB_PASS", ""),
                database=os.getenv("DB_NAME", "nexcell_db"),
                port=os.getenv("DB_PORT", "3307")
            )
            cursor = conexion.cursor(dictionary=True)
            
            cursor.execute("SELECT marca, nombre, precio, stock FROM productos WHERE stock > 0 AND estado = 1")
            productos = cursor.fetchall()
            conexion.close()
            
            if not productos:
                return "Actualmente no hay stock disponible."
                
            texto_inventario = "Inventario actual disponible:\n"
            for p in productos:
                texto_inventario += f"- {p['marca']} {p['nombre']}: ${p['precio']} (Stock: {p['stock']})\n"
                
            return texto_inventario
            
        except Exception as e:
            print(f"Advertencia: No se pudo conectar a la BD ({e}). Usando modo sin stock.")
            return "El sistema de inventario está fuera de línea."

    def _inicializar_contexto(self) -> None:
        """Inyecta el inventario en el system prompt."""
        inventario_actual = self._obtener_inventario_db()
        prompt_sistema = (
            "Eres el asistente virtual técnico de Nexcell, un e-commerce de celulares. "
            "Tu tarea es ayudar a los clientes basándote ÚNICAMENTE en el siguiente inventario real:\n\n"
            f"{inventario_actual}\n\n"
            "Si un usuario pregunta por un modelo que no está en esta lista, decile amablemente que no hay stock. "
            "Responde de forma clara, profesional y concisa (máximo 3 párrafos cortos)."
        )
        self.historial.append({"role": "system", "content": prompt_sistema})

    def procesar_mensaje(self, mensaje_usuario: str) -> str:
        """Procesa el mensaje del usuario y devuelve la respuesta del LLM."""
        self.historial.append({"role": "user", "content": mensaje_usuario})

        try:
            respuesta = self.cliente.chat.completions.create(
                model=self.modelo,
                messages=self.historial,
                temperature=0.6,
                max_tokens=300
            )
            
            mensaje_ia = respuesta.choices[0].message.content
            self.historial.append({"role": "assistant", "content": mensaje_ia})
            
            return str(mensaje_ia)

        except Exception as e:
            return f"Error en el servidor de Nexcell: {e}"