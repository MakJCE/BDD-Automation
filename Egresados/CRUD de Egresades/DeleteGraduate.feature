Feature: Delete one graduate of nahual
	As a Nahual Administrator
	I want to delete the graduates of Nahual
	In ordert to see the current employment status of graduates
	And offer courses and work

Background: Loggin with Google account
	Given I am on the first page
	And I click "Iniciar Sesión" button
	And I click Iniciar con Google button
	And I enter my username
	And I click "Siguiente" button
	And I enter my password
	And I click "Siguiente" button
	And I click "Verificar Acceso" button

Scenario: Cancel a Deletion of a inactive graduate of the register
	Given I push "Egresades" in left side menu
	When I push "Eliminar" button of graduate row with the name "Mahi Simpson Flanders"
    And I push "Cancelar" button on the confirmation message
	Then "Mahi Simpson Flanders" should been shown on the register

Scenario: Delete a inactive graduate of the register 
	Given I push "Egresades" in left side menu
	When I push "Eliminar" button of graduate row with the name "Sebastian Paredes Fernandez"
    And I push "Confirm" button on the confirmation message
	Then "Sebastian Paredes Fernandez" should't been show on the register