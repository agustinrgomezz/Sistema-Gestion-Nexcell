from pydantic import BaseModel

class PeticionChat(BaseModel):
    mensaje: str

class RespuestaChat(BaseModel):
    respuesta: str