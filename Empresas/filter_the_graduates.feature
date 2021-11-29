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

    