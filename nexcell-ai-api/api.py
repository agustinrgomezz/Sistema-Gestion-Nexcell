from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import logging

# Importamos la clase de tu agente (ajustá el nombre si en tu agente.py se llama distinto)
from agente import AgenteNexcell

# Configuramos un log básico para ver las peticiones en la consola
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

# Inicializamos la API y el Agente
app = FastAPI(title="Nexcell AI API")
bot = AgenteNexcell()

# Definimos el formato del JSON que Java nos va a enviar
class PeticionChat(BaseModel):
    mensaje: str

@app.post("/chat")
async def chatear_con_bot(peticion: PeticionChat):
    logging.info(f"Usuario pregunta: {peticion.mensaje}")

    try:
        # Llamamos al método de tu agente que genera la respuesta.
        respuesta_ia = bot.procesar_mensaje(peticion.mensaje)

        logging.info("Respuesta enviada con éxito.")
        return {"respuesta": respuesta_ia}

    except Exception as e:
        logging.error(f"Error procesando el mensaje: {str(e)}")
        raise HTTPException(status_code=500, detail="Error interno del servidor de IA.")
