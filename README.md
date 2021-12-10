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

## Enlaces

#### Enlace del repositorio
#### https://github.com/MakJCE/BDD-Automation.git
#### Enlace de trello
#### https://trello.com/b/6ZKr7wUk/examen-final-black-box-bdd-automatización-y-smoke-testing
#### Enlace de la presentacion
#### https://docs.google.com/presentation/d/1IS3TFrWDoSp0z8bYxZYqVw4UQcHYsylwSMXAJbZyJ-E/edit?usp=sharing
#### Enlace informe tecnico
#### https://docs.google.com/document/d/11UU7kAinZVujiLWY5cp3QzppcMtQsyoZrhuYrMbglSw/edit?usp=sharing


## Enlaces Externos
#### Ruby (version ruby 3.0.2p107)
#### https://www.ruby-lang.org/es/downloads/

#### Instalacion de gemas

gem install cucumber

gem install capybara

gem install selenium

### Instalacion de los drivers para navegar.
#### Chrome Selenium (revisar la version de chrome que se tenga Options -> Settings -> About Chrome)
#### https://chromedriver.chromium.org/downloads
#### Firefox Selenium
#### https://github.com/mozilla/geckodriver/releases
#### Edge Selenium

El driver para la pagina no requiere instalacion simplemente se lo debe enviar al bin de Ruby:

Ejemplo:

C:\Ruby30-x64\bin
