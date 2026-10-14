import os
import json
from openai import OpenAI
from typing import List, Dict, Any

from servicios.herramientas_db import mis_herramientas, ejecutar_consulta_disponibilidad

class AgenteNexcell:
    def __init__(self) -> None:
        self.cliente = OpenAI(
            api_key=os.getenv("GROQ_API_KEY"),
            base_url="https://api.groq.com/openai/v1"
        )
        self.modelo: str = "openai/gpt-oss-120b"
        self.historial: List[Dict[str, Any]] = []
        self._inicializar_contexto()

    def _inicializar_contexto(self) -> None:
        prompt_sistema = (
            "Eres el asistente virtual técnico de Nexcell, un e-commerce de celulares. "
            "Tu tarea es ayudar a los clientes con el stock. "
            "IMPORTANTE: NO tienes el inventario en tu memoria. Para saber precios o stock, "
            "DEBES usar SIEMPRE la herramienta 'consultar_disponibilidad_db'. "
            "Nunca inventes precios ni modelos."
        )
        self.historial.append({"role": "system", "content": prompt_sistema})

    def procesar_mensaje(self, mensaje_usuario: str) -> str:
        self.historial.append({"role": "user", "content": mensaje_usuario})

        try:
            respuesta = self.cliente.chat.completions.create(
                model=self.modelo,
                messages=self.historial,
                tools=mis_herramientas,
                tool_choice="auto",
                temperature=0.6,
                max_tokens=300
            )
            
            mensaje_ia = respuesta.choices[0].message
            self.historial.append(mensaje_ia)

            if mensaje_ia.tool_calls:
                for tool_call in mensaje_ia.tool_calls:
                    if tool_call.function.name == "consultar_disponibilidad_db":
                        argumentos = json.loads(tool_call.function.arguments)
                        modelo_buscado = argumentos.get("modelo_producto")
                        
                        print(f"La IA delegó la búsqueda a Python: {modelo_buscado}")
                        
                        # Ejecutamos la función IMPORTADA
                        resultado_bd = ejecutar_consulta_disponibilidad(modelo_buscado)
                        
                        self.historial.append({
                            "role": "tool",
                            "tool_call_id": tool_call.id,
                            "name": tool_call.function.name,
                            "content": resultado_bd
                        })
                
                respuesta_final = self.cliente.chat.completions.create(
                    model=self.modelo,
                    messages=self.historial,
                    temperature=0.6,
                    max_tokens=300
                )
                mensaje_final = respuesta_final.choices[0].message.content
                self.historial.append({"role": "assistant", "content": mensaje_final})
                return str(mensaje_final)
                
            else:
                return str(mensaje_ia.content)

        except Exception as e:
            return f"Error en el servidor de Nexcell: {e}"