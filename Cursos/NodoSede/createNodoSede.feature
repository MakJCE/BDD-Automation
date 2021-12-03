Feature: create a nodo-sede
    As a Nahual member
    I want to create a nodo-sede
    In order to assign it to courses in that location

Background: Loggin with Google account
    Given I am on the first page
    When I click "Iniciar Sesión" button
    And I click Iniciar con Google button
    And I enter my username
    And I click "Siguiente" button
    And I enter my password
    And I click "Siguiente" button
    And I click "Verificar Acceso" button

@afterNodoIsDeleted
Scenario Outline: create a new Nodo
    Given I click "Cursos" in left side menu
    And I click "Nodos Sedes" section on the horizontal menu on top of the view
    When I click "Nodo" button
    And I enter "<value>" in "Nodo" field
    And I click "Crear" button
    Then the nodo named "<value>" should be shown in the table of nodo-sede's

Examples:
| value      |
| Villa Rica |
| 1223.cr23  |

@afterNodoIsDeleted
@afterSedeIsDeleted
Scenario Outline: create a new Sede
    Given I click "Cursos" in left side menu
    And I click "Nodos Sedes" section on the horizontal menu on top of the view
    When I click "Nodo" button
    And I enter "Villa Rica" in "Nodo" field
    And I click "Crear" button
    And I locate the row of the Node with "Villa Rica" name
    And I click Sede button of the located row
    And I enter "<valueSede>" in "Sede" field
    And I click "Crear" button
    Then the sede named "<valueSede>" should be shown in sedes list of "Villa Rica" nodo

Examples:
| valueSede  |
| sedeuno    |
| 1223.cr23  |

