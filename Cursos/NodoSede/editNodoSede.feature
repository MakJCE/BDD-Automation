Feature: edit a Sede of a Nodo
    As a Nahual member
    I want to change the name of a Sede
    In order to update to info on the app

Background: Loggin with Google account
    Given I am on the first page
	And I click "Iniciar Sesión" button
    And I click Iniciar con Google button
    And I enter my username
    And I click "Siguiente" button
    And I enter my password
    And I click "Siguiente" button
    And I click "Verificar Acceso" button

@beforeNodoIsCreated
@beforeSedeIsCreated
@afterSedeIsDeleted
Scenario Outline: edit a Sede of a Nodo
    Given I click "Cursos" in left side menu
    And I click "Nodos Sedes" section on the horizontal menu on top of the view
    When I locate the row of the Nodo with "Villa Rica" name 
    And I locate the Sede named "sedeuno" in previuos Nodo
    And I click Editar button on the located Sede
    And I enter "<value>" in "Sede" field
    And I click "Editar" button
    Then the previuos Sede named "sedeuno" now is named "<value>"

Examples:
| value   |
| sededos |
| dh73.d, |