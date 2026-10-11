import logging
from fastapi import APIRouter, HTTPException
from core.modelos import PeticionChat, RespuestaChat
from servicios.agente_llm import AgenteNexcell

# Configuramos el router
rutas_chat = APIRouter()
bot = AgenteNexcell()

@rutas_chat.post("/chat", response_model=RespuestaChat)
async def chatear_con_bot(peticion: PeticionChat):
    logging.info(f"Usuario pregunta: {peticion.mensaje}")

    try:
        # Llamamos a la lógica pesada que ahora está aislada en servicios/
        respuesta_ia = bot.procesar_mensaje(peticion.mensaje)
        logging.info("Respuesta enviada con éxito.")
        
        # Devolvemos respetando el modelo Pydantic
        return RespuestaChat(respuesta=respuesta_ia)

    except Exception as e:
        logging.error(f"Error procesando el mensaje: {str(e)}")
        raise HTTPException(status_code=500, detail="Error interno del servidor de IA.")