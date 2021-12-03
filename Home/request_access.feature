Feature: Request access to main
    In order to enter the system
    As a new Nahual member
    I want to access to the system

Background: Loggin with Google account
  Given I am on the first page
  When I click "Iniciar Sesión" button
  And I click Iniciar con Google button
  And I enter my username
  And I click "Siguiente" button
  And I enter my password
  And I click "Siguiente" button

Scenario: Cancel the request to main page
    Given I am in a page with title "Solicite Acceso"
    When I click "Solicitar" button
    And I press the option "Cancelar"
    Then I return to the page with title "Para iniciar sesion verifique su acceso o sino, tienes las siguientes opciones:"

Scenario: Accept the request to main page
    Given I am in a page with title "Solicite Acceso"
    When I click "Solicitar" button
    And I press the option "Solicitar"
    Then Appear a message saying "Solicitud enviada con éxito"