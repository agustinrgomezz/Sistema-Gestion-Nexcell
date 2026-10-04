package vista;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class NexcellBotClient {

    // Método estático para poder llamarlo desde cualquier ventana
    public static String consultar(String mensaje) {
        try {
            // Apuntamos al puerto donde vive tu IA en Python
            URL url = new URL("http://127.0.0.1:8000/chat");
            HttpURLConnection conexion = (HttpURLConnection) url.openConnection();

            // Configuramos la petición como POST (enviar datos)
            conexion.setRequestMethod("POST");
            conexion.setRequestProperty("Content-Type", "application/json; utf-8");
            conexion.setRequestProperty("Accept", "application/json");
            conexion.setDoOutput(true);

            // Armamos el JSON y limpiamos comillas para que no se rompa
            String mensajeLimpio = mensaje.replace("\"", "\\\"");
            String jsonInputString = "{\"mensaje\": \"" + mensajeLimpio + "\"}";

            // Disparamos la pregunta hacia Python
            try (OutputStream os = conexion.getOutputStream()) {
                byte[] input = jsonInputString.getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            // Leemos la respuesta de la IA
            try (BufferedReader br = new BufferedReader(
                new InputStreamReader(conexion.getInputStream(), "utf-8"))) {
                StringBuilder response = new StringBuilder();
                String responseLine;
                while ((responseLine = br.readLine()) != null) {
                    response.append(responseLine.trim());
                }

                // Extraemos solo el texto de la respuesta del JSON
                String res = response.toString();
                String clave = "\"respuesta\":\"";
                int inicio = res.indexOf(clave) + clave.length();
                int fin = res.lastIndexOf("\"}");

                if (inicio > clave.length() - 1 && fin > inicio) {
                    // Reemplazamos los saltos de línea y devolvemos el texto limpio
                    return res.substring(inicio, fin).replace("\\n", "\n").replace("\\\"", "\"");
                }
                return res;
            }
        } catch (Exception e) {
            return "Error de conexión con el servidor IA: " + e.getMessage();
        }
    }
}
