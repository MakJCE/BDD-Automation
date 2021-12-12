Feature: Certificate a Graduate 
	As a Nahual Administrator
	I want to Certificate a Graduate when he /she finish the course
	In ordert to to give him recognition of having finished the course

Background: Loggin with Google account
	Given I am on the first page
	And I click "Iniciar Sesión" button
	And I click Iniciar con Google button
	And I enter my username
	And I click "Siguiente" button
	And I enter my password
	And I click "Siguiente" button
	And I click "Verificar Acceso" button

Scenario: Certificate of a Specific Graduate
	Given I push "Egresades" in left side menu
	When I push "Certificado" button of graduate row with the name "Mahi Simpson Flanders"
	Then "Mahi Simpson Flanders" should been shown on the certificate name