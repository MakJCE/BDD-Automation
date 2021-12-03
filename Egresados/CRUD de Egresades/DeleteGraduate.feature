Feature: Delete one graduate of nahual
	As a Nahual Reclutator or Nahual Administrator
	I want to delete the graduates of Nahual
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

Scenario: Filter Graduates that currently are unemployed

    Given I push "Egresades" in left side menu
    When I push the "Filter Icon" button on the top of the table of graduates
    And I push the "Egresade" option
    Then I should see the state of the all graduates on "Egresade/Alumne" or "Egresade"