import logging
from fastapi import FastAPI
from dotenv import load_dotenv

load_dotenv()

from api.rutas import rutas_chat

# Configuración global de logs
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

app = FastAPI(title="Nexcell AI API", description="Microservicio de IA para gestión de inventario")

# rutas modularizadas
app.include_router(rutas_chat)