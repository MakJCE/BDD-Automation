Feature: access to Nahual at the first time
    In order to access to initial page
    As a Nahual member
    I want to access to the welcome page

Background: Loggin with Google account
  Given I am on the first page
  And I click "Iniciar Sesión" button
  And I click Iniciar con Google button
  And I enter my username
  And I click "Siguiente" button
  And I enter my password
  And I click "Siguiente" button

Scenario: Menu for the access to the main page
    Given I am in a page with title "Solicite Acceso"
    When I click "Solicitar" button
    Then A window is displayed showing the email of the account
    And the name field is not empty
    And the motive field is empty