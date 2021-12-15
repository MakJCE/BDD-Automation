Feature: select graduates for save in a document
    As An user that needs to contact graduates to hire
    I want to select graduates
    In order to save a list of graduates in a excel document

Background: Loggin with Google account
	Given I am on the first page
	And I click "Iniciar Sesión" button
	And I click Iniciar con Google button
	And I enter my username
	And I click "Siguiente" button
	And I enter my password
	And I click "Siguiente" button
	And I click "Verificar Acceso" button

Scenario: Select some graduates of the table
	Given I push "Empresas" in left side menu
	When I push the first "3" checkboxs of the table
	Then the counter of export button must be "3"

Scenario: Select and deselect some graduates of the table
	Given I push "Empresas" in left side menu
	When I push the first "4" checkboxs of the table
  	And I push the first "2" checkboxs of the table
	Then the counter of export button must be "2"
