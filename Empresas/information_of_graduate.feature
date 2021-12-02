Feature:  Get more information about the graduates
    As a User that need graduates to hire
    I want to view the information graduates
    In order to know more about the habilities of the graduates

Background: Loggin with Google account
	Given I am on the first page
	When I click "Iniciar Sesión" button
	And I click Iniciar con Google button
	And I enter my username
	And I click "Siguiente" button
	And I enter my password
	And I click "Siguiente" button
	And I click "Verificar Acceso" button


Scenario: View more information of graduate
	Given I push "Empresas" navlink
	When I push the first eye button
	Then I should see "Correo" title
	And I should see "Teléfono:" title
	And I should see "Fecha de nacimiento:" title
	And I should see "Nivel de inglés:" title
	And I should see "Sede:" title
	And I should see "Nodo:" title