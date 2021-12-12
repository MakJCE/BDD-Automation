Feature: Editting the name of a topic
    As a Nahual member
    I want to change the name of a topic
    In order to update the info managed in the app

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
@afterTopicoIsDeleted
Scenario Outline: Edit the name of a topic
    Given I click "Cursos" in left side menu
    And I click "Topicos" section on the horizontal menu on top of the view
    When I locate the topico named "Topicodeejemplo" in the list of Topicos
    And I click Editar button of that Topico
    And I enter "<value>" name in Topico field
    And I click Editar button confirmation
    Then the previous topic named "Topicodeejemplo" now its name is "<value>"

Examples:
| value        |
| topicotest   |
| 1223.cr23    |

@beforeTopicoIsCreated
@afterTopicoIsDeleted
Scenario: Try to change the name of a Topico with an empty name
    Given I click "Cursos" in left side menu
    And I click "Topicos" section on the horizontal menu on top of the view
    When I click Editar button of that Topico
    And I do not fill the name field
    Then Editar confirmation button should be disabled