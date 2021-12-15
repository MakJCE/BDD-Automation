Feature: Filter the graduates
    As An user that needs to contact graduates to hire
    I want to Filter the graduates currents
    In order to view the qualities as may be necessary

Background: Loggin with Google account
	Given I am on the first page
	And I click "Iniciar Sesión" button
	And I click Iniciar con Google button
	And I enter my username
	And I click "Siguiente" button
	And I enter my password
	And I click "Siguiente" button
	And I click "Verificar Acceso" button


Scenario Outline: Filter for column value
    Given I push "Empresas" in left side menu
    When I push the filter
    And I push the "<section>" section
	And I push the "<option>" option of "<section>" section
    Then I should see a table with only "<option>" in "<column>" column
Examples:
	|       section      |  option  |     column      |
	|         Nodo       | Santa Fe |      NODO       |
	|  Nivel de Ingles   |  Basico  | NIVEL DE INGLES |

Scenario: Filter for coursed module
	Given I push "Empresas" in left side menu
	When I push the filter
    And I push the "Modulo Cursado" section
	And I push the "pruebacalidad" option of "Modulo Cursado" section
	Then I should see the buttons "Ver modulos" in "MÓDULOS CURSADOS" column with the value "pruebacalidad"


Scenario Outline: Deselect filter section
    Given I push "Empresas" in left side menu
    When I push the filter
	And I push the "<section>" section
	And I push the "<option>" option of "<section>" section
	And I deselect the filter selected
	Then I should not see "<filter>" filtered section
Examples:
	|     section     |            option              |      filter       |
	|       Nodo      |             CABA               |      NODO         |
	|  Modulo Cursado | Introducción a la Programación | Modulo Completado |
	| Nivel de Ingles |            Basico              |  Nivel de Ingles  |

Scenario: Deselect all filters section
    Given I push "Empresas" in left side menu
    When I push the filter
	And I push the "Nodo" section
	And I push the "CABA" option of "Nodo" section
	And I deselect all filters 
	Then I should not see "Quitar Todos" filtered section