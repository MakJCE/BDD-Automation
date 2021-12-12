Feature: filter the list of courses
    As a Nahual member
    I want to filter the courses of a list by its state
    In order to enhance the search of courses

Background: Loggin with Google account
    Given I am on the first page
	And I click "Iniciar Sesión" button
    And I click Iniciar con Google button
    And I enter my username
    And I click "Siguiente" button
    And I enter my password
    And I click "Siguiente" button
    And I click "Verificar Acceso" button

Scenario Outline: filter courses with all states
    Given I click "Cursos" in left side menu
    When I click state box with down-triangle
    And I select "<state>" from the options
    Then The list should show courses with state "<state>"

Examples:
| state    |
| Activo   |
| Inactivo |
