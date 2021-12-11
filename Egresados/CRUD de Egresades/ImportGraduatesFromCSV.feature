Feature: Add new graduates to the register of graduates from a .csv file
	As a Nahual Administrator
	I want to add new graduates from a list in a document .csv
	In order to add graduates more efficiently

Background: Loggin with Google account
	Given I am on the first page
	And I click "Iniciar Sesión" button
	And I click Iniciar con Google button
	And I enter my username
	And I click "Siguiente" button
	And I enter my password
	And I click "Siguiente" button
	And I click "Verificar Acceso" button

Scenario: Upload a valid list of graduates
    Given I push "Egresades" in left side menu
	When I click "Importar" button
	And I upload a valid format .csv file
	And I click "Confirmar" button
	Then A message of aprove must be showed

Scenario: Upload a invalid list of graduates
    Given I push "Egresades" in left side menu
	When I click "Importar" button
	And I upload a invalid format .csv file
	Then A message of error must be showed