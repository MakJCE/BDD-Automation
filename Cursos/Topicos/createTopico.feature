Feature: use a new topic to create course
    As a Nahual member
    I want to use a new topic
    In order to assign it to new and already created courses

Background: access to the topic section
    Given I click "Cursos" in left side menu
    And I click "Topicos" section on the horizontal menu on top of the view

@afterTopicoIsDeleted
Scenario: create a new topic
    Given I click "Topico" button
    When I enter "<value>" in "Topico" field
    And I click "Crear" button
    Then the topic named "<value>" should be shown in the table of topics

Examples:
| value             |
| Topico de ejemplo |
| 1223.cr23         |