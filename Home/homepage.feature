Feature: acces to Nahual at the first time
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


Scenario: Request access to the website
    Given I can see the title "Solicite Acceso"
    When I click "Solicitar" button
    Then I can see the email of the account
    And the "nombre" space "is not empty"
    And the "motivo" space "is empty"
