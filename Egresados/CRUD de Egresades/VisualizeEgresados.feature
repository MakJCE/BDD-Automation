Feature: See the graduates of nahual
	As a Nahual Reclutator or Nahual Administrator
	I want to see the graduates of Nahual
	In ordert to see the current employment status of graduates
	And offer courses and work

Background: Loggin with Google account
	Given I am on the first page
	When I click "Iniciar Sesión" button
	And I click Iniciar con Google button
	And I enter my username
	And I click "Siguiente" button
	And I enter my password
	And I click "Siguiente" button
	And I click "Verificar Acceso" button


Scenario: See the personal data of a specific graduate
	Given I push "Egresades" in left side menu
	When I push "Ver" button of graduate row with the name "Celestino Calero Alcocer"
	Then I can see the personal data of the graduate
	And I can see his "Correo" should be "celestino.calero@gcorreo.com"
	And I can see his "Telefono" should be "10000002"


Scenario: See the personal data of a random graduate
	Given I push "Egresades" in left side menu
	When I push "Ver" button of random graduate row 
	Then I can see the personal data of the random graduate
	And I can see his "Telefono" datum