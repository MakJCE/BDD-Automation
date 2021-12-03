Feature: edit the information of a product
    As a Nahual member
    I want to change the current description of a Course
    In order to manage the course description properly

Background: Loggin with Google account
    Given I am on the first page
    When I click "Iniciar Sesión" button
    And I click Iniciar con Google button
    And I enter my username
    And I click "Siguiente" button
    And I enter my password
    And I click "Siguiente" button
    And I click "Verificar Acceso" button

@beforeCourseIsCreated
@afterCourseIsDeleted
Scenario Outline: Edit a field of a course present in the list of courses
    Given I click "Cursos" in left side menu
    When I locate the row of the course with "Prueba" topic and Juan as profesor
    And I click Editar button on the located row
    And I change the "<field>" with the value "<value>"
    And I click "Editar" button of the form
    Then the course with "Prueba" topic and Juan profesor should have the "<value>" in the "<field>"

Examples:
| field       | value                 |
| Año         | 2000                  |
| Periodo     | 3                     |
| Sede - Nodo | Ituzaingó - Ituzaingó |
| Horario     | loquesea              |
