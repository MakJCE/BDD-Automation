Feature: delete a new Topico o one that already exists
    As a Nahual member
    I want to delete a Topico
    I order to remove the data from all Curso's information management

Background: access to the topic section
    Given I click "Cursos" in left side menu
    And I click "Topicos" section on the horizontal menu on top of the view
    And I click "Topico" button
    And I enter "Topico de ejemplo" in "Topico" field
    And I click "Crear" button

Scenario: delete a new Topico
    Given I locate the row of the Topico with "Topico de ejemplo" name 
    When I click Eliminar button on the located Topico
    And I click "Confirmar" button
    Then the Topico with "Topico de ejemplo" name should not to be in the list of topics