Feature: use a new topic to create course
    As a Nahual member
    I want to use a new topic
    In order to assign it to new and already created courses

Background: Loggin with Google account
    Given I am on the first page
	And I click "Iniciar Sesión" button
    And I click Iniciar con Google button
    And I enter my username
    And I click "Siguiente" button
    And I enter my password
    And I click "Siguiente" button
    And I click "Verificar Acceso" button

@afterTopicoIsDeleted
Scenario Outline: create a new topic
    Given I click "Cursos" in left side menu
    And I click "Topicos" section on the horizontal menu on top of the view
    When I click "Topico" button
    And I enter "<value>" in "Topico" field
    And I click "Crear" button
    Then the topic named "<value>" should be shown in the table of topics

Examples:
| value             |
| Topico de ejemplo |
| 1223.cr23         |