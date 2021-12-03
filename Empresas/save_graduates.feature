Feature: select graduates for save in a document
    As a User that need graduates to hire
    I want to select graduates
    In order to save a list of graduates in a excel document

Background: Loggin with Google account
	Given I am on the first page
	When I click "Iniciar Sesión" button
	And I click Iniciar con Google button
	And I enter my username
	And I click "Siguiente" button
	And I enter my password
	And I click "Siguiente" button
	And I click "Verificar Acceso" button


Scenario: Save some graduates
	Given I push "Empresas" navlink
	When I push the first "3" checkboxs of the table
	Then the counter of export button must be "3"

Scenario: Mark and desmark graduates
	Given I push "Empresas" navlink
	When I push the first "4" checkboxs of the table
  	And I push the first "2" checkboxs of the table
	Then the counter of export button must be "2"