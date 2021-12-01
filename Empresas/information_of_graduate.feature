Feature:  Get more information about the graduates
    As a User that need graduates to hire
    I want to view the information graduates
    In order to know more about the habilities of the graduates

Scenario: View more information of graduate
	Given I push "Empresas" navlink
	When I push the first eye button
	Then I should see "Correo" title
	And I should see "Teléfono:" title
	And I should see "Fecha de nacimiento:" title
	And I should see "Nivel de inglés:" title
	And I should see "Sede:" title
	And I should see "Nodo:" title