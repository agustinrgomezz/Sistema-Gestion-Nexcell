# Nexcell - Sistema de Gestión con IA 

Sistema integral de escritorio para la gestión de inventario, ventas y administración, potenciado por un agente de Inteligencia Artificial que procesa consultas en lenguaje natural en tiempo real. 

El ecosistema está dividido en una arquitectura de microservicios, separando la interfaz gráfica y persistencia relacional del procesamiento de lenguaje natural.

##  Tecnologías y Arquitectura

*   **Frontend y Core Backend:** Java (Swing)
*   **Persistencia y ORM:** JPA / Hibernate
*   **Base de Datos:** MySQL
*   **Microservicio IA:** Python, FastAPI, Uvicorn
*   **Modelo de Inferencia:** Groq API (LLMs)

##  Estructura del Proyecto

*   `/Nexcell-Escritorio`: Cliente nativo desarrollado en Java. Contiene la lógica de negocio, controladores, vistas e integración con la base de datos.
*   `/nexcell-ai-api`: Microservicio RESTful en Python que expone el endpoint HTTP (`/chat`) para conectar el cliente de escritorio con el modelo de lenguaje de Groq.

##  Cómo ejecutar el proyecto

1.  **Base de Datos:** Asegúrate de tener MySQL corriendo localmente y crear la base de datos correspondiente (configurada en `META-INF/persistence.xml`).
2.  **Levantar la API de IA:**
    ```bash
    cd nexcell-ai-api
    pip install fastapi uvicorn groq
    uvicorn api:app --reload
    ```
    *(Nota: Requiere configurar tu propia API Key de Groq en las variables de entorno o en el código fuente).*
3.  **Iniciar el Sistema Principal:** Abre la carpeta `/Nexcell-Escritorio` en tu IDE (ej. IntelliJ IDEA), sincroniza las dependencias de Maven y ejecuta el archivo `Main.java`.
