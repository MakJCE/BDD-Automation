Feature: delete a new Topico o one that already exists
    As a Nahual member
    I want to delete a Topico
    I order to remove the data from all Curso's information management

Background: Loggin with Google account
    Given I am on the first page
	And I click "Iniciar Sesión" button
    And I click Iniciar con Google button
    And I enter my username
    And I click "Siguiente" button
    And I enter my password
    And I click "Siguiente" button
    And I click "Verificar Acceso" button

@beforeTopicoIsCreated
Scenario: delete a new Topico
    Given I click "Cursos" in left side menu
    And I click "Topicos" section on the horizontal menu on top of the view
    When I locate the row of the Topico with "Topicodeejemplo" name 
    And I click Eliminar button on the located Topico
    And I click "Confirmar" button
    Then the Topico with "Topicodeejemplo" name should not to be in the list of topics