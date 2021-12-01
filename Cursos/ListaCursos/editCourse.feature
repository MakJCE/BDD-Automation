Feature: edit the information of a product
    As a Nahual member
    I want to change the current description of a Course
    In order to manage the course description properly

Background: create a testing course before update it
    Given I click "Cursos" in left side menu
    And I click "Nuevo Curso" button
    And I enter "2021" in "Año" field
    And I enter "2" in "Periodo" field
    And I enter "Activo" in "Estado" dropdown
    And I enter "Egresades" in "Curso Para:" dropdown
    And I enter "Prueba" in "Topico" dropdown
    And I enter "Intive - CABA" in "Sede - Nodo" dropdown
    And I enter "Tarde(14-16)" in "Horario" field
    And I enter "Juan" in "Profesor" field
    And I enter "prueba" in "Notas" textarea
    And I click "Confirmar" button

@afterCourseIsDeleted
Scenario Outline: Edit a field of a course present in the list of courses
    Given I locate the row of the course with "Prueba" topic and Juan as profesor
    When I click Editar button on the located row
    And I change the "<field>" with the value "<value>"
    And I click "Editar" button of the form
    Then the course with "Prueba" topic and Juan profesor should have the "<value>" in the "<field>"

Examples:
| field       | value                 |
| Año         | 2000                  |
| Periodo     | 3                     |
| Sede - Nodo | Ituzaingó - Ituzaingó |
| Horario     | loquesea              |
