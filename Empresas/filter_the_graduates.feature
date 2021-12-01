Feature: Filter the graduates
    As a User that need graduates to hire
    I want to Filter the graduates currents
    In order to view the qualities as may be necessary

Scenario: Filter for Nodo
    Given I push "Empresas" navlink
    When I push the "Filtrar" filter
    And I push the "Nodo" section
	And I push the "CABA" option of "Nodo" section
    Then I should see a table with only "CABA" in "NODO" column

Scenario: Filter for level of english
	Given I push "Empresas" navlink
	When I push the "Filtrar" filter
	And I push the "Nivel de Ingles" section
	And I push the "Basico" option of "Nivel de Ingles" section
	Then I should see a table with only "Nivel de Ingles" in "Basico" column

Scenario: Deselect Nodo
	Given I push "Empresas" navlink
	When I push the "Filtrar" filter
	And I push the "Nodo" section
	And I push the "CABA" option of "Nodo" section
	And I deselect the "Nodo" label 
	Then I should see a table with many Nodos