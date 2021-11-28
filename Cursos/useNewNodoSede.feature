Feature: create a new Nodo-Sede and use it
    as a member with Cursos privilege
    i want to use a new Nodo-Sede
    in order to use it for a new Curso

@beforeNeedToLoggin
Background: 
    Given I am in homepage 
    And I press "Cursos" button 
    When I press "Nodos Sedes" navlink
    Then I should stay in Nodos-Sedes view
@afterEraseNodo
Scenario: create Nodo
    Given I press the "Nodo" button
    When I enter "NodoPrueba" in "Nodo" field
    And I press "Crear" button
    Then I should see the new Nodo at the end of the list

Scenario: try to create Nodo without name
    Given I press the "Nodo" button
    When I press "Crear" button
    Then I should see the message "Los datos no pueden viajar vacios!"

@afterEraseNodo
@afterEraseSede
Scenario: create a Sede
    Given I press the "Nodo" button
    When I enter "NodoPrueba" in Nodo field
    And I press "Crear" button
    And I press "Sede" button of the "NodoPrueba" row
    And I enter "SedePrueba" in "Sede" field
    And I press "Crear" button
    Then I should see "SedePrueba" in "NodoPrueba" row

@eraseNodo
@eraseSede
Scenario: try to create a Sede without name
    Given I press the "Nodo" button
    When I enter "NodoPrueba" in Nodo field
    And I press "Crear" button
    And I press "Sede" button of the "NodoPrueba" row
    And I press "Crear" button
    Then I should see the message "Los datos no pueden viajar vacios!"
