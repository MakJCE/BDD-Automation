Feature:  graduates additional information
    As a User that need graduates to hire
    I want to view the information about the graduates
    In order to view more about the graduate

Scenario: View more information of graduate
	Given I push "Empresas" navlink
	When I push the first eye button
	Then I should see "Correo" title
	And I should see "Teléfono:" title
	And I should see "Fecha de nacimiento:" title
	And I should see "Nivel de inglés:" title
	And I should see "Sede:" title
	And I should see "Nodo:" title

Scenario: Filter for coursed module
	Given I push "Empresas" navlink
	When I push the "Filtrar" filter
	And I push the "Modulo Cursado" section
	And I push the "Introducción a la Programación" option of "Modulo Cursado" section
	And I push the first "MÓDULOS CURSADOS" button
    Then I should see the module "Introducción a la Programación" 