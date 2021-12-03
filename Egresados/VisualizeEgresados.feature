Feature: See the graduates of nahual
	As a Nahual Reclutator or Nahual Administrator
	I want to see the graduates of Nahual
	In ordert to see the current employment status of graduates
	And offer courses and work

@beforeNeedToLoggin
Background:
	Given I push "Verificar Acceso" button

Scenario: See the personal data of a random graduate
	Given I push "Egresades" button
	When I push "Ver" button of egresade  column with the name  "Celestino Calero Alcocer"
	Then I can see the personaldata of the graduate
	And I can see the modules completed
	And I can see the modules that not completed
	And I can see the jobs that the graduate had

Scenario: See the personal data of a specific graduate
	Given I push "Egresades" button
	When I push "Ver" button of egresade a column with the name "Celestino Calero Alcocer"
	Then I can see the personaldata of the graduate
	And I can see the modules completed
	And I can see the modules that not completed
	And I can see the jobs that the graduate had
