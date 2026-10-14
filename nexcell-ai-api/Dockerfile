# Usamos una versión ligera y oficial de Python
FROM python:3.11-slim

# Le decimos a Docker que trabaje en esta carpeta interna
WORKDIR /app

# Copiamos primero las dependencias (para optimizar caché)
COPY requirements.txt .

# Instalamos las librerías
RUN pip install --no-cache-dir -r requirements.txt

# Copiamos todo el resto de tu código limpio a la carpeta /app del contenedor
COPY . .

# Exponemos el puerto de FastAPI
EXPOSE 8000

# El comando exacto para arrancar el servidor habilitando conexiones externas (0.0.0.0)
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]