Feature: acces to Nahual at the first time
    In order to access to initial page
    As a Nahual member
    I want to access to the welcome page
    
Scenario: Enter for the first time
    When I push "Visitanos" button

Background: Loggin with Google account
  Given I am on the first page
  When I click "Iniciar Sesión" button
  And I click Iniciar con Google button
  And I enter my username
  And I click "Siguiente" button
  And I enter my password
  And I click "Siguiente" button
  And I click "Verificar Acceso" button