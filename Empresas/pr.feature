Feature: Filter the graduates
    As An user that needs to contact graduates to hire
    I want to Filter the graduates currents
    In order to view the qualities as may be necessary

Background: Loggin with Google account
	Given I am on the first page
	When I click "Iniciar Sesión" button
	And I click Iniciar con Google button
	And I enter my username
	And I click "Siguiente" button
	And I enter my password
	And I click "Siguiente" button
	And I click "Verificar Acceso" button

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