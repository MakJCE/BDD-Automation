Feature: Filter the graduates
    As a User that needs to contact graduates to hire
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

Scenario: Filter for Nodo
    Given I push "Empresas" in left side menu
    When I push the "Filtrar" filter
    And I push the "Nodo" section
	And I push the "CABA" option of "Nodo" section
    Then I should see a table with only "CABA" in "NODO" column

Scenario: Filter for level of english
	Given I push "Empresas" in left side menu
	When I push the "Filtrar" filter
	And I push the "Nivel de Ingles" section
	And I push the "Basico" option of "Nivel de Ingles" section
	Then I should see a table with only "Basico" in "NIVEL DE INGLES" column

Scenario: Deselect Nodo
	Given I push "Empresas" in left side menu
	When I push the "Filtrar" filter
	And I push the "Nodo" section
	And I push the "CABA" option of "Nodo" section
	And I deselect the "Nodo" label 
	Then I should see a table with many Nodos

@duda
Scenario: Filter for coursed module
	Given I push "Empresas" in left side menu
	Then I should see the buttons "Ver modulos" in "MÓDULOS CURSADOS" column with the value "Testing Funcional"