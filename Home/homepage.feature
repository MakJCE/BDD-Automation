Feature: access to Nahual at the first time
    In order to access to initial page
    As a Nahual member
    I want to access to the welcome page

Background: Loggin with Google account
  Given I am on the first page
  When I click "Iniciar Sesión" button
  And I click Iniciar con Google button
  And I enter my username
  And I click "Siguiente" button
  And I enter my password
  And I click "Siguiente" button

Scenario Outline: Log in and out of access page
    Given I am in a page with title "<button_title>"
    When I click "<button>" button
    Then I am redirected to a page with the title "<title>"
Examples: 
	  |           button_title          |     button       |              title                   |
	  |         Ingresar al Portal      | Verificar Acceso |     ! Bienvenide Juan Casas !        |
	  | Cambiar a una cuenta con acceso |  Cerrar Sesion   |  Para continuar debe iniciar sesión. |

Scenario: Menu for the access to the main page
    Given I am in a page with title "Solicite Acceso"
    When I click "Solicitar" button
    Then A window is displayed showing the email of the account
    And the "nombre" field "is not empty"
    And the "motivo" field "is empty"
