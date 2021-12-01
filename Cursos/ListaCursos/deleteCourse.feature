Feature: erase a course from the list of courses
    As a Nahual member
    I want to delete a course
    in order to erase it from the view of the page

Background: create a testing course before delete it
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

Scenario: Erase a course present in the list of courses
    Given I locate the row of the course with "Prueba" topic and "Juan" profesor
    When I click Eliminar button on the located row
    And I click "Confirmar" button
    Then the course with "Prueba" topic and "Juan" profesor should not be in the list of courses
