Feature: select graduates for save in a document
    As a User that need graduates to hire
    I want to select graduates
    In order to save a list of graduates in a excel document


Scenario: Save some graduates
	Given I push "Empresas" navlink
	When I push the first "3" checkboxs of the table
	Then the counter of export button must be "3"

Scenario: Mark and desmark graduates
	Given I push "Empresas" navlink
	When I push the first "4" checkboxs of the table
  And I push the first "2" checkboxs of the table
	Then the counter of export button must be "2"