Feature: acces to Nahual at the first time
    In order to access to initial page
    As a Nahual member
    I want to access to the welcome page


Scenario: Enter for the first time
    Given I am on welcome page
    When I push "Iniciar Sesión" button
    And I push "Iniciar con Google"
    And I enter my username
    And I push "Siguiente" button
    And I enter my password
    And I push "Siguiente" button
    Then I stay in home page