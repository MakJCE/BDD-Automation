Feature: create a new Nodo-Sede and use it
    as a member with Cursos privilege
    i want to use a new Nodo-Sede
    in order to use it for a new Curso

Background: Loggin with Google account
    Given I am on the first page
	And I click "Iniciar Sesión" button
    And I click Iniciar con Google button
    And I enter my username
    And I click "Siguiente" button
    And I enter my password
    And I click "Siguiente" button
    And I click "Verificar Acceso" button
    
@afterEraseNodo
Scenario: create Nodo
    Given I click "Cursos" in left side menu
    And I click "Nodos Sedes" section on the horizontal menu on top of the view
    When I press the "Nodo" button
    And I enter "NodoPrueba" in "Nodo" field
    And I press "Crear" button
    Then I should see the new Nodo at the end of the list

Scenario: try to create Nodo without name
    Given I click "Cursos" in left side menu
    And I click "Nodos Sedes" section on the horizontal menu on top of the view
    When I press the "Nodo" button
    And I press "Crear" button
    Then I should see the message "Los datos no pueden viajar vacios!"

@afterEraseNodo
@afterEraseSede
Scenario: create a Sede
    Given I click "Cursos" in left side menu
    And I click "Nodos Sedes" section on the horizontal menu on top of the view
    When I press the "Nodo" button
    And I enter "NodoPrueba" in Nodo field
    And I press "Crear" button
    And I press "Sede" button of the "NodoPrueba" row
    And I enter "SedePrueba" in "Sede" field
    And I press "Crear" button
    Then I should see "SedePrueba" sede in "NodoPrueba" nodo

@afterEraseNodo
@afterEraseSede
Scenario: try to create a Sede without name
    Given I click "Cursos" in left side menu
    And I click "Nodos Sedes" section on the horizontal menu on top of the view
    When I press the "Nodo" button
    And I enter "NodoPrueba" in Nodo field
    And I press "Crear" button
    And I press "Sede" button of the "NodoPrueba" row
    And I press "Crear" button
    Then I should see the message "Los datos no pueden viajar vacios!"
