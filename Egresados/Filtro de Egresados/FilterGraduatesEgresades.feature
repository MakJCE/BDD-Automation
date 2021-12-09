Feature: See the graduates of nahual
	As a Nahual Reclutator or Nahual Administrator
	I want to see the graduates of Nahual
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

Scenario: Filter Graduates that currently are unemployed

    Given I push "Egresades" in left side menu
    When I push the Filter Icon button on the top of the table of graduates
    And I push the "Egresade" option
    Then I should see the state of the all graduates on "Egresade/Alumne" or "Egresade"


Scenario: Filter Graduates that currently have a job

    Given I push "Egresades" in left side menu
    When I push the Filter Icon button on the top of the table of graduates
    And I push the "Empleade" option
    Then I should see the state of the all graduates on "Empleade"

Scenario: Don't filter the graduates

    Given I push "Egresades" in left side menu
    When I push the Filter Icon button on the top of the table of graduates
    And I push the "Empleade" option
	And I see the "Empleade" number of graduates filtered
	And I push the "Egresade" option
	And I see the "Egresade" number of graduates filtered
	And I push the Filter Icon button on the top of the table of graduates
	And I push the "Todes" option
    Then I should see the total number of graduates should be equal to the sum of Egresade number and Empleade number

