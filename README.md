# Herramientas

- Ruby
- Gherkin
- Cucumber
- Capybara
- Selenium

# Solución: Fallo al ejecutar el background: iniciar sesión con cuenta Google

Este fallo se debe a que al iniciar sesión con las credenciales descritas en el environment a Google la cuenta reconoce que es un dispositivo externo y pide una comprobación adicional.

Lo que se debe hacer es:
- Intervenir en la ventana del testeo
- Optar por la opción de enviar código de verificación SMS
- Solicitar a un integrante del grupo el código
- Ingresar el código y terminar el inicio de sesión
- cerrar ventana
- Volver a ejecutar cualquier feature

Cabe recalcar que la cuenta de prueba esta con las restricciones mínimas de seguridad.